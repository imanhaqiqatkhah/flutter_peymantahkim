import 'package:app_web/controllers/banner_controller.dart';
import 'package:app_web/views/side_bar_screens/widgets/banner_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadBannerScreen extends StatefulWidget {
  static const String id = "\banner-screen";
  const UploadBannerScreen({super.key});

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  final BannerController _bannerController = BannerController();
  dynamic _image;
  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            alignment: Alignment.topRight,
            child: Center(
              child: Text(
                'بنر ها',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Divider(
            color: Colors.grey.shade400,
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: _image != null ? Image.memory(_image) : Text('عکس بنر'),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await _bannerController.uploadBanner(
                    pickedImage: _image, context: context);
              },
              child: Text('ثبت'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              pickImage();
            },
            child: Text('آپلود عکس'),
          ),
        ),
        Divider(color: Colors.grey),
        BannerWidget(),
      ],
    );
  }
}
