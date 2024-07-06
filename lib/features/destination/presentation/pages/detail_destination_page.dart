import 'package:course_travel/api/urls.dart';
import 'package:course_travel/features/destination/domain/entities/destination_entitiy.dart';
import 'package:course_travel/features/destination/presentation/widgets/circle_loading.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class DetailDestinationPage extends StatefulWidget {
   DetailDestinationPage({super.key, required this.destination});
  final DestinationEntity destination ;

  @override
  State<DetailDestinationPage> createState() => _DetailDestinationPageState();
}

class _DetailDestinationPageState extends State<DetailDestinationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        children: [
          SizedBox(height: 10,),
          gallery()
        ],
      ),
    );
  }
    AppBar appBar() {
    return AppBar(
      title: Text(
        widget.destination.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        margin: EdgeInsets.only(
          left: 20,
          top: MediaQuery.of(context).padding.top,
        ),
        alignment: Alignment.centerLeft,
        child: const Row(
          children: [
            BackButton(),
          ],
        ),
      ),
    );
  }
  
  gallery() {
    List patternGallery = [
      StaggeredTile.count(3, 3),
      StaggeredTile.count(2, 1.5),
      StaggeredTile.count(2, 1.5)
    ];
    return StaggeredGridView.countBuilder(
      shrinkWrap : true,
      itemCount: 3,
      crossAxisCount: 5, itemBuilder: (context, index) {
      if(index == 2){
        return  GestureDetector(
            onTap: () {
              // showDialog(
              //   context: context,
              //   builder: (context) => GalleryPhoto(
              //     images: widget.destination.images,
              //   ),
              // );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  itemGalleryImage(index),
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    alignment: Alignment.center,
                    child: const Text(
                      '+ More',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
      }
      return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: itemGalleryImage(index),
        );
    }, staggeredTileBuilder: (index) {
      print("gimanasih ${patternGallery[index % patternGallery.length]}");
      return patternGallery[index % patternGallery.length];
    },);
  }

  Widget itemGalleryImage(int index){
     return ExtendedImage.network(
      URLs.image(widget.destination.images[index]),
      fit: BoxFit.cover,
      
      handleLoadingProgress: true,
      loadStateChanged: (state) {
        if (state.extendedImageLoadState == LoadState.failed) {
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[300],
              child: const Icon(
                Icons.broken_image,
                color: Colors.black,
              ),
            ),
          );
        }
        if (state.extendedImageLoadState == LoadState.loading) {
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[300],
              child: const CircleLoading(),
            ),
          );
        }
        return null;
      },
    );
  }
}