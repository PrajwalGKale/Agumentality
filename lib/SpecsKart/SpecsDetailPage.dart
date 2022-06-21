import 'package:flutter/material.dart';

class SpecsDetailPage extends StatelessWidget {
  //const SpecsDetailPage({Key? key}) : super(key: key);

  Widget BuildCard({required int index}) {
    return Container(
      height: 50,
      width: 50,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        child: GridTile(
            //child: Image.asset(SpecIndex[index]),
            // footer: Center(child: Text(SpecName[index])),
            ),
      ),
    );
  }

  Widget buildGridView() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: 6,
          itemBuilder: (context, int indx) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SpecsDetailPage(),
                ),
              );
            },
            child: BuildCard(index: indx),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232D2A),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                'assets/SKart.gif',
                fit: BoxFit.contain,
              ),
            ),
          ),
          buildGridView(),
        ],
      ),
    );
  }
}
