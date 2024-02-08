import express from "express";

import { access, privateRoutes } from "../Middleware/Private.js";
import {
  deletedPengajuan,
  getAllPengajuan,
  getPengajuanById,
  getPengajuanByUsers,
  konfirmasiPengajuan,
  laporan,
  pengajuan,
  updatePengajuan,
} from "../Controllers/Pengajuan.js";
import multer from "../Middleware/multer.js";
import multer_transfer from "../Middleware/multer_transfer.js";
import { sendEmail } from "../Middleware/nodemailer.js";

const router = express.Router();

router.get("/pengajuan", getAllPengajuan);
router.get("/pengajuanUsers", privateRoutes, getPengajuanByUsers);
router.get("/pengajuan/:id", getPengajuanById);
router.get("/laporan", privateRoutes, laporan);
router.post("/pengajuan", multer, sendEmail, pengajuan);
router.patch("/updatePengajuan/:id", multer, updatePengajuan);
router.patch("/konfirmasi/:id", multer_transfer, konfirmasiPengajuan);
router.patch("/pengajuan/:id", deletedPengajuan);

export default router;
