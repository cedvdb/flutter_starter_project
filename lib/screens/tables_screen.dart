import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TablesPage extends StatefulWidget {
  @override
  _TablesPageState createState() => _TablesPageState();
}

class _TablesPageState extends State<TablesPage> {
  int tables = 1;

  addTable() {
    setState(() => tables = tables + 1);
  }

  removeTable() {
    setState(() => tables = max(tables - 1, 0));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _TableActions(
              onAddTable: addTable,
              onRemoveTable: removeTable,
              tables: tables,
            ),
            Wrap(
              children: [
                for (int i = 1; i <= tables; i++) _QrCodeCard(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _TableActions extends StatelessWidget {
  final Function onAddTable;
  final Function onRemoveTable;
  final int tables;

  const _TableActions({this.onAddTable, this.onRemoveTable, this.tables});

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        if (tables > 1)
          ElevatedButton.icon(
            onPressed: onRemoveTable,
            icon: Icon(FontAwesomeIcons.minus),
            label: Text(
              tr('tables.Remove table'),
            ),
          ),
        ElevatedButton.icon(
          onPressed: onAddTable,
          icon: Icon(FontAwesomeIcons.plus),
          label: Text(
            tr('tables.Add table'),
          ),
        ),
      ],
    );
  }
}

class _QrCodeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('Table'),
          QrImage(
            data: 'test',
            version: QrVersions.auto,
            size: 200.0,
          ),
        ],
      ),
    );
  }
}
