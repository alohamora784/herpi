import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:herpi/pages/home/widgets/FAQ_text.dart';
import 'package:herpi/pages/home/widgets/all_reptiles.dart';
import 'package:herpi/pages/home/widgets/local_reptiles.dart';
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
      appBar: const MyAppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 35),
            const FAQ(),
            const SizedBox(height: 35),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
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
              ],
            ),
            const SizedBox(height: 15),
            LocalReptilesList(
              selectedindex: selectedIndex,
              isLoading: isLoading,
            ),
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
            const AllReptilesList(),
          ],
        ),
      ),
    );
  }
}
