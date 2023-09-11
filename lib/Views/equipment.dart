import 'package:fluent_ui/fluent_ui.dart' as ui;
import 'package:flutter/material.dart';
import 'package:gym/API/fetch_data.dart';
import 'package:gym/Data/equipment_data.dart';
import 'package:gym/Views/members.dart';

class Equipment extends StatefulWidget {
  const Equipment({super.key});

  @override
  State<Equipment> createState() => _MembersState();
}

class _MembersState extends State<Equipment> {
  var header = <MemberHeader>[
    MemberHeader(text: 'Equipment ID'),
    MemberHeader(text: 'Equipment Name'),
    MemberHeader(text: 'Quantity'),
    MemberHeader(text: ''),
  ];

  final _name = TextEditingController();
  final _qty = TextEditingController();

  clearInput() {
    _name.clear();
    _qty.clear();
  }

  _refresh() {
    _search.clear();
    setState(() {});
  }

  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: ui.TextBox(
                  controller: _search,
                  placeholder: 'Search by ID',
                  onSubmitted: (value) => setState(() {}),
                ),
              ),
              Row(
                children: [
                  ui.FilledButton(
                    onPressed: _refresh,
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(ui.FluentIcons.process),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ui.FilledButton(
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          ui.Icon(ui.FluentIcons.add),
                          SizedBox(width: 8),
                          Text('Add New'),
                        ],
                      ),
                    ),
                    onPressed: () {
                      input(context);
                    },
                  )
                ],
              ),
            ],
          ),
          myTable(),
        ],
      ),
    );
  }

  Future<Object?> input(ui.BuildContext context, {EquipmentData? data}) {
    if (data != null) {
      _name.text = data.equipmentName!;
      _qty.text = data.quantity!.toString();
    }
    return ui.showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            data == null ? "Add member" : "Update member",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          content: SizedBox(
            height: 200,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'Equipment Name',
                    child: ui.TextBox(
                      controller: _name,
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'Equipment Qty',
                    child: ui.TextBox(
                      controller: _qty,
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ui.FilledButton(
              child: Text(data == null ? 'Add' : 'Update'),
              onPressed: () async {
                if (data == null) {
                  await Data.insertEquipment(EquipmentData(
                      equipmentName: _name.text,
                      quantity: int.parse(_qty.text)));
                } else {
                  await Data.updateEquipment(EquipmentData(
                      equipmentId: data.equipmentId,
                      equipmentName: _name.text,
                      quantity: int.parse(_qty.text)));
                }
                clearInput();
                _refresh();
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
            ),
            ui.Button(
              child: const Text('Cancel'),
              onPressed: () {
                clearInput();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  ui.Expanded myTable() {
    return Expanded(
      child: SingleChildScrollView(
        child: StreamBuilder(
          stream: Data.equipmentStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Handle the error case
              return Text('Error: ${snapshot.error}');
            }
            var member = snapshot.data;
            member!.removeWhere(
              (element) =>
                  element.equipmentId!.contains(_search.text.toUpperCase()) ==
                  false,
            );
            return DataTable(
              columns: List.generate(
                header.length,
                (index) {
                  return DataColumn(
                    label: Expanded(
                      child: Text(
                        header[index].text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              rows: List.generate(
                member.length,
                (index) {
                  var data = member[index];
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(
                          data.equipmentId!,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(Text(data.equipmentName!)),
                      DataCell(Text(data.quantity!.toString())),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton.icon(
                                onPressed: () {
                                  input(context, data: data);
                                },
                                icon: const Icon(Icons.edit),
                                label: const Text('Edit')),
                            ui.IconButton(
                              onPressed: () async {
                                await showDialog<String>(
                                  context: context,
                                  builder: (context) => ui.ContentDialog(
                                    title:
                                        const Text('Delete data permanently?'),
                                    actions: [
                                      ui.FilledButton(
                                        child: const Text('Delete'),
                                        onPressed: () async {
                                          await Data.deleteEquiment(data);
                                          _refresh();
                                          // ignore: use_build_context_synchronously
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ui.Button(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          // Delete file here
                                        },
                                      ),
                                    ],
                                  ),
                                );
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
