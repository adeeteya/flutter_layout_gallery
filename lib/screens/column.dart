import 'package:flutter/material.dart';
import 'package:flutter_layout_gallery/constants.dart';

class ColumnDemo extends StatefulWidget {
  const ColumnDemo({Key? key}) : super(key: key);

  @override
  State<ColumnDemo> createState() => _ColumnDemoState();
}

class _ColumnDemoState extends State<ColumnDemo> {
  MainAxisAlignment selectedMainAxisAlignment = MainAxisAlignment.spaceBetween;
  CrossAxisAlignment selectedCrossAxisAlignment = CrossAxisAlignment.center;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Column"),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 80),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    "Main Axis Alignment: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<MainAxisAlignment>(
                    value: selectedMainAxisAlignment,
                    onChanged: (val) {
                      setState(() {
                        selectedMainAxisAlignment =
                            val ?? selectedMainAxisAlignment;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: MainAxisAlignment.start,
                        child: Text("Start"),
                      ),
                      DropdownMenuItem(
                        value: MainAxisAlignment.center,
                        child: Text("Center"),
                      ),
                      DropdownMenuItem(
                        value: MainAxisAlignment.end,
                        child: Text("End"),
                      ),
                      DropdownMenuItem(
                        value: MainAxisAlignment.spaceBetween,
                        child: Text("Space Between"),
                      ),
                      DropdownMenuItem(
                        value: MainAxisAlignment.spaceAround,
                        child: Text("Space Around"),
                      ),
                      DropdownMenuItem(
                        value: MainAxisAlignment.spaceEvenly,
                        child: Text("Space Evenly"),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    "Cross Axis Alignment:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<CrossAxisAlignment>(
                    value: selectedCrossAxisAlignment,
                    onChanged: (val) {
                      setState(() {
                        selectedCrossAxisAlignment =
                            val ?? selectedCrossAxisAlignment;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: CrossAxisAlignment.start,
                        child: Text("Start"),
                      ),
                      DropdownMenuItem(
                        value: CrossAxisAlignment.center,
                        child: Text("Center"),
                      ),
                      DropdownMenuItem(
                        value: CrossAxisAlignment.end,
                        child: Text("End"),
                      ),
                      DropdownMenuItem(
                        value: CrossAxisAlignment.stretch,
                        child: Text("Stretch              "),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: selectedCrossAxisAlignment,
          mainAxisAlignment: selectedMainAxisAlignment,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text(
                "1",
                style: kContainerTextStyle,
              ),
            ),
            Container(
              height: 70,
              width: 70,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text(
                "2",
                style: kContainerTextStyle,
              ),
            ),
            Container(
              height: 50,
              width: 50,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                "3",
                style: kContainerTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
