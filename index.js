import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import cookieParser from "cookie-parser";
import AuthRoutes from "./Routes/Auth.js";
import PengajuanRoutes from "./Routes/Pengajuan.js";
import KriteriaRoutes from "./Routes/Kriteria.js";
import KeuanganRoutes from "./Routes/Keuangan.js";
import { fileDir } from "./Utils/file_handler.cjs";

dotenv.config();
const app = express();

app.use(
  cors({
    origin: process.env.CORS,
    credentials: true,
  })
);
app.use(express.static(fileDir()));

app.use(cookieParser());
app.use(express.json());
app.use(AuthRoutes);
app.use(PengajuanRoutes);
app.use(KriteriaRoutes);
app.use(KeuanganRoutes);

app.listen(process.env.APP_PORT, () => {
  console.log(`http://localhost:${process.env.APP_PORT}`);
});
