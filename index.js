import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import cookieParser from "cookie-parser";
import AuthRoutes from "./Routes/Auth.js";

dotenv.config();
const app = express();

app.use(cors({ credentials: true, origin: "http://localhost:5173" }));
app.use(cookieParser());
app.use(express.json());
app.use(AuthRoutes);

app.listen(process.env.APP_PORT, () => {
  console.log(`http://localhost:${process.env.APP_PORT}`);
});
