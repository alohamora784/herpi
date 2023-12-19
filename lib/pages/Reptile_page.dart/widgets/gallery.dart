import 'package:flutter/material.dart';
import 'package:herpi/models/reptiles_query.dart';
import 'package:herpi/pages/Reptile_page.dart/widgets/gallery_page.dart';

class Gallery extends StatefulWidget {
  ReptileQuery data;
  Gallery({super.key, required this.data});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.data.gallery.length,
          itemBuilder: (context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GalleryPage(
                            data: widget.data.gallery,
                            i: index,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 130,
                      width: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.data.gallery[index].url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "${widget.data.gallery[index].author.firstName} ${widget.data.gallery[index].author.lastName}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
