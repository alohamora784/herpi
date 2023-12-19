import 'package:flutter/material.dart';
import 'package:herpi/models/reptiles_query.dart';

class GalleryPage extends StatefulWidget {
  List<GalleryItem> data;
  int i;
  GalleryPage({super.key, required this.data, required this.i});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late int SelectedIndex = widget.i;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.i);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.black),
              width: double.infinity,
              height: double.infinity,
              child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.data.length,
                onPageChanged: (int index) {
                  setState(() {
                    SelectedIndex = index;
                  });
                },
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 130, bottom: 130),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.red),
                      child: Image.network(
                        widget.data[index].url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      " ${SelectedIndex + 1} / ${widget.data.length.toString()}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "ავტორ(ებ)ი ",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "${widget.data[SelectedIndex].author.firstName} ${widget.data[SelectedIndex].author.lastName} ",
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
