import 'package:flutter/material.dart';
import 'package:herpi/models/reptiles.dart';
import 'package:herpi/pages/Reptile_page.dart/Reptile.dart';
import 'package:herpi/providers/reptiles_provider.dart';
import 'package:provider/provider.dart';

class AllReptilesList extends StatefulWidget {
  const AllReptilesList({super.key});

  @override
  State<AllReptilesList> createState() => _AllReptilesListState();
}

class _AllReptilesListState extends State<AllReptilesList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReptilesProvider>(builder: (_, firstprovider, __) {
      List<Reptile> allreptiles = firstprovider.allreptiles;
      return Column(
        children: [
          for (int i = 0; i < allreptiles.length; i++)
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReptilesPage(
                                id: allreptiles[i].id,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://herpi-eu-fra.s3.eu-central-1.amazonaws.com/general/1990",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: allreptiles[i].dangerLevel,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              allreptiles[i].venomous
                                  ? "შხამიანი"
                                  : allreptiles[i].hasMildVenom
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
                  const SizedBox(height: 10),
                  Text(
                    "${allreptiles[i].name}/${allreptiles[i].scientificName}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    allreptiles[i].family.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                          ),
                          Text(
                              "${allreptiles[i].addedBy.firstName} ${allreptiles[i].addedBy.lastName}"),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.remove_red_eye_outlined),
                          Text(allreptiles[i].views.toString()),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
        ],
      );
    });
  }
}
