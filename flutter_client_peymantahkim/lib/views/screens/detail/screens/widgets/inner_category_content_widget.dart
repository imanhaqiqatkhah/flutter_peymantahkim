import 'package:flutter/material.dart';
import 'package:flutter_client_peymantahkim/controllers/subcategory_controller.dart';
import 'package:flutter_client_peymantahkim/models/category_model.dart';
import 'package:flutter_client_peymantahkim/models/subcategory_model.dart';
import 'package:flutter_client_peymantahkim/views/screens/detail/screens/widgets/inner_banner_widget.dart';
import 'package:flutter_client_peymantahkim/views/screens/detail/screens/widgets/inner_header_widget.dart';
import 'package:flutter_client_peymantahkim/views/screens/detail/screens/widgets/subcategory_tile_widget.dart';

class InnerCategoryContentWidget extends StatefulWidget {
  final Category category;

  const InnerCategoryContentWidget({super.key, required this.category});
  @override
  State<InnerCategoryContentWidget> createState() =>
      _InnerCategoryContentWidgetState();
}

class _InnerCategoryContentWidgetState
    extends State<InnerCategoryContentWidget> {
  late Future<List<Subcategory>> _subCategories;
  final SubcategoryController _subcategoryController = SubcategoryController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subCategories = _subcategoryController
        .getSubCategoriesByCategoryName(widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              InnerBannerWidget(image: widget.category.banner),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "پشتیبانی از ما، پیشرفت از شما",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.7,
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                future: _subCategories,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('خطا ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('بدون فعالیت'),
                    );
                  } else {
                    final subcategories = snapshot.data!;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: List.generate(
                            (subcategories.length / 7).ceil(), (setIndex) {
                          // for each row, calculate the starting and ending index
                          final start = setIndex * 7;
                          final end = (setIndex + 1) * 7;

                          // create a padding widget to add spacing arround the row
                          return Padding(
                            padding: EdgeInsets.all(8.9),
                            child: Row(
                              // create a row of the subcategory tie
                              children: subcategories
                                  .sublist(
                                      start,
                                      end > subcategories.length
                                          ? subcategories.length
                                          : end)
                                  .map((subcategory) => SubcategoryTileWidget(
                                        image: subcategory.image,
                                        title: subcategory.subCategoryName,
                                      ))
                                  .toList(),
                            ),
                          );
                        }),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
