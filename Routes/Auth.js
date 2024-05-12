import express from "express";
import {
  getUsers,
  Register,
  Login,
  Logout,
  getMe,
  blockUser,
  updateUser,
  deletedUser,
  resetPassword,
  resetPasswordAdmin,
} from "../Controllers/Auth.js";
// import { refreshToken } from "../Controllers/RefreshToken.js";
import { access, privateRoutes } from "../Middleware/Private.js";

const router = express.Router();

router.get("/Users", privateRoutes, access("Admin", "SuperAdmin"), getUsers);
router.post("/Users", Register);
router.patch("/Users/:id", privateRoutes, updateUser);
router.patch("/deletedUser/:id", privateRoutes, deletedUser);
router.patch("/resetPassword/:id", privateRoutes, resetPassword);
router.patch(
  "/resetPasswordAdmin/:id",
  privateRoutes,
  access("SuperAdmin"),
  resetPasswordAdmin
);
router.post("/Login", Login);
router.get("/getMe", privateRoutes, getMe);
router.get("/Logout", Logout);
router.post("/blockUser/:id", blockUser);
// router.get("/token", refreshToken);

export default router;
