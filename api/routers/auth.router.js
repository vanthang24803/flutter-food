import express from "express";
import { resgister, login, getProfile, logout, updateProfile } from "../controllers/auth.controller.js";
import uploadMiddleware from "../middleware/multer.middleware.js";

const router = express.Router();

router.post("/register", resgister);
router.post("/login", login);
router.post("/logout", logout);
router.patch("/profile", updateProfile);
router.get("/profile", uploadMiddleware.single("image"), getProfile);

export default router;
