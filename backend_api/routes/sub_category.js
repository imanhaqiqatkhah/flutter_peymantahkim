const express = require("express");

const SubCategory = require("../models/sub_category");

const subcategoryRouter = express.Router();

subcategoryRouter.post("/api/subcategories", async (req, res) => {
  try {
    const { categoryId, categoryName, image, subCategoryName } = req.body;
    const subcategory = new SubCategory({
      categoryId,
      categoryName,
      image,
      subCategoryName,
    });
    await subcategory.save();
    res.status(201).send(subcategory);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = subcategoryRouter;
