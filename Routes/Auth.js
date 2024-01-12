import express from "express";
import {
  getUsers,
  Register,
  Login,
  Logout,
  getMe,
} from "../Controllers/Auth.js";
// import { refreshToken } from "../Controllers/RefreshToken.js";
import { access, privateRoutes } from "../Middleware/Private.js";

const router = express.Router();

router.get(
  "/Users",
  privateRoutes,
  access("Admin", "SuperAdmin", "Manajemen"),
  getUsers
);
router.post("/Users", Register);
router.post("/Login", Login);
router.get("/getMe", privateRoutes, getMe);
router.get("/Logout", Logout);
// router.get("/token", refreshToken);

export default router;
