import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/controllers/category_controller.dart';
import 'package:flutter_peymantahkim/models/category_model.dart';
import 'package:flutter_peymantahkim/views/screens/nav_screens/widgets/reusable_text_widget.dart';

class CategoryItemWidget extends StatefulWidget {
  const CategoryItemWidget({super.key});

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  // a future will hold the list of categories once loaded from the API
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategories = CategoryController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableTextWidget(title: 'مجموعه ها', subtitle: 'مشاهده همه'),
        FutureBuilder(
          future: futureCategories,
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
              final categories = snapshot.data!;
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Column(
                    children: [
                      Image.network(
                        category.image,
                        height: 47,
                        width: 47,
                      ),
                      Text(
                        category.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
