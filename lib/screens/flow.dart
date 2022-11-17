import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_gallery/constants.dart';

class FlowDemo extends StatefulWidget {
  const FlowDemo({Key? key}) : super(key: key);

  @override
  State<FlowDemo> createState() => _FlowDemoState();
}

class _FlowDemoState extends State<FlowDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late FlowDelegate selectedFlowDelegate;
  int counter = 0;
  int selectedPos = 1;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    selectedFlowDelegate = ColumnMenuFlowDelegate(animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flow"),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoSegmentedControl<int>(
                  groupValue: selectedPos,
                  unselectedColor: Colors.grey[50],
                  selectedColor: Colors.indigo,
                  onValueChanged: (val) {
                    setState(
                      () {
                        selectedPos = val;
                        if (val == 0) {
                          selectedFlowDelegate =
                              RowMenuFlowDelegate(animationController);
                        } else if (val == 1) {
                          selectedFlowDelegate =
                              ColumnMenuFlowDelegate(animationController);
                        } else {
                          selectedFlowDelegate =
                              CrossMenuFlowDelegate(animationController);
                        }
                      },
                    );
                  },
                  children: const {
                    0: Text("Row Menu"),
                    1: Text(" Column Menu "),
                    2: Text("Cross Menu"),
                  },
                ),
                const SizedBox(height: 50),
                Text(
                  "Value of the Counter: $counter",
                  style: kTableRowTextStyle,
                ),
              ],
            ),
          ),
          Flow(
            delegate: selectedFlowDelegate,
            children: [
              FloatingActionButton(
                heroTag: "Menu",
                onPressed: () {
                  if (animationController.isCompleted) {
                    animationController.reverse();
                  } else {
                    animationController.forward();
                  }
                },
                child: const Icon(Icons.menu),
              ),
              FloatingActionButton(
                heroTag: "Add",
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: "Subtract",
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: "Refresh",
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
                },
                child: const Icon(Icons.refresh),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RowMenuFlowDelegate extends FlowDelegate {
  final Animation<double> controller;

  RowMenuFlowDelegate(this.controller) : super(repaint: controller);
  @override
  void paintChildren(FlowPaintingContext context) {
    const double margin = 16;
    final xStart = context.size.width - 56 - margin;
    final yStart = context.size.height - 56 - margin;
    for (int i = context.childCount - 1; i >= 0; i--) {
      final childWidth = context.getChildSize(i)?.width ?? 56;
      final childXPosition = (childWidth + margin) * i;
      final dx = xStart - childXPosition * controller.value;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          dx,
          yStart,
          0,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => true;
}

class ColumnMenuFlowDelegate extends FlowDelegate {
  final Animation<double> controller;

  ColumnMenuFlowDelegate(this.controller) : super(repaint: controller);
  @override
  void paintChildren(FlowPaintingContext context) {
    const double margin = 16;
    final xStart = context.size.width - 56 - margin;
    final yStart = context.size.height - 56 - margin;
    for (int i = context.childCount - 1; i >= 0; i--) {
      final childHeight = context.getChildSize(i)?.height ?? 56;
      final childYPosition = (childHeight + margin) * i;
      final dy = yStart - childYPosition * controller.value;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          xStart,
          dy,
          0,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => true;
}

class CrossMenuFlowDelegate extends FlowDelegate {
  final Animation<double> controller;

  CrossMenuFlowDelegate(this.controller) : super(repaint: controller);
  @override
  void paintChildren(FlowPaintingContext context) {
    const double initialMargin = 16;
    const double margin = 2;
    final xStart = context.size.width - 56 - initialMargin;
    final yStart = context.size.height - 56 - initialMargin;
    for (int i = context.childCount - 1; i >= 0; i--) {
      final childWidth = context.getChildSize(i)?.width ?? 56;
      final childHeight = context.getChildSize(i)?.height ?? 56;
      final childXPosition = (childWidth + margin) * i;
      final childYPosition = (childHeight + margin) * i;
      final dx = xStart - childXPosition * controller.value;
      final dy = yStart - childYPosition * controller.value;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          dx,
          dy,
          0,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => true;
}
