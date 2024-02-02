import express from "express";
import {
  deletedKeuangan,
  getKeuangan,
  tambahKeuangan,
  updateKeuangan,
} from "../Controllers/Keuangan.js";

const router = express.Router();

router.get("/keuangan", getKeuangan);
router.post("/keuangan", tambahKeuangan);
router.patch("/updateKeuangan/:id", updateKeuangan);
router.patch("/keuangan/:id", deletedKeuangan);

export default router;
