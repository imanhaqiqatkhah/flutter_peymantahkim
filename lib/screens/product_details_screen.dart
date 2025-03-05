import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/theme/theme.dart';
import 'package:flutter_peymantahkim/widgets/gradient_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedImageIndex = 0;
  int _selectedSize = 1;
  int _selectedSize2 = 1;
  int _selectedColor = 0;
  bool _isFavorite = false;

  final PageController _pageController = PageController();

  final images = [
    './assets/images/black t-shirt.png',
    './assets/images/cotton pant 1.png',
    './assets/images/grey cotton pant 2.png',
    './assets/images/red t-shirt.png',
  ];

  Widget _buildSizeOption(int index) {
    final sizes = ['تامین', 'تعمیر', 'تولید'];
    final isSelected = _selectedSize == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedSize = index),
      child: Container(
        width: 80,
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppTheme.primaryColor
                : AppTheme.textSecondary.withOpacity(0.3),
          ),
        ),
        child: Center(
          child: Text(
            sizes[index],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : AppTheme.textPrimary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSizeOption2(int index) {
    final sizes = ['فوری', '1 ماه', 'سه ماه'];
    final isSelected = _selectedSize2 == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedSize2 = index),
      child: Container(
        width: 80,
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppTheme.primaryColor
                : AppTheme.textSecondary.withOpacity(0.3),
          ),
        ),
        child: Center(
          child: Text(
            sizes[index],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : AppTheme.textPrimary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorOption(int index) {
    final colors = [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.green,
      Colors.amber,
    ];
    final isSelected = _selectedColor == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = index;
        });
      },
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors[index],
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: isSelected
            ? Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppTheme.primaryColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: AppTheme.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 0,
                floating: true,
                pinned: true,
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppTheme.textPrimary,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color:
                          _isFavorite ? AppTheme.error : AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: PageView.builder(
                              controller: _pageController,
                              onPageChanged: (index) {
                                setState(() {
                                  _selectedImageIndex = index;
                                });
                              },
                              itemCount: images.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color:
                                        AppTheme.primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(26),
                                      child: Image.asset(
                                        images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 32,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                images.length,
                                (index) => Container(
                                  width: 8,
                                  height: 8,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _selectedImageIndex == index
                                        ? AppTheme.primaryColor
                                        : AppTheme.textSecondary
                                            .withOpacity(0.3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.success.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    textDirection: TextDirection.ltr,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: AppTheme.success,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '4.8',
                                        style: TextStyle(
                                          color: AppTheme.success,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '(245 بازدید)',
                                  style: TextStyle(
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.error.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'تعمیر کامل',
                                    style: TextStyle(
                                      color: AppTheme.error,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'تجهیز تعمیر شده توسط شرکت',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'با نام پیمان تحکیم',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppTheme.textSecondary,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  'تعمیر تجیز',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.primaryColor,
                                  ),
                                ),
                                SizedBox(width: 56),
                                Text(
                                  'در کمترین ترین زمان',
                                  style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.underline,
                                    decorationStyle: TextDecorationStyle.dotted,
                                    color:
                                        AppTheme.textSecondary.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'توضیحات کالا',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppTheme.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                                textAlign: TextAlign.justify,
                                'رله اوراسپید HUBNER یکی از تجهیزات کلیدی در سیستم‌های کنترلی و حفاظتی صنعتی است که به‌ویژه در ماشین‌آلات حساس و پرسرعت، نقش حیاتی ایفا می‌کند. این رله با طراحی پیشرفته و دقت بالا، به نظارت و کنترل سرعت ماشین‌آلات کمک کرده و از ایجاد آسیب‌های احتمالی به تجهیزات و خطوط تولید جلوگیری می‌کند. قابلیت تنظیم دقیق پارامترها و پاسخ سریع به تغییرات، این رله را به گزینه‌ای ایده‌آل برای صنایع حساس مانند فولاد، سیمان، پتروشیمی و حمل‌ونقل تبدیل کرده است.'),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                _buildFeature(Icons.verified, 'تضمین کیفیت'),
                                _buildFeature(
                                    Icons.domain_verification, 'گارنتی کالا'),
                                _buildFeature(Icons.eco, 'تحویل فوری'),
                              ],
                            ),
                            // Text(
                            //   'برای درخواست جدید برای خودتان انتخاب کنید',
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     color: AppTheme.textPrimary,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // SizedBox(height: 12),
                            // Row(
                            //   mainAxisAlignment:
                            //       MainAxisAlignment.spaceAround,
                            //   children: List.generate(
                            //     3,
                            //     (index) => _buildSizeOption(index),
                            //   ),
                            // ),
                            // SizedBox(height: 20),
                            // Text(
                            //   'زمان تحویل',
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     color: AppTheme.textPrimary,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // SizedBox(height: 12),
                            // Row(
                            //   mainAxisAlignment:
                            //       MainAxisAlignment.spaceAround,
                            //   children: List.generate(
                            //     3,
                            //     (index) => _buildSizeOption2(index),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'بازدیدهای اخیر',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('دیدن همه'),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                      offset: Offset(0, 5)),
                                ],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: AppTheme.primaryColor,
                                        child: Text(
                                          'New',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'جدید',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppTheme.textPrimary,
                                                  fontSize: 16),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  size: 16,
                                                  color: AppTheme.warning,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 16,
                                                  color: AppTheme.warning,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 16,
                                                  color: AppTheme.warning,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 16,
                                                  color: AppTheme.warning,
                                                ),
                                                Icon(
                                                  Icons.star_half,
                                                  size: 16,
                                                  color: AppTheme.warning,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '3 روز پیش',
                                        style: TextStyle(
                                            color: AppTheme.textSecondary),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.justify,
                                    'شرکت دانش‌بنیان مهندسی پیمان تحکیم خوزستان با تعمیر این درایو پیشرفته، عملکرد اصلی و قابلیت‌های تخصصی آن را احیا کرده است. این خدمات، علاوه بر بازگرداندن کارایی اولیه دستگاه، عمر مفید آن را افزایش داده و باعث کاهش هزینه‌های نگهداری و جایگزینی شده است. این درایو پس از تعمیر، آماده بهره‌برداری در صنایع تولیدی، غذایی، ساخت‌وساز و شیمیایی، و همچنین در کاربردهای عمومی مانند پمپ‌ها، فن‌ها و کمپرسورها است، که نقش حیاتی در بهینه‌سازی فرآیندها و کاهش مصرف انرژی ایفا می‌کند.',
                                    style: TextStyle(
                                        height: 1.2,
                                        color: AppTheme.textSecondary),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: GradientButton(
                      text: 'تماس',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
