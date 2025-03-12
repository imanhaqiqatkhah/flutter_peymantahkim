const express = require("express");

const User = require("../models/user");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { fullName, email, password } = req.body;

    const existingEmail = await User.findOne({ email });

    if (existingEmail) {
      return res
        .status(400)
        .json({ msg: "کاربری با این ایمیل از قبل وجود دارد" });
    } else {
      var user = new User({ fullName, email, password });
      user = await user.save();
      res.json({ user });
    }
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
