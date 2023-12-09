import express from "express";

import {
  create,
  getAllProducts,
  getProductById,
  updateProductById,
  deleteProductById,
} from "../controllers/product.controller.js";

const router = express.Router();

router.post("/product", create);
router.get("/products", getAllProducts);
router.get("/product/:id", getProductById);
router.patch("/product/:id", updateProductById);
router.delete("/product/:id", deleteProductById);

export default router;
