import express from "express";
import { config } from "dotenv";
import cookieParser from "cookie-parser";
import cors from "cors";
import configureCloudinary from "./configs/cloudinary.config.js";

import connect from "./configs/db.config.js";
import authRouter from "./routers/auth.router.js";
import productRouter from "./routers/product.router.js";
import reviewRouter from "./routers/review.router.js";
import orderRouter from "./routers/order.router.js";

// ENV
config();

// SETUP
const app = express();
app.use(express.json());
app.use(cookieParser());

// CONNECT DATABASE
connect();

// CONFIG CORS
const corsOptions = {
  origin: "*",
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  credentials: true,
  allowedHeaders: ["Content-Type", "Authorization"],
};

app.use(cors(corsOptions));
configureCloudinary();
// PORT
const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log(`Server listening in port ${port}`);
});

// ROUTER
app.get("/", (req, res) => {
  res.status(200).json("Hello World In Food API");
});

app.use(authRouter);
app.use(productRouter);
app.use(reviewRouter);
app.use(orderRouter);
