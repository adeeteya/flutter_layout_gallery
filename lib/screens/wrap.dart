import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_gallery/constants.dart';

class WrapDemo extends StatefulWidget {
  const WrapDemo({Key? key}) : super(key: key);

  @override
  State<WrapDemo> createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {
  WrapAlignment selectedWrapAlignment = WrapAlignment.center;
  WrapAlignment selectedRunWrapAlignment = WrapAlignment.center;
  WrapCrossAlignment selectedCrossWrapAlignment = WrapCrossAlignment.center;
  Axis selectedAxis = Axis.horizontal;
  VerticalDirection selectedDirection = VerticalDirection.down;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wrap"),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 160),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    "Alignment: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<WrapAlignment>(
                    value: selectedWrapAlignment,
                    onChanged: (val) {
                      setState(() {
                        selectedWrapAlignment = val ?? selectedWrapAlignment;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: WrapAlignment.start,
                        child: Text("Start"),
                      ),
                      DropdownMenuItem(
                        value: WrapAlignment.center,
                        child: Text("Center"),
                      ),
                      DropdownMenuItem(
                        value: WrapAlignment.end,
                        child: Text("End"),
                      ),
                      DropdownMenuItem(
                        value: WrapAlignment.spaceBetween,
                        child: Text("Space Between        "),
                      ),
                      DropdownMenuItem(
                        value: WrapAlignment.spaceAround,
                        child: Text("Space Around"),
                      ),
                      DropdownMenuItem(
                        value: WrapAlignment.spaceEvenly,
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
                    "Run Alignment: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<WrapAlignment>(
                    value: selectedRunWrapAlignment,
                    onChanged: (val) {
                      setState(() {
                        selectedRunWrapAlignment =
                            val ?? selectedRunWrapAlignment;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: WrapAlignment.start,
                        child: Text("Start"),
                      ),
                      DropdownMenuItem(
                        value: WrapAlignment.center,
                        child: Text("Center"),
                      ),
                      DropdownMenuItem(
                        value: WrapAlignment.end,
                        child: Text("End"),
                      ),
                      DropdownMenuItem(
                        value: WrapAlignment.spaceBetween,
                        child: Text("Space Between"),
                      ),
                      DropdownMenuItem(
                        value: WrapAlignment.spaceAround,
                        child: Text("Space Around"),
                      ),
                      DropdownMenuItem(
                        value: WrapAlignment.spaceEvenly,
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
                  DropdownButton<WrapCrossAlignment>(
                    value: selectedCrossWrapAlignment,
                    onChanged: (val) {
                      setState(() {
                        selectedCrossWrapAlignment =
                            val ?? selectedCrossWrapAlignment;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: WrapCrossAlignment.start,
                        child: Text("Start"),
                      ),
                      DropdownMenuItem(
                        value: WrapCrossAlignment.center,
                        child: Text("Center    "),
                      ),
                      DropdownMenuItem(
                        value: WrapCrossAlignment.end,
                        child: Text("End"),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CupertinoSegmentedControl<VerticalDirection>(
                    groupValue: selectedDirection,
                    unselectedColor: Colors.grey[50],
                    selectedColor: Colors.indigo,
                    onValueChanged: (val) {
                      setState(() {
                        selectedDirection = val;
                      });
                    },
                    children: const {
                      VerticalDirection.up: Text("Up"),
                      VerticalDirection.down: Text(" Down "),
                    },
                  ),
                  CupertinoSegmentedControl<Axis>(
                    groupValue: selectedAxis,
                    unselectedColor: Colors.grey[50],
                    selectedColor: Colors.indigo,
                    onValueChanged: (val) {
                      setState(() {
                        selectedAxis = val;
                      });
                    },
                    children: const {
                      Axis.vertical: Text("Vertical"),
                      Axis.horizontal: Text(" Horizontal "),
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Wrap(
          alignment: selectedWrapAlignment,
          runAlignment: selectedRunWrapAlignment,
          crossAxisAlignment: selectedCrossWrapAlignment,
          direction: selectedAxis,
          verticalDirection: selectedDirection,
          spacing: 20,
          runSpacing: 10,
          children: [
            Container(
              height: 120,
              width: 120,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text(
                "1",
                style: kContainerTextStyle,
              ),
            ),
            Container(
              height: 80,
              width: 80,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text(
                "2",
                style: kContainerTextStyle,
              ),
            ),
            Container(
              height: 95,
              width: 95,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                "3",
                style: kContainerTextStyle,
              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Text(
                "4",
                style: kContainerTextStyle,
              ),
            ),
            Container(
              height: 120,
              width: 120,
              color: Colors.indigo,
              alignment: Alignment.center,
              child: const Text(
                "5",
                style: kContainerTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
