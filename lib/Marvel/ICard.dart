import 'package:flutter/material.dart';

Row buildCard(
    {required int length, required int index, required int ontapindex}) {
  return Row(
    children: [
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: Container(
          width: 100,
          height: 100,
          //color: Colors.red,
          child: ontapindex == index
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff7504CD), width: 3),
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color(0xffD9C3FF),
                      border: Border.all(color: Color(0xff330163), width: 3),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/MarvelLogo/AVG${index}.png",
                          fit: BoxFit.contain),
                    ),
                  ),
                )
              : Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xffD9C3FF),
                    border: Border.all(color: Color(0xff330163), width: 2),
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/MarvelLogo/AVG${index}.png",
                        fit: BoxFit.contain),
                  ),
                ),
        ),
      ),
      SizedBox(
        width: 10,
      ),
    ],
  );
}
