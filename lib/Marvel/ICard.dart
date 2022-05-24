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
                    border: Border.all(color: Colors.red.shade200, width: 4),
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      border: Border.all(color: Colors.red.shade400, width: 2),
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
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    border: Border.all(color: Colors.red.shade400, width: 2),
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
