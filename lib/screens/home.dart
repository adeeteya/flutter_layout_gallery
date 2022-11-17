import 'package:flutter/material.dart';
import 'package:flutter_layout_gallery/screens/column.dart';
import 'package:flutter_layout_gallery/screens/flow.dart';
import 'package:flutter_layout_gallery/screens/grid.dart';
import 'package:flutter_layout_gallery/screens/listview.dart';
import 'package:flutter_layout_gallery/screens/listwheel_scrollview.dart';
import 'package:flutter_layout_gallery/screens/reorderable_listview.dart';
import 'package:flutter_layout_gallery/screens/row.dart';
import 'package:flutter_layout_gallery/screens/stack.dart';
import 'package:flutter_layout_gallery/screens/table.dart';
import 'package:flutter_layout_gallery/screens/wrap.dart';
import 'package:flutter_layout_gallery/widgets/menu_tile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Layout Gallery"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
        children: [
          MenuTile(
            name: "Row",
            assetPath: "assets/row.png",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RowDemo(),
                ),
              );
            },
          ),
          MenuTile(
            name: "Column",
            assetPath: "assets/column.png",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ColumnDemo(),
                ),
              );
            },
          ),
          MenuTile(
            name: "Wrap",
            assetPath: "assets/wrap.png",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const WrapDemo(),
                ),
              );
            },
          ),
          MenuTile(
            name: "Stack",
            assetPath: "assets/stack.png",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StackDemo(),
                ),
              );
            },
          ),
          MenuTile(
            name: "Flow",
            assetPath: "assets/flow.png",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FlowDemo(),
                ),
              );
            },
          ),
          MenuTile(
            name: "Table",
            assetPath: "assets/table.png",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TableDemo(),
                ),
              );
            },
          ),
          MenuTile(
            name: "List View",
            assetPath: "assets/listview.png",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ListViewDemo(),
                ),
              );
            },
          ),
          MenuTile(
            name: "Reorderable List View",
            assetPath: "assets/reorder-list.png",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ReorderableListViewDemo(),
                ),
              );
            },
          ),
          MenuTile(
            name: "List Wheel Scroll View",
            assetPath: "assets/scroll.png",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ListWheelScrollViewDemo(),
                ),
              );
            },
          ),
          MenuTile(
            name: "Grid View",
            assetPath: "assets/grid.png",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const GridViewDemo(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
