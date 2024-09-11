import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_cv/product/service/fire_store_db.dart';

class ImageFromFirebaseStorage extends StatelessWidget {
  final String imageUrl;

  const ImageFromFirebaseStorage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
  
     return FutureBuilder(
          future: FireStoreDataBase().getData(path:imageUrl),
           builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text(
                  "Something went wrong",
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  height: 250,
                  //width: constraint.maxWidth,
                  child:AspectRatio(
                    aspectRatio: 3.2,
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) => Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                      imageUrl:
                          snapshot.data,
                    ),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
        );
   
 
   }


}