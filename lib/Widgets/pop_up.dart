import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as ui;

class PopUp {
  static insertMemberData(BuildContext context) async {
    ui.showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Add member",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          content: SizedBox(
            height: 800,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'First Name',
                    child: const ui.TextBox(
                      padding: EdgeInsets.all(10),
                      style: ui.TextStyle(fontSize: 16),
                      placeholder: 'Enter firstname',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'Last Name',
                    child: const ui.TextBox(
                      padding: EdgeInsets.all(10),
                      style: ui.TextStyle(fontSize: 16),
                      placeholder: 'Enter lastname',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'First Name',
                    child: const ui.TextBox(
                      padding: EdgeInsets.all(10),
                      style: ui.TextStyle(fontSize: 16),
                      placeholder: 'Enter firstname',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'First Name',
                    child: const ui.TextBox(
                      padding: EdgeInsets.all(10),
                      style: ui.TextStyle(fontSize: 16),
                      placeholder: 'Enter firstname',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ui.InfoLabel(
                    labelStyle: const ui.TextStyle(fontSize: 16),
                    label: 'First Name',
                    child: const ui.TextBox(
                      padding: EdgeInsets.all(10),
                      style: ui.TextStyle(fontSize: 16),
                      placeholder: 'Enter firstname',
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ui.FilledButton(
              child: const Text('Add'),
              onPressed: () => Navigator.pop(context),
            ),
            ui.Button(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
        // return ui.ContentDialog(
        //   constraints: ui.BoxConstraints(minHeight: 1),
        //   title: const Text("Add member"),
        //   content: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Column(
        //         children: [
        //           ui.InfoLabel(
        //             labelStyle: const ui.TextStyle(fontSize: 18),
        //             label: 'First Name',
        //             child: const ui.TextBox(
        //               padding: EdgeInsets.all(10),
        //               style: ui.TextStyle(fontSize: 16),
        //               placeholder: 'Enter firstname',
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           ui.InfoLabel(
        //             labelStyle: const ui.TextStyle(fontSize: 18),
        //             label: 'First Name',
        //             child: const ui.TextBox(
        //               padding: EdgeInsets.all(10),
        //               style: ui.TextStyle(fontSize: 16),
        //               placeholder: 'Enter firstname',
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           ui.InfoLabel(
        //             labelStyle: const ui.TextStyle(fontSize: 18),
        //             label: 'First Name',
        //             child: const ui.TextBox(
        //               padding: EdgeInsets.all(10),
        //               style: ui.TextStyle(fontSize: 16),
        //               placeholder: 'Enter firstname',
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        //   actions: [
        //     ui.FilledButton(
        //       child: const Text('Add'),
        //       onPressed: () => Navigator.pop(context),
        //     ),
        //     ui.Button(
        //       child: const Text('Cancel'),
        //       onPressed: () {
        //         Navigator.pop(context);
        //         // Delete file here
        //       },
        //     ),
        //   ],
        // );
      },
    );
  }
}
