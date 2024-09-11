

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:online_cv/core/constant/cons_application.dart';
import 'package:online_cv/product/widget/page/not_found.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => __ProfileImageState();
}

class __ProfileImageState extends State<ProfileImage> {

  final storage = FirebaseStorage.instance;
  @override
  void initState() {
   
    super.initState();

  }
  
  Future<String> getImageUrl()async
  {
   
    final ref = storage.ref().child(ConsApplication.firebaseProfileImagePath);
    final url = await ref.getDownloadURL();
    return url;
  }

  @override
  Widget build(BuildContext context) {
return FutureBuilder(
        future: getImageUrl(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const NotFound();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return LayoutBuilder(
              builder: (context, constraint) {
                return CachedNetworkImage(
                      /* progressIndicatorBuilder: (context, url, progress) => Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ), */
                      imageUrl:snapshot.data ?? "",
                    );
                /* ImageNetwork(
                    image: snapshot.data ?? "",
                    height: constraint.maxHeight,
                    width: constraint.maxWidth,
                    //duration: 1500,
                    //curve: Curves.easeIn,
                    //onPointer: true,
                    debugPrint: false,
                    fullScreen: true,
                    fitAndroidIos: BoxFit.cover,
                    fitWeb: BoxFitWeb.contain,
                    //borderRadius: BorderRadius.circular(70),
                    onLoading: const CircularProgressIndicator(
                      color: Colors.indigoAccent,
                    ),
                    onError: const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                
                  ); */
              }
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      );
  }
}