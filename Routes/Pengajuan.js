import express from "express";

import { access, privateRoutes } from "../Middleware/Private.js";
import {
  deletedPengajuan,
  getAllPengajuan,
  getPengajuanById,
  getPengajuanByUsers,
  konfirmasiPengajuan,
  pengajuan,
  updatePengajuan,
} from "../Controllers/Pengajuan.js";
import multer from "../Middleware/multer.js";
import multer_transfer from "../Middleware/multer_transfer.js";

const router = express.Router();

router.get("/pengajuan", getAllPengajuan);
router.get("/pengajuanUsers", privateRoutes, getPengajuanByUsers);
router.get("/pengajuan/:id_pengajuan", getPengajuanById);
router.post("/pengajuan", multer, pengajuan);
router.patch("/updatePengajuan/:id_pengajuan", multer, updatePengajuan);
router.patch("/konfirmasi/:id_pengajuan", multer_transfer, konfirmasiPengajuan);
router.patch("/pengajuan/:id_pengajuan", deletedPengajuan);

export default router;
