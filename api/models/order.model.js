import mongoose from "mongoose";

const { Schema, model } = mongoose;

const OrderSchema = new Schema(
  {
    author: { type: Schema.Types.ObjectId, ref: "User" },
    products: [{
      name: String,
      price: Number,
      image: String,
      quantity: Number,
    }],
    totalFood: { type: Number, default: 0 },
  },
  {
    timestamps: true,
  }
);


const Order = model("Order", OrderSchema);

export default Order;
