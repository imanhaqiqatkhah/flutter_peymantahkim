// import the express module
const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const bannerRouter = require("./routes/banner");
const categoryRouter = require("./routes/category");
const subcategoryRouter = require("./routes/sub_category");
const productRouter = require("./routes/product");

// port server
const PORT = 3000;

// create express application
const app = express();

// mongodb string
const DB =
  "mongodb+srv://imanhaqiqatkhah:imanhaqiqatkhah@cluster0.cgjcx.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

// middleware - to register routes or to mount routes
app.use(express.json());
app.use(authRouter);
app.use(bannerRouter);
app.use(categoryRouter);
app.use(subcategoryRouter);
app.use(productRouter);

mongoose.connect(DB).then(() => {
  console.log("MongoDB Connected");
});

// start server listen to port
app.listen(PORT, "0.0.0.0", function () {
  // log the number
  console.log(`server is running on port ${PORT}`);
});
