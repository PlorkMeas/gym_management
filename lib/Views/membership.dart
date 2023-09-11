import 'package:fluent_ui/fluent_ui.dart' as ui;
import 'package:flutter/material.dart';
import 'package:gym/API/fetch_data.dart';

import 'package:gym/Data/memversship_data.dart';

class Membersships extends StatefulWidget {
  const Membersships({super.key});

  @override
  State<Membersships> createState() => _MembersState();
}

class _MembersState extends State<Membersships> {
  int? selected;

  var header = <MemberHeader>[
    MemberHeader(text: 'Membership ID'),
    MemberHeader(text: 'Member ID'),
    MemberHeader(text: 'First Name'),
    MemberHeader(text: 'Last Name'),
    MemberHeader(text: 'Start'),
    MemberHeader(text: 'End'),
    MemberHeader(text: 'Plan'),
  ];

  var gender = ['Male', 'Female'];

  _refresh() {
    _search.clear();
    setState(() {});
  }

  final _search = TextEditingController();

  final _memberid = TextEditingController();
  final _membershipid = TextEditingController();
  final plan = TextEditingController();

  clearInput() {
    _memberid.clear();
    _membershipid.clear();
    plan.clear();
  }

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
                  ui.Button(
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
                          Text('Add new'),
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

  Future<Object?> input(ui.BuildContext context, {MembershipData? data}) {
    if (data != null) {
      _memberid.text = data.memberId!;
      _membershipid.text = data.membershipId!;
      plan.text = data.planId!;
    }
    return ui.showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            data == null ? "Add" : "Update",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          content: SizedBox(
            height: 600,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'Member id',
                    child: ui.TextBox(
                      controller: _memberid,
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'Membership id',
                    child: ui.TextBox(
                      controller: _membershipid,
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'Payment Method',
                    child: ui.TextBox(
                      controller: plan,
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ui.FilledButton(
              child: const Text('Add'),
              onPressed: () async {
                await Data.insertMemberShip(
                  MembershipData(
                    memberId: _memberid.text,
                    membershipId: _membershipid.text,
                    planId: plan.text,
                  ),
                );
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
          stream: Data.membersShipStream(),
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
                  element.memberId!.contains(_search.text.toUpperCase()) ==
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
                          data.membershipId!,
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          data.memberId!,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(Text(data.firstName!)),
                      DataCell(Text(data.lastName!)),
                      DataCell(Text(data.startDate!)),
                      DataCell(Text(data.endDate!)),
                      DataCell(Text(data.name!)),
                      // DataCell(
                      //   Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       ui.HyperlinkButton(
                      //         onPressed: () {},
                      //         child: const Text('Details'),
                      //       ),
                      //       OutlinedButton.icon(
                      //           onPressed: () {
                      //             input(context, data: data);
                      //           },
                      //           icon: const Icon(Icons.edit),
                      //           label: const Text('Edit')),
                      //       ui.IconButton(
                      //         onPressed: () async {
                      //           await showDialog<String>(
                      //             context: context,
                      //             builder: (context) => ui.ContentDialog(
                      //               title:
                      //                   const Text('Delete data permanently?'),
                      //               actions: [
                      //                 ui.FilledButton(
                      //                   child: const Text('Delete'),
                      //                   onPressed: () async {
                      //                     await Data.deleteMember(data);
                      //                     _refresh();
                      //                     // ignore: use_build_context_synchronously
                      //                     Navigator.pop(context);
                      //                   },
                      //                 ),
                      //                 ui.Button(
                      //                   child: const Text('Cancel'),
                      //                   onPressed: () {
                      //                     Navigator.pop(context);
                      //                     // Delete file here
                      //                   },
                      //                 ),
                      //               ],
                      //             ),
                      //           );
                      //           setState(() {});
                      //         },
                      //         icon: const Icon(
                      //           Icons.delete,
                      //           color: Colors.red,
                      //           size: 20,
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // )
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

class MemberHeader {
  final String text;
  final int space;
  MemberHeader({required this.text, this.space = 0});
}
