import 'package:flutter/material.dart';
import 'package:herpi/models/reptiles.dart';
import 'package:herpi/models/reptiles_query.dart';
import 'package:herpi/pages/Reptile_page.dart/widgets/gallery.dart';
import 'package:herpi/providers/reptiles_provider.dart';
import 'package:provider/provider.dart';

class ReptilesPage extends StatefulWidget {
  int id;
  bool hasredfleg;
  String scientificName;
  ReptilesPage({
    super.key,
    required this.id,
    required this.hasredfleg,
    required this.scientificName,
  });

  @override
  State<ReptilesPage> createState() => _ReptilesPageState();
}

class _ReptilesPageState extends State<ReptilesPage> {
  late ReptileQuery reptile1;
  bool _dataLoaded = false;
  @override
  void initState() {
    fetchreptile();
    super.initState();
  }

  Widget build(BuildContext context) {
    {
      if (!_dataLoaded) {
        return const CircularProgressIndicator();
      }

      return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "დეტალურად",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Icon(Icons.photo_camera),
            ],
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.hasredfleg == true)
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                  ),
                                  child: const Icon(
                                    Icons.flag,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "წითელ წიგნში შეტანილი სახეობა",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            reptile1.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: reptile1.dangerLevel,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              reptile1.venomous
                                  ? "შხამიანი"
                                  : reptile1.hasMildVenom
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
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                reptile1.addedBy.avatar!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("გამოაქვეყნა"),
                              Text(
                                "${reptile1.addedBy.firstName} ${reptile1.addedBy.lastName}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "დასახელება",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    reptile1.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 220, 3, 137),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "მეცნიერული სახელწოდება",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    reptile1.scientificName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 220, 3, 137),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "ოჯახი",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    reptile1.family.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 220, 3, 137),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "აღწერა",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(reptile1.description),
                   SizedBox(height: 10),
                   Gallery(data: reptile1,),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      );
    }
  }

  Future<void> fetchreptile() async {
    reptile1 = await Provider.of<ReptilesProvider>(context, listen: false)
        .fetchWithId(widget.id);
    _dataLoaded = true;
    setState(() {});
  }
}
