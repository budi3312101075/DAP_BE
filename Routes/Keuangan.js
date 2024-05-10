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

router.get("/keuangan", privateRoutes, getKeuangan);
router.get("/totalDana", privateRoutes, totalDana);
router.post("/keuangan", privateRoutes, tambahKeuangan);
router.patch("/updateKeuangan/:id", privateRoutes, updateKeuangan);
router.patch("/keuangan/:id", privateRoutes, deletedKeuangan);

export default router;
