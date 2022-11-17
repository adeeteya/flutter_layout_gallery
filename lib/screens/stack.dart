import 'package:flutter/material.dart';
import 'package:flutter_layout_gallery/constants.dart';

class StackDemo extends StatefulWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  State<StackDemo> createState() => _StackDemoState();
}

class _StackDemoState extends State<StackDemo> {
  AlignmentGeometry selectedAlignment = AlignmentDirectional.center;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack"),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    "Alignment Direction:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<AlignmentGeometry>(
                    value: selectedAlignment,
                    onChanged: (val) {
                      setState(() {
                        selectedAlignment = val ?? selectedAlignment;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: AlignmentDirectional.topStart,
                        child: Text("Top Start"),
                      ),
                      DropdownMenuItem(
                        value: AlignmentDirectional.topCenter,
                        child: Text("Top Center"),
                      ),
                      DropdownMenuItem(
                        value: AlignmentDirectional.topEnd,
                        child: Text("Top End"),
                      ),
                      DropdownMenuItem(
                        value: AlignmentDirectional.centerStart,
                        child: Text("Center Start"),
                      ),
                      DropdownMenuItem(
                        value: AlignmentDirectional.center,
                        child: Text("Center"),
                      ),
                      DropdownMenuItem(
                        value: AlignmentDirectional.centerEnd,
                        child: Text("Center End"),
                      ),
                      DropdownMenuItem(
                        value: AlignmentDirectional.bottomStart,
                        child: Text("Bottom Start"),
                      ),
                      DropdownMenuItem(
                        value: AlignmentDirectional.bottomCenter,
                        child: Text("Bottom Center"),
                      ),
                      DropdownMenuItem(
                        value: AlignmentDirectional.bottomEnd,
                        child: Text("Bottom End"),
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
        child: Stack(
          alignment: selectedAlignment,
          children: [
            Container(
              height: 250,
              width: 250,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text(
                "1",
                style: kContainerTextStyle,
              ),
            ),
            Container(
              height: 120,
              width: 120,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text(
                "2",
                style: kContainerTextStyle,
              ),
            ),
            Container(
              height: 55,
              width: 55,
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
