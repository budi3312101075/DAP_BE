import jwt from "jsonwebtoken";
import db from "../Config/Db.js";

export const refreshToken = async (req, res) => {
  try {
    const refreshToken = req.cookies.refreshToken;
    if (!refreshToken) return res.sendStatus(401);
    const user = await db.execute(
      `SELECT * FROM users WHERE refreshToken = ?`,
      [refreshToken]
    );
    if (!user[0]) return res.sendStatus(403);
    jwt.verify(
      refreshToken,
      process.env.REFRESH_TOKEN_SECRET,
      (err, decoded) => {
        if (err) return res.sendStatus(403);
        const userId = user[0].id;
        const nama = user[0].nama;
        const username = user[0].username;
        const email = user[0].email;
        const role = user[0].role;
        const accessToken = jwt.sign(
          { userId, nama, username, email, role },
          process.env.ACCESS_TOKEN_SECRET,
          {
            expiresIn: "15s",
          }
        );
        res.json({ accessToken });
      }
    );
  } catch (error) {
    console.log(error);
  }
};
