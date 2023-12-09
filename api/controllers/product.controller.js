import { config } from "dotenv";
import jwt from "jsonwebtoken";
import { v2 as cloudinary } from "cloudinary";
import fs from "fs";

import configureCloudinary from "../configs/cloudinary.config.js";
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

    const { name, price, description, image, star } = req.body;

    jwt.verify(token, secret, async (err, info) => {
      if (err) throw err;
      try {
        const newProduct = await Food.create({
          name,
          price,
          description,
          image,
          star,
          author: info.id,
        });

        res.status(200).json(newProduct);
      } catch (error) {
        res.status(500).json({ message: error.message });
      }
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Server is error!" });
  }
};

export const getAllProducts = async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const elementPage = 10;

    const totalProducts = await Food.countDocuments();
    const totalPages = Math.ceil(totalProducts / elementPage);

    const products = await Food.find()
      .populate("author", "reviews", ["name", "price", "description", "image", "star"])
      .sort({ createdAt: -1 })
      .skip((page - 1) * elementPage)
      .limit(elementPage);

    res.status(200).json({
      totalPages: totalPages,
      totalProducts: totalProducts,
      currentPage: page,
      products: products,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Server is error!" });
  }
};

export const getProductById = async (req, res) => {
  try {
    const { id } = req.params;
    const product = await Food.findById(id).populate("author", "reviews", [
      "name",
      "price",
      "description",
      "image",
      "star",
    ]);

    res.status(200).json(product);
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Server is error!" });
  }
};

export const updateProductById = async (req, res) => {
  try {
    const { name, price, description, image, star } = req.body;
    const { id } = req.params;

    const product = await Food.findById(id);

    if (!product) {
      return res.status(404).json({ message: "Product not found!" });
    }

    const { token } = req.cookies;

    if (!token) {
      return res.status(401).json({ error: "No token provided!" });
    }

    jwt.verify(token, secret, {}, async (err, info) => {
      if (err) throw err;
      try {
        const updateProduct = await Food.findByIdAndUpdate(
          id,
          {
            name: name !== "" ? name : product.name,
            price: price !== "" ? price : product.price,
            description: description !== "" ? description : product.description,
            image: image !== "" ? image : product.image,
            star: star !== "" ? star : product.star,
          },
          {
            new: true,
          }
        );

        res.status(200).json(updateProduct);
      } catch (error) {
        res.status(400).json({ message: error.message });
      }
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Server is error!" });
  }
};

export const deleteProductById = async (req, res) => {
  try {
    const { id } = req.params;

    const { token } = req.cookies;

    if (!token) {
      return res.status(401).json({ error: "No token provided" });
    }

    jwt.verify(token, secret, {}, async (err, info) => {
      if (err) throw err;
      try {
        const product = await Food.findById(id);
        
        if (!product) {
          return res.status(404).json({ message: "Product not found!" });
        }
        await Food.findByIdAndDelete(id);
        res.status(200).json("Product deleted successfully!");
      } catch (error) {
        res.status(400).json({ message: error.message });
      }
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Server is error!" });
  }
};
