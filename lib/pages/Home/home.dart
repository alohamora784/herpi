import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:herpi/pages/Home/widgets/all_reptiles.dart';
import 'package:herpi/pages/Home/widgets/google_maps.dart';
import 'package:herpi/pages/Home/widgets/local_reptiles.dart';
import 'package:herpi/providers/reptiles_provider.dart';
import 'package:herpi/widgets/appbar.dart';
import 'package:provider/provider.dart';

class HomePge extends StatefulWidget {
  const HomePge({super.key});

  @override
  State<HomePge> createState() => _HomePgeState();
}

class _HomePgeState extends State<HomePge> {
  int selectedIndex = 0;
  String location = "Location: Unknown";
  String _latitude = "";
  String _longitude = "";
  bool isLoading = true;

  @override
  void initState() {
    _initLocation();
    Provider.of<ReptilesProvider>(context, listen: false).fetchAllptiles();

    super.initState();
  }

  Future<void> _initLocation() async {
    try {
      await _getLocation();

      await Provider.of<ReptilesProvider>(context, listen: false)
          .fetchReptiles(_latitude, _longitude);
    } catch (e) {
      print("Error during initialization: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      setState(() {
        location = "Permission denied to access location";
      });
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _latitude = position.latitude.toString();
        _longitude = position.longitude.toString();
        location = "Location: ${position.latitude}, ${position.longitude}";

        print(location);
        print(_latitude);
        print(_longitude);
      });
    } catch (e) {
      print(e);
      setState(() {
        location = "Error getting location";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(
                        "https://herpi.ge/static/media/lizard.ed88a72a387e887a1b8b.png"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.check_circle_outlined,
                          size: 40,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.settings,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/84/84516.png"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _latitude.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(50)),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Container(
                    child: Column(
                      children: [
                        const Text(
                          "გველები",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 3,
                          width: 100,
                          decoration: BoxDecoration(
                              color: selectedIndex == 0
                                  ? Colors.purple
                                  : Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    child: Column(
                      children: [
                        const Text(
                          "ხვლიკები",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 3,
                          width: 100,
                          decoration: BoxDecoration(
                              color: selectedIndex == 1
                                  ? Colors.purple
                                  : Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  child: Container(
                    child: Column(
                      children: [
                        const Text(
                          "მორიელები",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 3,
                          width: 100,
                          decoration: BoxDecoration(
                              color: selectedIndex == 2
                                  ? Colors.purple
                                  : Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "შენს არეალში",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 230,
                      child: isLoading
                          ? Center(child: CircularProgressIndicator())
                          : HorizontalListview(
                              selectedindex: selectedIndex,
                            ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "ყველა",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const AllReptiles(),
          ],
        ),
      ),
    );
  }
}
