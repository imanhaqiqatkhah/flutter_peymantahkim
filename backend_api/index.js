// import the express module
const express = require("express");

const helloRoute = require("./routes/hello");

// Port Server
const PORT = 3000;

// create express application
const app = express();

// middleware - to register routes or to mount routes
app.use(helloRoute);

// start server listen to port
app.listen(PORT, "0.0.0.0", function () {
  // log the number
  console.log(`server is running on port ${PORT}`);
});
