import db from "../Config/Db.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export const getUsers = async (req, res) => {
  try {
    const query = await db.execute(
      `SELECT users.id, users.nama, users.username, users.role, users.email, users.no_telepon, users.is_Blocked FROM users WHERE users.is_Deleted = 0;`
    );
    const users = query[0]; // Mendapatkan data hasil query dari index 0 pada array

    return res.status(200).json({ success: true, data: users });
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
      `SELECT * FROM users WHERE username = ? AND is_Deleted = 0;`,
      [username]
    );
    const isEmailExist = await db.execute(
      `SELECT * FROM users WHERE email = ? AND is_Deleted = 0;`,
      [email]
    );

    if (isUserExist[0].length > 0 && isEmailExist[0].length > 0) {
      return res.status(400).json({
        failed: "Username dan Email sudah digunakan",
      });
    } else if (isUserExist[0].length > 0) {
      return res.status(400).json({
        failed: "Username sudah digunakan",
      });
    } else if (isEmailExist[0].length > 0) {
      return res.status(400).json({
        failed: "Email sudah digunakan",
      });
    } else {
      const salt = await bcrypt.genSalt();
      const hashPassword = await bcrypt.hash(password, salt);

      await db.query(
        `
        INSERT INTO users (nama, username, password, role, email, no_telepon, is_Deleted, is_Blocked)
        VALUES (?, ?, ?, ?, ?, ?, 0, 0);`,
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
    const [user] = await db.execute(
      `SELECT * FROM users WHERE username = ? and is_Deleted = 0 and is_Blocked = 0`,
      [username]
    );

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

    let body = { loggedInUsername, nama, role, no_telepon };
    const token = jwt.sign(
      {
        id: userId,
        username: loggedInUsername,
        nama: nama,
        email: email,
        role: role,
        no_telepon: no_telepon,
      },
      process.env.ACCESS_TOKEN_SECRET,
      {
        expiresIn: "1d",
      }
    );

    const options = {
      httpOnly: true,
      maxAge: 3600000 * 1 * 24,
    };

    return res
      .status(200)
      .cookie("token", token, options)
      .json({ success: true, data: token });
  } catch (error) {
    console.error("Terjadi kesalahan:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};

export const Logout = async (req, res) => {
  try {
    res
      .status(200)
      .clearCookie("token")
      .json({ success: true, msg: "Logout Berhasil!" });
  } catch (error) {
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};

export const getMe = async (req, res) => {
  // return res.status(500).json({ success: false, msg:  req.user.token });
  try {
    const getMe = await db.execute(`SELECT * FROM users WHERE id = ?`, [
      // req.user.token,
      req.user.id,
    ]);
    res.status(200).json({ success: true, data: getMe[0] });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

export const blockUser = async (req, res) => {
  const { id } = req.params;
  try {
    const dataUser = await db.execute(
      `SELECT is_Blocked FROM users WHERE id = ?`,
      [id]
    );

    if (dataUser[0][0].is_Blocked === 1) {
      await db.execute(`UPDATE users SET is_Blocked = 0 WHERE id = ?;`, [id]);
      return res
        .status(200)
        .json({ success: true, msg: "Akun Berhasil di unblock!" });
    }

    if (dataUser[0][0].is_Blocked === 0) {
      await db.execute(`UPDATE users SET is_Blocked = 1 WHERE id = ?;`, [id]);
      return res
        .status(200)
        .json({ success: true, msg: "Akun Berhasil di block!" });
    }
  } catch (error) {
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};

export const updateUser = async (req, res) => {
  const { id } = req.params;
  const { nama, username, email, no_telepon, role } = req.body;
  try {
    const isUserExist = await db.execute(
      `SELECT * FROM users WHERE username = ? AND id != ? AND is_Deleted = 0;`,
      [username, id]
    );

    const isEmailExist = await db.execute(
      `SELECT * FROM users WHERE email = ? AND id != ? AND is_Deleted = 0;`,
      [email, id]
    );

    if (isUserExist[0].length > 0 && isEmailExist[0].length > 0) {
      return res.status(400).json({
        failed: "Username dan Email sudah digunakan",
      });
    } else if (isUserExist[0].length > 0) {
      return res.status(400).json({
        failed: "Username sudah digunakan",
      });
    } else if (isEmailExist[0].length > 0) {
      return res.status(400).json({
        failed: "Email sudah digunakan",
      });
    } else {
      if (req.user.role == "Karyawan") {
        await db.execute(
          `UPDATE users SET username = ?, email = ?, no_telepon = ? WHERE id = ?;`,
          [username, email, no_telepon, id]
        );
        return res
          .status(200)
          .json({ success: true, msg: "Akun Berhasil di update!" });
      } else if (req.user.role == "SuperAdmin") {
        await db.execute(
          `UPDATE users SET nama = ?, username = ?, email = ?, no_telepon = ?, role = ? WHERE id = ?;`,
          [nama, username, email, no_telepon, role, id]
        );
        return res
          .status(200)
          .json({ success: true, msg: "Akun Berhasil di update!" });
      }
    }
  } catch (error) {
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};

export const resetPassword = async (req, res) => {
  const { id } = req.params;
  const { currentPassword, newPassword, confirmPassword } = req.body;

  try {
    const dbPassword = await db.execute(
      `SELECT users.password FROM users WHERE id = ?;`,
      [id]
    );

    const isPasswordMatch = await bcrypt.compare(
      currentPassword,
      dbPassword[0][0].password
    );

    if (!isPasswordMatch) {
      return res.status(400).json({ msg: "Password yang anda masukkan salah" });
    }

    if (newPassword !== confirmPassword) {
      return res
        .status(400)
        .json({ msg: "Password baru dan konfirmasi password tidak sesuai" });
    }

    const salt = await bcrypt.genSalt();
    const hashPassword = await bcrypt.hash(newPassword, salt);

    await db.execute(`UPDATE users SET password = ? WHERE id = ?;`, [
      hashPassword,
      id,
    ]);

    return res.status(200).json({ msg: "Password berhasil diubah" });
  } catch (error) {
    console.error("Error:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan" });
  }
};

export const deletedUser = async (req, res) => {
  const { id } = req.params;
  try {
    await db.execute(`UPDATE users SET is_Deleted = 1 WHERE id = ?;`, [id]);
    return res
      .status(200)
      .json({ success: true, msg: "Akun Berhasil di hapus!" });
  } catch (error) {
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};
