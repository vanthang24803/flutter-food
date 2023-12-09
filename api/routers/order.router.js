import express from "express";

import { create } from "../controllers/order.controller.js";

const router = express.Router();

router.post("/order", create);

export default router;
