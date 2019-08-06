import 'package:flutter/material.dart';
import 'package:udemy02_image_app/model/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        var image = images[index];
        return buildImage(image);
      },
    );
  }

  Widget buildImage (ImageModel image) {
    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 10,),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(3, 3),
              )
            ]
        ),
        child: Column(
          children: <Widget>[
            Image.network(
              image.url,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,),
              child: Text(image.title),
            ),
          ],
        )
    );
  }
}
