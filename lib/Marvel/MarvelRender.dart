import 'package:flutter/material.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:horizontal_card_pager/card_item.dart';

class MarvelRender extends StatefulWidget {
  const MarvelRender({Key? key}) : super(key: key);

  @override
  State<MarvelRender> createState() => _MarvelRenderState();
}

class _MarvelRenderState extends State<MarvelRender> {
  List<CardItem> items = [
    IconTitleCardItem(
      text: "Alarm",
      iconData: Icons.access_alarms,
    ),
    IconTitleCardItem(
      text: "Add",
      iconData: Icons.add,
    ),
    IconTitleCardItem(
      text: "Call",
      iconData: Icons.add_call,
    ),
    IconTitleCardItem(
      text: "WiFi",
      iconData: Icons.wifi,
    ),
    IconTitleCardItem(
      text: "File",
      iconData: Icons.attach_file,
    ),
    IconTitleCardItem(
      text: "Air Play",
      iconData: Icons.airplay,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Center(
        child: HorizontalCardPager(
          onPageChanged: (page) => print("page : $page"),
          onSelectedItem: (page) => print("selected : $page"),
          items: items,
        ),
      ),
    );
  }
}
