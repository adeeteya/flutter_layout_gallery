import 'package:flutter/material.dart';

class ReorderableListViewDemo extends StatefulWidget {
  const ReorderableListViewDemo({Key? key}) : super(key: key);

  @override
  State<ReorderableListViewDemo> createState() =>
      _ReorderableListViewDemoState();
}

class _ReorderableListViewDemoState extends State<ReorderableListViewDemo> {
  final List<int> _itemsList = List.generate(100, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reorderable List View"),
      ),
      body: ReorderableListView(
        header: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Hold and drag to start re-ordering",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int temp = _itemsList.removeAt(oldIndex);
            _itemsList.insert(newIndex, temp);
          });
        },
        children: [
          for (int i = 0; i < 100; i++)
            ListTile(
              key: ValueKey(i),
              tileColor: _itemsList[i].isEven
                  ? Colors.indigo.withOpacity(0.15)
                  : Colors.indigo.withOpacity(0.35),
              title: Text("Item ${_itemsList[i]}"),
            )
        ],
      ),
    );
  }
}
