import express from "express";
import {
  deletedKeuangan,
  getKeuangan,
  tambahKeuangan,
  totalDana,
  updateKeuangan,
} from "../Controllers/Keuangan.js";
import { access, privateRoutes } from "../Middleware/Private.js";

const router = express.Router();

router.get(
  "/keuangan",
  privateRoutes,
  access("Admin", "SuperAdmin"),
  getKeuangan
);
router.get("/totalDana", totalDana);
router.post("/keuangan", tambahKeuangan);
router.patch("/updateKeuangan/:id", updateKeuangan);
router.patch("/keuangan/:id", deletedKeuangan);

export default router;
