import 'package:fluent_ui/fluent_ui.dart' as ui;
import 'package:flutter/material.dart';
import 'package:gym/Views/dashboard.dart';
import 'package:gym/Views/enrollment.dart';
import 'package:gym/Views/equipment.dart';
import 'package:gym/Views/instructor.dart';
import 'package:gym/Views/members.dart';
import 'package:gym/Views/membership.dart';
import 'package:gym/Views/payment.dart';
import 'package:gym/Views/plan.dart';
import 'package:gym/Views/schedule.dart';
import 'package:gym/app_state.dart';
import 'package:provider/provider.dart';

List<Menu> navigation = [
  Menu(
    icon: ui.FluentIcons.view_dashboard,
    text: 'Dashboard',
    widget: const Dashboard(),
  ),
  Menu(
    icon: ui.FluentIcons.people,
    text: 'Members',
    widget: const Members(),
  ),
  Menu(
    icon: Icons.card_membership,
    text: 'Memberships',
    widget: const Membersships(),
  ),
  Menu(
    icon: ui.FluentIcons.care_plan,
    text: 'Membership plan',
    widget: const MembersshipsPlan(),
  ),
  Menu(
    icon: ui.FluentIcons.schedule_event_action,
    text: 'Class Schedule',
    widget: const Schedule(),
  ),
  Menu(
    icon: ui.FluentIcons.open_enrollment,
    text: 'Class Erollment',
    widget: const Enrollment(),
  ),
  Menu(
    icon: ui.FluentIcons.user_clapper,
    text: 'Instructor',
    widget: const Instructor(),
  ),
  Menu(
    icon: Icons.fitness_center,
    text: 'Equipment',
    widget: const Equipment(),
  ),
  Menu(
    icon: Icons.payment,
    text: 'Payment',
    widget: const Payment(),
  ),
];

var myTextStyle = const TextStyle(
  fontSize: 16,
  color: Colors.black,
  // fontWeight: FontWeight.bold,
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    var state = context.watch<MyAppState>();

    return ui.NavigationView(
      appBar: const ui.NavigationAppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Gym Management',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      pane: ui.NavigationPane(
        size: const ui.NavigationPaneSize(openMaxWidth: 200),
        items: List.generate(
          navigation.length,
          (index) => ui.PaneItem(
            title: Text(
              navigation[index].text,
              style: myTextStyle,
            ),
            icon: Icon(
              navigation[index].icon,
            ),
            body: navigation[index].widget,
          ),
        ),
        selected: state.selected,
        onChanged: (value) {
          state.onChangePage(value);
        },
      ),
    );
  }
}

class Menu {
  final IconData icon;
  final String text;
  final Widget widget;
  Menu({required this.icon, required this.text, required this.widget});
}
