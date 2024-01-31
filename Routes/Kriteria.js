import express from "express";
import {
  deletedKriteria,
  getKriteria,
  tambahKriteria,
  updateKriteria,
} from "../Controllers/Kriteria.js";

const router = express.Router();

router.get("/kriteria", getKriteria);
router.post("/kriteria", tambahKriteria);
router.patch("/updateKriteria/:id", updateKriteria);
router.patch("/kriteria/:id", deletedKriteria);

export default router;
