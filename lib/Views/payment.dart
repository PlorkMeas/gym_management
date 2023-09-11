import 'package:fluent_ui/fluent_ui.dart' as ui;
import 'package:flutter/material.dart';
import 'package:gym/API/fetch_data.dart';
import 'package:gym/Views/members.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _MembersState();
}

class _MembersState extends State<Payment> {
  var header = <MemberHeader>[
    MemberHeader(text: 'Payment ID'),
    MemberHeader(text: 'Member ID'),
    MemberHeader(text: 'First Name'),
    MemberHeader(text: 'Last Name'),
    MemberHeader(text: 'Amount'),
    MemberHeader(text: 'Method'),
    MemberHeader(text: 'Date'),
  ];

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
                ],
              ),
            ],
          ),
          myTable(),
        ],
      ),
    );
  }

  ui.Expanded myTable() {
    return Expanded(
      child: SingleChildScrollView(
        child: StreamBuilder(
          stream: Data.paymentStream(),
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
                          data.paymentId!,
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
                      DataCell(Text(data.amount!.toString())),
                      DataCell(Text(data.methodName!)),
                      DataCell(Text(data.paymentDate!)),
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
