import 'package:flutter/material.dart';
import 'package:gym/API/fetch_data.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var data = <DashboardData>[
      DashboardData(
          total: Data.totalMembers(),
          description: 'Active Members',
          color: Colors.blue,
          icon: Icons.people_alt_outlined),
      DashboardData(
          total: Data.totalMembersShip(),
          description: 'Membership',
          color: Colors.pinkAccent,
          icon: Icons.card_membership),
      DashboardData(
          total: Data.totatPlan(),
          description: 'Total Plans',
          color: Colors.deepPurpleAccent,
          icon: Icons.playlist_add_check_rounded),
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              data.length,
              (index) {
                return Expanded(
                  child: Container(
                    height: 250,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: data[index].color,
                        borderRadius: BorderRadius.circular(10)),
                    child: StreamBuilder(
                      stream: data[index].total,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          // Handle the error case
                          return Text('Error: ${snapshot.error}');
                        }
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data.toString(),
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  data[index].description,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              data[index].icon,
                              size: 50,
                              color: Colors.white,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardData {
  final Stream total;
  late String description;
  late Color color;
  late IconData icon;
  DashboardData(
      {required this.total,
      required this.description,
      required this.color,
      required this.icon});
  DashboardData.fromMap(Map<String, dynamic> res) : total = res['total'];
}
