import 'package:flutter/material.dart';
import 'package:flutter_layout_gallery/constants.dart';

class TableDemo extends StatefulWidget {
  const TableDemo({Key? key}) : super(key: key);

  @override
  State<TableDemo> createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
  TableCellVerticalAlignment selectedTableCellVerticalAlignment =
      TableCellVerticalAlignment.middle;

  TableRow _buildTableRow(int index, double height, String name, Color color) {
    return TableRow(
      children: [
        Center(child: Text(index.toString(), style: kTableRowTextStyle)),
        Center(child: Text(name, style: kTableRowTextStyle)),
        ColoredBox(
          color: color,
          child: SizedBox(height: height),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Table"),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    "Vertical Alignment:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<TableCellVerticalAlignment>(
                    value: selectedTableCellVerticalAlignment,
                    onChanged: (val) {
                      setState(() {
                        selectedTableCellVerticalAlignment =
                            val ?? selectedTableCellVerticalAlignment;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: TableCellVerticalAlignment.top,
                        child: Text("Top"),
                      ),
                      DropdownMenuItem(
                        value: TableCellVerticalAlignment.middle,
                        child: Text("Middle"),
                      ),
                      DropdownMenuItem(
                        value: TableCellVerticalAlignment.bottom,
                        child: Text("Bottom"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Table(
          border: TableBorder.all(),
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2.1),
            2: FlexColumnWidth(2.1)
          },
          defaultVerticalAlignment: selectedTableCellVerticalAlignment,
          children: [
            const TableRow(children: [
              Center(child: Text("S.No", style: kTableRowTextStyle)),
              Center(child: Text("Name", style: kTableRowTextStyle)),
              Center(child: Text("Color", style: kTableRowTextStyle)),
            ]),
            _buildTableRow(1, 30, "Red", Colors.red),
            _buildTableRow(2, 70, "Green", Colors.green),
            _buildTableRow(3, 45, "Blue", Colors.blue),
            _buildTableRow(4, 90, "Indigo", Colors.indigo),
            _buildTableRow(5, 65, "Amber", Colors.amber),
            _buildTableRow(6, 15, "Grey", Colors.grey),
            _buildTableRow(7, 85, "Lime", Colors.lime),
            _buildTableRow(8, 55, "Cyan", Colors.cyan),
            _buildTableRow(9, 20, "Brown", Colors.brown),
            _buildTableRow(10, 35, "Pink", Colors.pink),
            _buildTableRow(11, 65, "Orange", Colors.orange),
            _buildTableRow(12, 95, "Purple", Colors.purple),
            _buildTableRow(13, 5, "Black", Colors.black),
            _buildTableRow(14, 75, "Teal", Colors.teal),
            _buildTableRow(15, 45, "Yellow", Colors.yellow),
          ],
        ),
      ),
    );
  }
}
