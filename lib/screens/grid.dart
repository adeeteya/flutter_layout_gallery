import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  State<GridViewDemo> createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  int crossAxisCount = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid View"),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: Row(
            children: [
              const SizedBox(width: 20),
              const Text(
                "Cross Axis Count:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Slider.adaptive(
                min: 1,
                max: 10,
                value: crossAxisCount.toDouble(),
                onChanged: (val) {
                  setState(() {
                    crossAxisCount = val.toInt();
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: 999,
        addAutomaticKeepAlives: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: crossAxisCount,
        ),
        itemBuilder: (context, index) => Container(
          color: Colors.indigo,
          alignment: Alignment.center,
          child: Text(
            "${index + 1}",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
