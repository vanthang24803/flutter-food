import mongoose from "mongoose";

const { Schema, model } = mongoose;

const ReviewSchema = new Schema(
  {
    author: {
      id: { type: Schema.Types.ObjectId, ref: "User" }, 
      username: String,
      image : String,
    },
    title: String,
    star: Number,
  },
  {
    timestamps: true,
  }
);

const Review = model("Review", ReviewSchema);

export default Review;
