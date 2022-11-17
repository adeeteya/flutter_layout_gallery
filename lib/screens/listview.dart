import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  ScrollPhysics selectedScrollPhysics = const ClampingScrollPhysics();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View"),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: Row(
            children: [
              const SizedBox(width: 20),
              const Text(
                "Scroll Physics:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 8),
              DropdownButton<ScrollPhysics>(
                value: selectedScrollPhysics,
                onChanged: (val) {
                  setState(() {
                    selectedScrollPhysics = val ?? selectedScrollPhysics;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: ClampingScrollPhysics(),
                    child: Text("Clamping Scroll Physics"),
                  ),
                  DropdownMenuItem(
                    value: BouncingScrollPhysics(),
                    child: Text("Bouncing Scroll Physics"),
                  ),
                  DropdownMenuItem(
                    value: NeverScrollableScrollPhysics(),
                    child: Text("Never Scrollable Physics"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: 100,
        addAutomaticKeepAlives: false,
        clipBehavior: Clip.none,
        physics: selectedScrollPhysics,
        separatorBuilder: (context, _) =>
            const Divider(height: 0, thickness: 1, color: Colors.black),
        itemBuilder: (context, index) => ListTile(
          tileColor: index.isEven
              ? Colors.indigo.withOpacity(0.35)
              : Colors.indigo.withOpacity(0.15),
          title: Text("Tile ${index + 1}"),
        ),
      ),
    );
  }
}
