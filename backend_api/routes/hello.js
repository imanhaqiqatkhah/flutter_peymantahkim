const express = require("express");

const helloRoute = express.Router();

helloRoute.get("/hello", (req, res) => {
  res.send("hello_world");
});

module.exports = helloRoute;
