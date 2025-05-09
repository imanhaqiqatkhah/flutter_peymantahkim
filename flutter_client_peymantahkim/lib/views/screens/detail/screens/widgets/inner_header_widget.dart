import 'package:flutter/material.dart';

class InnerHeaderWidget extends StatelessWidget {
  const InnerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Stack(
          children: [
            Image.asset(
              "./assets/icons/searchBanner.jpeg",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 8,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            Positioned(
              right: 30,
              top: 55,
              child: SizedBox(
                width: 230,
                height: 48,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'جستجو',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 11, vertical: 16),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.blueGrey[400],
                      size: 25,
                      textDirection: TextDirection.rtl,
                    ),
                    suffixIcon: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.blueGrey[400],
                      size: 26,
                    ),
                    focusColor: Colors.black,
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 285,
              top: 66,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  overlayColor:
                      MaterialStateProperty.all(const Color(0x0c7f7f)),
                  onTap: () {},
                  child: Ink(
                    width: 31,
                    height: 31,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('./assets/icons/bell.png'))),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 325,
              top: 66,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  overlayColor:
                      MaterialStateProperty.all(const Color(0x0c7f7f)),
                  onTap: () {},
                  child: Ink(
                    width: 31,
                    height: 31,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('./assets/icons/message.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
