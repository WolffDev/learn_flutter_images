import 'package:flutter/material.dart';
import 'package:learn_simple_images/src/models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  const ImageList(this.images, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Column(
        children: <Widget>[
          Image.network(image.url),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8.0,
            ),
            child: Text(
              image.title,
            ),
          )
        ],
      ),
    );
  }
}
