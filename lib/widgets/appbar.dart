import 'package:flutter/material.dart';
import 'package:herpi/pages/home/widgets/reptile_filter_modal/reptile_filter.dart';
import 'package:herpi/providers/reptiles_provider.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  int selectedindex;
  MyAppBar({super.key, required this.selectedindex});

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
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isDismissible: true,
                      context: context,
                      builder: (context) {
                        return ReptileFilterModal();
                      },
                    );
                    Provider.of<ReptilesProvider>(context, listen: false)
                        .fetchReptileType(widget.selectedindex == 0
                            ? "SNAKE"
                            : widget.selectedindex == 1
                                ? "LIZARD"
                                : "SCORPION");
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    child: Image.network(
                      "https://static-00.iconduck.com/assets.00/equalizer-settings-2-icon-512x512-8vp87nng.png",
                      color: Colors.black,
                    ),
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
