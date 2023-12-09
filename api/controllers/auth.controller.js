import { config } from "dotenv";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { v2 as cloudinary } from "cloudinary";
import fs from "fs";

import configureCloudinary from "../configs/cloudinary.config.js";
import User from "../models/user.model.js";

config();
configureCloudinary();
const secret = process.env.SCRET_TOKEN;

export const resgister = async (req, res) => {
  try {
    const { username, password, name, avatar, age, address, phone, role } = req.body;

    const user = await User.create({
      username,
      password: bcrypt.hashSync(password, bcrypt.genSaltSync(10)),
      name,
      avatar,
      age,
      address,
      phone,
      role,
    });
    res.status(201).json(user);
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Server is error!" });
  }
};

export const login = async (req, res) => {
  try {
    const { username, password } = req.body;

    const user = await User.findOne({ username });

    if (!user) {
      return res.status(400).json({ message: "Username not found!" });
    }

    const isSuccess = bcrypt.compareSync(password, user.password);
    if (!isSuccess) {
      return res.status(400).json({ message: "Password is error!" });
    }

    jwt.sign(
      {
        id: user._id,
        username: user.username,
        image: user.image,
      },
      secret,
      { expiresIn: "1d" },
      (err, token) => {
        if (err) throw err;
        res.cookie("token", token, { maxAge: 24 * 60 * 60 * 1000 }).json({
          id: user._id,
          username,
          image: user.image,
        });
      }
    );
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Server is error!" });
  }
};

export const logout = async (req, res) => {
  res.cookie("token", "").json("Logout successfully!");
};

export const getProfile = async (req, res) => {
  try {
    if (!req.cookies) {
      return res.status(400).send({ message: "No cookies provided" });
    }

    const { token } = req.cookies;

    if (!token) {
      return res.status(401).json({ message: "Unauthorized" });
    }

    jwt.verify(token, secret, async (err, info) => {
      if (err) throw err;
      try {
        const user = await User.findById(info.id).select("-password");
        if (!user) {
          return res.status(404).send({ message: "User not found" });
        }
        res.status(200).json(user);
      } catch (error) {
        res.status(500).send({ message: error.message });
      }
    });
  } catch (error) {
    console.log(err);
    res.status(500).json({ message: "Server is error!" });
  }
};

export const updateProfile = async (req, res) => {
  try {
    if (!req.cookies) {
      return res.status(400).send({ message: "No cookies provided" });
    }

    const { username, name, avatar, age, address, phone } = req.body;
    const { token } = req.cookies;

    if (!token) {
      return res.status(401).json({ message: "Unauthorized" });
    }

    jwt.verify(token, secret, async (err, info) => {
      if (err) {
        return res.status(401).json({ message: "Unauthorized: Invalid token" });
      }
      try {
        const updateUser = await User.findById(info.id);

        if (!updateUser) {
          return res.status(404).json({ message: "User not found" });
        }

        if (username) updateUser.username = username;
        if (name) updateUser.name = name;
        if (address) updateUser.address = address;
        if (phone) updateUser.phone = phone;
        if (age) updateUser.age = age;
        if(avatar) updateUser.avatar = avatar;
        

        if (!username && !name && !address && !phone && !age && !avatar) {
          return res.status(400).json({ message: "No data to update" });
        }

        await updateUser.save();
        res.status(200).json(updateUser);
      } catch (error) {
        console.log(error);
        res.status(500).send({ message: error.message });
      }
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Server is error" });
  }
};
