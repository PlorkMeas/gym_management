import 'package:fluent_ui/fluent_ui.dart' as ui;
import 'package:flutter/material.dart';
import 'package:gym/API/fetch_data.dart';
import 'package:gym/Data/instructor_data.dart';
import 'package:gym/Data/members_data.dart';

class Enrollment extends StatefulWidget {
  const Enrollment({super.key});

  @override
  State<Enrollment> createState() => _MembersState();
}

class _MembersState extends State<Enrollment> {
  int? selected;

  var header = <MemberHeader>[
    MemberHeader(text: 'Member ID'),
    MemberHeader(text: 'First Name'),
    MemberHeader(text: 'Last Name'),
    MemberHeader(text: 'Class ID'),
    MemberHeader(text: 'Class Name'),
    MemberHeader(text: 'Enroll Date'),
  ];

  var gender = ['Male', 'Female'];

  _refresh() {
    _search.clear();
    setState(() {});
  }

  final _search = TextEditingController();

  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _gender = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _speciaties = TextEditingController();
  final _address = TextEditingController();

  clearInput() {
    _firstname.clear();
    _lastname.clear();
    _gender.clear();
    _email.clear();
    _phone.clear();
    _speciaties.clear();
    _address.clear();
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

  Future<Object?> input(ui.BuildContext context,
      {InstructorData? data, bool view = false}) {
    if (data != null) {
      _firstname.text = data.firstName!;
      _lastname.text = data.lastName!;
      _gender.text = data.gender!;
      _email.text = data.email!;
      _phone.text = data.phone!;
      _address.text = data.address!;
      _speciaties.text = data.specialties!;
    }
    return ui.showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            data == null
                ? "Add New"
                : view
                    ? "Details"
                    : "Update instuctor",
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
                    label: 'First Name',
                    child: ui.TextBox(
                      readOnly: view,
                      controller: _firstname,
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'Last Name',
                    child: ui.TextBox(
                      readOnly: view,
                      controller: _lastname,
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'Gender',
                    child: ui.TextBox(
                      readOnly: view,
                      controller: _gender,
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'Email',
                    child: ui.TextBox(
                      readOnly: view,
                      controller: _email,
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'Phone',
                    child: ui.TextBox(
                      readOnly: view,
                      controller: _phone,
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'Specialties',
                    child: ui.TextBox(
                      readOnly: view,
                      controller: _speciaties,
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'Address',
                    child: ui.TextBox(
                      readOnly: view,
                      controller: _address,
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                // ui.ComboBox<String>(
                //   isExpanded: false,
                //   value: selectgender,
                //   items: const [
                //     ui.ComboBoxItem(
                //       value: 'M',
                //       child: Text('Male'),
                //     ),
                //     ui.ComboBoxItem(
                //       value: 'F',
                //       child: Text('Female'),
                //     ),
                //   ],
                //   onChanged: (value) {
                //     setState(() => selectgender = value);
                //   },
                // ),
                // Row(
                //   children: List.generate(
                //     gender.length,
                //     (index) => ui.RadioButton(
                //       checked: selected == index,
                //       content: Text(
                //         gender[index],
                //       ),
                //       onChanged: (value) {
                //         setState(() {
                //           selected = index;
                //         });
                //       },
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          actions: [
            !view
                ? ui.FilledButton(
                    child: Text(data == null ? 'Add' : 'Update'),
                    onPressed: () async {
                      if (data == null) {
                        await Data.insertMember(
                          MemberData(
                            firstName: _firstname.text,
                            lastName: _lastname.text,
                            gender: _gender.text,
                            email: _email.text,
                            address: _address.text,
                            birthDate: _speciaties.text,
                            phoneNumber: _phone.text,
                          ),
                        );
                      } else {
                        await Data.updateMember(
                          MemberData(
                            memberId: data.instructorId,
                            firstName: _firstname.text,
                            lastName: _lastname.text,
                            gender: _gender.text,
                            email: _email.text,
                            address: _address.text,
                            birthDate: _speciaties.text,
                            phoneNumber: _phone.text,
                          ),
                        );
                      }
                      clearInput();
                      _refresh();
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                  )
                : const SizedBox(),
            ui.Button(
              child: const Text(
                'Cancel',
              ),
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
          stream: Data.enrollStream(),
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
                          data.memberId!,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(Text(data.firstName!)),
                      DataCell(Text(data.lastName!)),
                      DataCell(Text(data.classId!)),
                      DataCell(Text(data.className!)),
                      DataCell(Text(data.enrollmentDate!)),
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
