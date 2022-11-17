import 'package:flutter/material.dart';
import 'package:flutter_layout_gallery/constants.dart';

class ListWheelScrollViewDemo extends StatefulWidget {
  const ListWheelScrollViewDemo({Key? key}) : super(key: key);

  @override
  State<ListWheelScrollViewDemo> createState() =>
      _ListWheelScrollViewDemoState();
}

class _ListWheelScrollViewDemoState extends State<ListWheelScrollViewDemo> {
  late final FixedExtentScrollController scrollController;
  double perspective = 0.003;
  double diameterRatio = 2.0;
  double squeeze = 1;

  @override
  void initState() {
    scrollController = FixedExtentScrollController(initialItem: 10);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Wheel Scroll View"),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 140),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    "Perspective:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Slider.adaptive(
                    min: 0.0000001,
                    max: 0.01,
                    value: perspective,
                    onChanged: (val) {
                      setState(() {
                        perspective = val;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    "Diameter:    ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Slider.adaptive(
                      min: 0.5,
                      max: 5,
                      value: diameterRatio,
                      onChanged: (val) {
                        setState(() {
                          diameterRatio = val;
                        });
                      }),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    "Squeeze:     ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Slider.adaptive(
                    min: 0.4,
                    max: 1.1,
                    value: squeeze,
                    onChanged: (val) {
                      setState(() {
                        squeeze = val;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios),
        onPressed: () {
          scrollController.animateToItem(
            scrollController.selectedItem + 1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
      ),
      body: ListWheelScrollView.useDelegate(
        itemExtent: 150,
        controller: scrollController,
        perspective: perspective,
        diameterRatio: diameterRatio,
        squeeze: squeeze,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: 100,
          builder: (context, index) => Container(
            height: 150,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Item $index",
              style: kContainerTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
