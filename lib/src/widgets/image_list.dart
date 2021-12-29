import 'package:flutter/material.dart';
import 'package:learn_simple_images/src/models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  const ImageList(this.images, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, int index) {
          return Image.network(images[index].url);
        },
      ),
    );
  }
}
