import mongoose from "mongoose";

const { Schema, model } = mongoose;

const FoodSchema = new Schema(
  {
    name: String,
    price: Number,
    description: String,
    image: String,
    star: Number,
    author: { type: Schema.Types.ObjectId, ref: "User" },
    reviews: [{ type: Schema.Types.ObjectId, ref: "Review" }],
  },
  {
    timestamps: true,
  }
);

const Food = model("Food", FoodSchema);

export default Food;
