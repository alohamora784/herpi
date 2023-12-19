import 'package:flutter/material.dart';
import 'package:herpi/providers/reptiles_provider.dart';
import 'package:provider/provider.dart';

class ReptileTypeList extends StatefulWidget {
  const ReptileTypeList({super.key});

  @override
  State<ReptileTypeList> createState() => _ReptileTypeListState();
}

class _ReptileTypeListState extends State<ReptileTypeList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReptilesProvider>(builder: (_, firstprovider, __) {
     List<String> reptilestype = firstprovider.reptiletypes.map((e) => e.name).toList();
      return SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reptilestype.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade300,
                ),
                child:  Center(
                    child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    reptilestype[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
              ),
            );
          },
        ),
      );
    });
  }
}
