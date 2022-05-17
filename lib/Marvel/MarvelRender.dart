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
    ),
    IconTitleCardItem(text: "Add", image: "assets/spiderman.png"),
    IconTitleCardItem(text: "Call", image: "assets/spiderman.png"),
    IconTitleCardItem(text: "WiFi", image: "assets/spiderman.png"),
    IconTitleCardItem(text: "File", image: "assets/spiderman.png"),
    IconTitleCardItem(text: "Air Play", image: "assets/spiderman.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Column(
        children: [
          Center(
            child: HorizontalCardPager(
              onPageChanged: (page) => print("page : $page"),
              onSelectedItem: (page) => print("selected : $page"),
              items: items,
            ),
          ),
        ],
      ),
    );
  }
}
