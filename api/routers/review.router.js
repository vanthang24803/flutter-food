import express from "express";
import { create, getAllReviewById, updateReviewById, deleteReviewById } from "../controllers/review.controller.js";

const router = express.Router();

router.post("/product/:id/review", create);
router.get("/product/:id/reviews", getAllReviewById);
router.patch("/product/:productId/review/:reviewId", updateReviewById);
router.delete("/product/:productId/review/:reviewId", deleteReviewById);

export default router;
