import db from "../Config/Db.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export const getUsers = async (req, res) => {
  try {
    const query = await db.execute(`SELECT * FROM users`);
    const users = query[0]; // Mendapatkan data hasil query dari index 0 pada array

    return res.json(users);
  } catch (error) {
    console.error("Terjadi kesalahan:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};

export const Register = async (req, res) => {
  const { nama, username, password, role, email, no_telepon } = req.body;

  if (!nama || !username || !password || !role || !email || !no_telepon) {
    return res.status(400).json({ failed: "Data tidak lengkap." });
  }

  try {
    const isUserExist = await db.execute(
      `SELECT * FROM users WHERE username = ?;`,
      [username]
    );
    const isEmailExist = await db.execute(
      `SELECT * FROM users WHERE email = ?;`,
      [email]
    );

    if (isUserExist[0].length > 0 && isEmailExist[0].length > 0) {
      return res.status(200).json({
        failed: "Username dan Email sudah digunakan",
      });
    } else if (isUserExist[0].length > 0) {
      return res.status(200).json({
        failed: "Username sudah digunakan",
      });
    } else if (isEmailExist[0].length > 0) {
      return res.status(200).json({
        failed: "Email sudah digunakan",
      });
    } else {
      const salt = await bcrypt.genSalt();
      const hashPassword = await bcrypt.hash(password, salt);

      await db.query(
        `
        INSERT INTO users (nama, username, password, role, email, no_telepon)
        VALUES (?, ?, ?, ?, ?, ?);`,
        [nama, username, hashPassword, role, email, no_telepon]
      );
      return res.status(200).json({
        success: "Akun berhasil dibuat.",
      });
    }
  } catch (err) {
    console.error(err);
    return res.status(500).json({ failed: "Terjadi kesalahan pada server" });
  }
};

export const Login = async (req, res) => {
  const { username, password } = req.body;
  try {
    // Pengecekan apakah username ditemukan
    const [user] = await db.execute(`SELECT * FROM users WHERE username = ?`, [
      username,
    ]);

    if (user.length === 0) {
      return res.status(404).json({ msg: "Email atau password salah" });
    }

    // Pengecekan apakah password ditemukan
    if (!user[0].password) {
      return res
        .status(404)
        .json({ msg: "Username atau password tidak ditemukan" });
    }

    // Pengecekan kecocokan password
    const isPasswordMatch = await bcrypt.compare(password, user[0].password);
    if (!isPasswordMatch) {
      return res.status(404).json({ msg: "Password salah" });
    }

    // Menggunakan nama variabel yang berbeda, misalnya loggedInUsername
    const userId = user[0].id;
    const loggedInUsername = user[0].username;
    const nama = user[0].nama;
    const email = user[0].email;
    const role = user[0].role;
    const no_telepon = user[0].no_telepon;
    const accessToken = jwt.sign(
      { userId, username: loggedInUsername, nama, email, role, no_telepon },
      process.env.ACCESS_TOKEN_SECRET,
      {
        expiresIn: "15s",
      }
    );
    const refreshToken = jwt.sign(
      { userId, nama, email },
      process.env.REFRESH_TOKEN_SECRET,
      {
        expiresIn: "1d",
      }
    );

    // Perbaikan pada bagian ini, menggunakan await untuk menunggu eksekusi query selesai
    await db.execute(`UPDATE Users SET refreshToken = ? WHERE id = ?`, [
      refreshToken,
      userId,
    ]);

    res.cookie("refreshToken", refreshToken, {
      httpOnly: true,
      maxAge: 24 * 60 * 60 * 1000,
      // secure: true
    });

    return res.json({ accessToken });
  } catch (error) {
    console.error("Terjadi kesalahan:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};

export const Logout = async (req, res) => {
  const refreshToken = req.cookies.refreshToken;
  if (!refreshToken) return res.sendStatus(204);

  try {
    const [user] = await db.execute(
      `SELECT id FROM users WHERE refreshToken = ?`,
      [refreshToken]
    );

    if (!user || !user.length) return res.sendStatus(204);

    const userId = user[0].id;
    await db.execute(`UPDATE Users SET refreshToken = null WHERE id = ?`, [
      userId,
    ]);

    res.clearCookie("refreshToken");
    return res.sendStatus(200);
  } catch (error) {
    console.error("Terjadi kesalahan:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};
