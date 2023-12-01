import 'package:flutter/material.dart';
import 'package:herpi/models/reptiles.dart';
import 'package:herpi/providers/reptiles_provider.dart';
import 'package:provider/provider.dart';

class AllReptiles extends StatefulWidget {
  const AllReptiles({super.key});

  @override
  State<AllReptiles> createState() => _AllReptilesState();
}

class _AllReptilesState extends State<AllReptiles> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReptilesProvider>(builder: (_, firstprovider, __) {
      List<Reptile> allreptiles = firstprovider.allreptiles;
      return Column(
        children: [
          ListView.builder(
            itemCount: allreptiles.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              print(allreptiles[0].image);
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      decoration: const BoxDecoration(color: Colors.red),
                      child: Image.network(
                          allreptiles[index].image),
                    ),
                    Text("data"),
                    Text("data"),
                    Row(
                      children: [Text("data")],
                    )
                  ],
                ),
              );
            },
          ),
        ],
      );
    });
  }
}
