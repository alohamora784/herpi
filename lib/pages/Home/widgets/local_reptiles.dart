import 'package:flutter/material.dart';
import 'package:herpi/models/reptiles.dart';
import 'package:herpi/pages/Reptile_page.dart/reptile_page.dart';

import 'package:herpi/providers/reptiles_provider.dart';
import 'package:provider/provider.dart';

class LocalReptilesList extends StatefulWidget {
  final int selectedindex;
  bool isLoading;
  LocalReptilesList(
      {super.key, required this.selectedindex, required this.isLoading});

  @override
  State<LocalReptilesList> createState() => _LocalReptilesListState();
}

class _LocalReptilesListState extends State<LocalReptilesList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReptilesProvider>(builder: (_, firstprovider, __) {
      List<Reptile> reptiles = firstprovider.reptilesbycategory;
      

      return Container(
        height: 235,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget.isLoading
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      "იტვირთება...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "შენს არეალში",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reptiles.length,
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReptilesPage(
                                      id: reptiles[index].id,
                                      hasredfleg: reptiles[index].hasRedFlag,
                                      scientificName:
                                          reptiles[index].scientificName,
                                    ),
                                  ),
                                );
                              },
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 230,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 130,
                                          width: 230,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              reptiles[index].image!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${reptiles[index].name}/${reptiles[index].scientificName}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: reptiles[index].dangerLevel,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          reptiles[index].venomous
                                              ? "შხამიანი"
                                              : reptiles[index].hasMildVenom
                                                  ? "სუსტად შხამიანი"
                                                  : "უშხამო",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
