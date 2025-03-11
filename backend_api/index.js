// import the express module
const express = require("express");
const helloRoute = require("./routes/hello");
const mongoose = require("mongoose");

// port server
const PORT = 3000;

// create express application
const app = express();

// mongodb string
const DB =
  "mongodb+srv://peymantahkim:peyman7775@ptk.8jhmg.mongodb.net/?retryWrites=true&w=majority&appName=PTK";

// middleware - to register routes or to mount routes
app.use(helloRoute);

mongoose.connect(DB).then(() => {
  console.log("MongoDB Connected");
});

// start server listen to port
app.listen(PORT, "0.0.0.0", function () {
  // log the number
  console.log(`server is running on port ${PORT}`);
});
