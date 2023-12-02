import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _MyAppBarState extends State<MyAppBar> {
  
  
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Image.network(
                  "https://herpi.ge/static/media/lizard.ed88a72a387e887a1b8b.png"),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    height: 35,
                    width: 35,
                    child: Image.network(
                      "https://cdn-icons-png.flaticon.com/512/9282/9282853.png",
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    height: 35,
                    width: 35,
                    child: Image.network(
                      "https://static-00.iconduck.com/assets.00/settings-icon-2048x2046-cw28eevx.png",
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: 35,
                  child: Image.network(
                    "https://static-00.iconduck.com/assets.00/equalizer-settings-2-icon-512x512-8vp87nng.png",
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
