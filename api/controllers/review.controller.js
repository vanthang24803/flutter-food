import { config } from "dotenv";
import jwt from "jsonwebtoken";
import { v2 as cloudinary } from "cloudinary";
import fs from "fs";

import configureCloudinary from "../configs/cloudinary.config.js";
import Review from "../models/review.model.js";
import Food from "../models/food.model.js";

config();
configureCloudinary();
const secret = process.env.SCRET_TOKEN;

export const create = async (req, res) => {
  try {
    if (!req.cookies) {
      return res.status(400).send({ message: "No cookies provided!" });
    }

    const { token } = req.cookies;

    if (!token) {
      return res.status(401).json({ message: "Unauthorized!" });
    }

    const { id } = req.params;
    const product = await Food.findById(id);

    if (!product) {
      return res.status(404).json({ message: "Product not found!" });
    }

    const { title, star } = req.body;

    jwt.verify(token, secret, {}, async (err, info) => {
      if (err) throw err;
      try {
        const newReview = await Review.create({
          title,
          star,
          author: {
            id: info.id,
            username: info.username,
          },
        });

        res.status(200).json(newReview);
      } catch (error) {
        res.status(400).json({ message: error.message });
      }
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Server is error!" });
  }
};

export const getAllReviewById = async (req, res) => {
  try {
    const { id } = req.params;
    const product = await Food.findById(id);

    if (!product) {
      return res.status(404).json({ message: "Product not found!" });
    }

    const page = parseInt(req.query.page) || 1;
    const elementPage = 10;

    const totalReviews = await Review.countDocuments();
    const totalPages = Math.ceil(totalReviews / elementPage);

    const reviews = await Review.find()
      .populate("author", ["title", "star"])
      .sort({ createdAt: -1 })
      .skip((page - 1) * elementPage)
      .limit(elementPage);

    res.status(200).json({
      totalPages: totalPages,
      totalReviews: totalReviews,
      currentPage: page,
      reviews: reviews,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Server is error!" });
  }
};

export const updateReviewById = async (req, res) => {
  try {
    if (!req.cookies) {
      return res.status(400).send({ message: "No cookies provided!" });
    }

    const { token } = req.cookies;

    if (!token) {
      return res.status(401).json({ message: "Unauthorized!" });
    }

    const { productId, reviewId } = req.params;

    const product = await Food.findById(productId);

    if (!product) {
      return res.status(404).json({ message: "Product not found!" });
    }

    const review = await Review.findById(reviewId);

    if (!review) {
      return res.status(404).json({ message: "Review not found!" });
    }

    jwt.verify(token, secret, {}, async (err, info) => {
      if (err) throw err;
      try {
        const { title, star } = req.body;

        const updateFields = {};

        if (title !== undefined) {
          updateFields.title = title;
        }

        if (star !== undefined) {
          updateFields.star = star;
        }

        const updateReview = await Review.findByIdAndUpdate(
          reviewId,
          { $set: updateFields },
          {
            new: true,
          }
        );

        res.status(200).json(updateReview);
      } catch (error) {
        res.status(400).json({ message: error.message });
      }
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Server is error!" });
  }
};

export const deleteReviewById = async (req, res) => {
  try {
    if (!req.cookies) {
      return res.status(400).send({ message: "No cookies provided!" });
    }

    const { token } = req.cookies;

    if (!token) {
      return res.status(401).json({ message: "Unauthorized!" });
    }

    const { productId } = req.params;

    const product = await Food.findById(productId);

    if (!product) {
      return res.status(404).json({ message: "Product not found!" });
    }

    jwt.verify(token, secret, {}, async (err, info) => {
      try {
        const { reviewId } = req.params;

        const review = await Review.findById(reviewId);

        if (!review) {
          return res.status(404).json({ message: "Review not found!" });
        }

        await Review.findByIdAndDelete(reviewId);
        res.status(200).json("Review deleted successfully!");
      } catch (error) {
        res.status(400).json({ message: error.message });
      }
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Server is error!" });
  }
};
