import jwt, { decode } from "jsonwebtoken";
import db from "../Config/Db.js";

export const privateRoutes = async (req, res, next) => {
  let token = req.cookies.token;
  if (!token) {
    return res
      .status(401)
      .json({ success: false, msg: "Anda tidak punya Akses!" });
  }
  try {
    const decoded = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET);
    const userDetail = await db.execute(`SELECT * FROM users WHERE id = ?`, [
      decoded.id,
    ]);
    req.user = userDetail[0][0];
    // return res.status(400).json({ success: false, msg: req.user });
    next();
  } catch (error) {
    res.status(500).json({ success: false, msg: error.message });
  }
};

export function access(...permittedRoles) {
  // return a middleware
  return (req, res, next) => {
    const user = req.user;

    if (user && permittedRoles.includes(user.role)) {
      next(); // role is allowed, so continue on the next middleware
    } else {
      res.status(401).json({ message: "Kamu Tidak Punya Akses" }); // user is forbidden
    }
  };
}
