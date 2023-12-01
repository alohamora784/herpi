import 'package:flutter/material.dart';
import 'package:herpi/models/reptiles.dart';
import 'package:herpi/providers/reptiles_provider.dart';
import 'package:provider/provider.dart';

class HorizontalListview extends StatefulWidget {
  final int selectedindex;
  const HorizontalListview({super.key, required this.selectedindex});

  @override
  State<HorizontalListview> createState() => _HorizontalListviewState();
}

class _HorizontalListviewState extends State<HorizontalListview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReptilesProvider>(builder: (_, firstprovider, __) {
      List<Reptile> reptiles = [];
      if (widget.selectedindex == 0) {
        reptiles = firstprovider.reptiles
            .where(
              (element) => element.type.contains("SNAKE"),
            )
            .toList();
      } else if ((widget.selectedindex == 1)) {
        reptiles = firstprovider.reptiles
            .where(
              (element) => element.type.contains("LIZARD"),
            )
            .toList();
      } else if (widget.selectedindex == 2) {
        reptiles = firstprovider.reptiles
            .where(
              (element) => element.type.contains("SCORPION"),
            )
            .toList();
      }

      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reptiles.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Stack(
                    children: [
                      Container(
                        width: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 130,
                              width: 230,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  reptiles[index].image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              reptiles[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          height: 30,
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
                )
              ],
            ),
          );
        },
      );
    });
  }
}
