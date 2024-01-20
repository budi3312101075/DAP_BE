import express from "express";

import { access, privateRoutes } from "../Middleware/Private.js";
import { konfirmasiPengajuan, pengajuan } from "../Controllers/Pengajuan.js";
import multer from "../Middleware/multer.js";
import multer_transfer from "../Middleware/multer_transfer.js";

const router = express.Router();

router.post("/pengajuan", multer, pengajuan);
router.patch("/konfirmasi/:id_pengajuan", multer_transfer, konfirmasiPengajuan);

export default router;
