import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/controllers/category_controller.dart';
import 'package:flutter_peymantahkim/controllers/subcategory_controller.dart';
import 'package:flutter_peymantahkim/models/category_model.dart';
import 'package:flutter_peymantahkim/models/subcategory_model.dart';
import 'package:flutter_peymantahkim/views/screens/detail/screens/widgets/subcategory_tile_widget.dart';
import 'package:flutter_peymantahkim/views/screens/nav_screens/widgets/header_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // a future will hold the list of categories once loaded from the API
  late Future<List<Category>> futureCategories;
  Category? _selectedCategory;
  List<Subcategory> _subcategories = [];
  final SubcategoryController _subcategoryController = SubcategoryController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategories = CategoryController().loadCategories();
    // once the categories are load process than
    futureCategories.then((categories) {
      // iternate through the list of categories
      for (var category in categories) {
        if (category.name == "فنی مهندسی") {
          setState(() {
            _selectedCategory = category;
          });
          // load subcategories for 'مجموعه فنی مهندسی'
          _loadSubcategories(category.name);
        }
      }
    });
  }

  // this will load subcategories base on the categoryName
  Future<void> _loadSubcategories(String categoryName) async {
    final subcategories = await _subcategoryController
        .getSubCategoriesByCategoryName(categoryName);
    setState(() {
      _subcategories = subcategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 20),
        child: HeaderWidget(),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // left side - display categories
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.grey.shade200,
                child: FutureBuilder(
                  future: futureCategories,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      final categories = snapshot.data!;
                      return ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return ListTile(
                            onTap: () {
                              setState(
                                () {
                                  _selectedCategory = category;
                                },
                              );
                              _loadSubcategories(category.name);
                            },
                            title: Text(
                              category.name,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: _selectedCategory == category
                                    ? Colors.blueAccent
                                    : Colors.black,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ), // right side - display selected category details
            Expanded(
              flex: 4,
              child: _selectedCategory != null
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _selectedCategory!.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.7,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      NetworkImage(_selectedCategory!.banner),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          _subcategories.isNotEmpty
                              ? GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: _subcategories.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 8,
                                    childAspectRatio: 2 / 3,
                                  ),
                                  itemBuilder: (context, index) {
                                    final subcategory = _subcategories[index];
                                    return SubcategoryTileWidget(
                                      image: subcategory.image,
                                      title: subcategory.subCategoryName,
                                    );
                                  },
                                )
                              : Center(
                                  child: Text(
                                    'فعالیتی موجود نیست',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
