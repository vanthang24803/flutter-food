import { config } from "dotenv";
import jwt from "jsonwebtoken";
import { v2 as cloudinary } from "cloudinary";
import fs from "fs";

import configureCloudinary from "../configs/cloudinary.config.js";
import Order from "../models/order.model.js";
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

    const products = req.body;
    if (!Array.isArray(products)) {
      return res.status(400).json({ message: "Invalid 'products' field in the request." });
    }

    let totalValue = 0;

    jwt.verify(token, secret, async (err, info) => {
      if (err) {
        return res.status(401).json({ message: "Invalid token!" });
      }
      
      try {
        const productDetails = [];
        for (const product of products) {
          const food = await Food.findOne({ name: product.name });

          if (!food) {
            return res.status(400).json({ message: `Product not found: ${product.name}` });
          }

          const productDetail = {
            name: food.name,
            price: food.price,
            image: food.image,
            quantity: product.quantity,
          };

          productDetails.push(productDetail);

          totalValue += food.price * product.quantity;
        }

        const newOrder = new Order({
          author: info.id,
          products: productDetails,
          totalFood: totalValue,
        });

        await newOrder.save();

        res.status(200).json(newOrder);
      } catch (error) {
        res.status(500).json({ message: error.message });
      }
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Server is error!" });
  }
};
