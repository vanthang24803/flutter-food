import mongoose from "mongoose";

const { Schema, model } = mongoose;

const UserSchema = new Schema(
  {
    username: { type: String, required: true, min: 4, unique: true },
    password: { type: String, required: true },
    name: { type: String, required: true },
    avatar: { type: String },
    age: { type: Number },
    address: { type: String },
    phone: { type: String },
    role: { type: Number, default: 1 },
  },
  {
    timestamps: true,
  }
);

const User = model("User", UserSchema);

export default User;
