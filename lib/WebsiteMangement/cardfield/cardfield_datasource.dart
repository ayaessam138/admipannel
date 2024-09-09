import 'package:afcooadminpanel/WebsiteMangement/cardfield/cardfieldModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CardfieldDataSource extends DataGridSource {
  BuildContext context;
  final Function(int index) doShowDetails;
  final Function(int index) doEdit;
  final Function(int index) doRemove;
  GlobalKey<SfDataGridState> gridKey;
  int index = 1;

  CardfieldDataSource(
      {required List<CardFieldModel> CardfieldList,
      required this.context,
      required this.doShowDetails,
      required this.doEdit,
      required this.doRemove,
      required this.gridKey}) {
    dataGridRows = CardfieldList.map<DataGridRow>((dataGridRow) =>
        DataGridRow(cells: [
          DataGridCell<int>(columnName: 'index', value: index++),
          DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
          DataGridCell<String>(columnName: 'title', value: dataGridRow.title),
          DataGridCell<String>(
              columnName: 'title in English', value: dataGridRow.titleEn),
          DataGridCell<String>(columnName: 'image', value: dataGridRow.image),
          DataGridCell<int>(columnName: 'status', value: dataGridRow.status),
          DataGridCell<int>(columnName: 'sortat', value: dataGridRow.sortAt),
        ])).toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    int index = dataGridRows.indexOf(row);

    return DataGridRowAdapter(
        color: index % 2 == 1 ? const Color(0xffD1D9D3) : Colors.white,
        cells: [
          for (DataGridCell oneCell in row.getCells())
            _build_one_cell(
              oneCell,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    doShowDetails(index);
                  },
                  child: Container(
                    // width: MediaQuery.of(context).size.width*.02,
                    alignment: Alignment.center,
                    color:
                        index % 2 == 1 ? const Color(0xffD1D9D3) : Colors.white,
                    margin: const EdgeInsets.all(1),
                    child: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    doEdit(index);
                  },
                  child: Container(
                    // width: MediaQuery.of(context).size.width*.02,
                    alignment: Alignment.center,
                    color:
                        index % 2 == 1 ? const Color(0xffD1D9D3) : Colors.white,
                    margin: const EdgeInsets.all(1),
                    // padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await doRemove(index);
                  },
                  child: Container(
                    // width: MediaQuery.of(context).size.width*.02,
                    alignment: Alignment.center,
                    color:
                        index % 2 == 1 ? const Color(0xffD1D9D3) : Colors.white,
                    margin: const EdgeInsets.all(1),
                    // padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]);
  }

  Widget _build_one_cell(DataGridCell oneCell) {
    return Container(
        alignment: Alignment.center,

        // padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: oneCell.columnName == 'image'
            ? Image.network(oneCell.value,errorBuilder: (context, error, stackTrace) {
              return SvgPicture.asset('assets/images/image_placeholder.svg');
            },)
            : Text(
                oneCell.value.toString(),
                overflow: TextOverflow.ellipsis,
              ));
  }
}
