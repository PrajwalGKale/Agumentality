import 'package:flutter/material.dart';

class ICard extends StatefulWidget {
  const ICard({Key? key}) : super(key: key);

  @override
  State<ICard> createState() => _ICardState();
}

class _ICardState extends State<ICard> {
  bool isHover = false;
  Offset mousepos = const Offset(0, 0);

  backImage() {
    return AnimatedPositioned(
      curve: Curves.easeOutCubic,
      top: isHover ? -40 : 0,
      left: isHover ? -100 : -100,
      duration: const Duration(milliseconds: 1000),
      height: isHover ? 600 : 450,
      width: 500,
      child: Container(
        height: 600,
        width: 500,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/MarvelMotionPoster.jpeg"),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: InkWell(
        onLongPress: () {
          print('hover');
          setState(() {
            isHover = true;
          });
        },
        child: Container(
          height: 450,
          width: 280,
          child: Stack(
            children: [
              backImage(),
            ],
          ),
        ),
      ),
    );
  }
}
