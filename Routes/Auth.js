import express from "express";
import { getUsers, Register, Login, Logout } from "../Controllers/Auth.js";
import { VerifyToken } from "../Middleware/VerifyToken.js";
import { refreshToken } from "../Controllers/RefreshToken.js";

const router = express.Router();

router.get("/Users", VerifyToken, getUsers);
router.post("/Users", Register);
router.post("/Login", Login);
router.delete("/Logout", Logout);
router.get("/token", refreshToken);

export default router;
