import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym/Data/enroll_data.dart';
import 'package:gym/Data/equipment_data.dart';
import 'package:gym/Data/instructor_data.dart';
import 'package:gym/Data/members_data.dart';
import 'package:gym/Data/memversship_data.dart';
import 'package:gym/Data/payment_data.dart';
import 'package:gym/Data/schedule_data.dart';
import 'package:gym/Data/plan_data.dart';
import 'package:http/http.dart' as http;

class Data {
  static Stream totalMembers() async* {
    final response =
        await http.get(Uri.parse('http://localhost:5000/member/total'));
    if (response.statusCode != 200) {
      debugPrint('Failed to retrieve the http package!');
    }
    List<dynamic> decode = json.decode(response.body);
    Map<String, dynamic> jsonData = decode[0];
    int total = jsonData['total'];
    yield total;
  }

  static Stream totalMembersShip() async* {
    final response =
        await http.get(Uri.parse('http://localhost:5000/membership/total'));
    if (response.statusCode != 200) {
      debugPrint('Failed to retrieve the http package!');
    }
    List<dynamic> decode = json.decode(response.body);
    Map<String, dynamic> jsonData = decode[0];
    int total = jsonData['total'];
    yield total;
  }

  static Stream totatPlan() async* {
    final response =
        await http.get(Uri.parse('http://localhost:5000/membershipplan/total'));
    if (response.statusCode != 200) {
      debugPrint('Failed to retrieve the http package!');
    }
    List<dynamic> decode = json.decode(response.body);
    Map<String, dynamic> jsonData = decode[0];
    int total = jsonData['total'];
    yield total;
  }

  static Stream<List<MemberData>> membersStream() async* {
    final response = await http.get(Uri.parse('http://localhost:5000/member'));
    if (response.statusCode != 200) {
      debugPrint('Failed to retrieve the http package!');
    }
    List<dynamic> decode = json.decode(response.body);

    List<MemberData> data = decode.map((e) => MemberData.fromJson(e)).toList();

    // print(data);

    yield data;
  }

  static insertMember(MemberData data) async {
    final response = await http.post(
        Uri.parse('http://localhost:5000/post/member'),
        body: data.toJson());
    Future.value(response.statusCode == 200);
  }

  static updateMember(MemberData data) async {
    final response = await http.put(
        Uri.parse('http://localhost:5000/put/member'),
        body: data.toJson());
    Future.value(response.statusCode == 200);
  }

  static deleteMember(MemberData data) async {
    final response = await http.delete(
        Uri.parse('http://localhost:5000/delete/member'),
        body: data.toJson());
    Future.value(response.statusCode == 200);
  }

  //! membership
  static Stream<List<MembershipData>> membersShipStream() async* {
    final response =
        await http.get(Uri.parse('http://localhost:5000/membersship'));
    if (response.statusCode != 200) {
      debugPrint('Failed to retrieve the http package!');
    }
    List<dynamic> decode = json.decode(response.body);

    List<MembershipData> data =
        decode.map((e) => MembershipData.fromJson(e)).toList();
    yield data;
  }

  static insertMemberShip(MembershipData data) async {
    final response = await http.post(
        Uri.parse('http://localhost:5000/post/membership'),
        body: data.toJson());
    Future.value(response.statusCode == 200);
  }

  //! plan
  static Stream<List<PlanData>> planStream() async* {
    final response =
        await http.get(Uri.parse('http://localhost:5000/membersshipplan'));
    if (response.statusCode != 200) {
      debugPrint('Failed to retrieve the http package!');
    }
    List<dynamic> decode = json.decode(response.body);

    List<PlanData> data = decode.map((e) => PlanData.fromJson(e)).toList();
    yield data;
  }

  //! schedule
  static Stream<List<ClassSchedule>> classStream() async* {
    final response =
        await http.get(Uri.parse('http://localhost:5000/classschedule'));
    if (response.statusCode != 200) {
      debugPrint('Failed to retrieve the http package!');
    }
    List<dynamic> decode = json.decode(response.body);

    List<ClassSchedule> data =
        decode.map((e) => ClassSchedule.fromJson(e)).toList();
    yield data;
  }

  //! payment
  static Stream<List<PaymentData>> paymentStream() async* {
    final response = await http.get(Uri.parse('http://localhost:5000/payment'));
    if (response.statusCode != 200) {
      debugPrint('Failed to retrieve the http package!');
    }
    List<dynamic> decode = json.decode(response.body);

    List<PaymentData> data =
        decode.map((e) => PaymentData.fromJson(e)).toList();
    yield data;
  }

  //! equipment
  static Stream<List<EquipmentData>> equipmentStream() async* {
    final response =
        await http.get(Uri.parse('http://localhost:5000/equipment'));
    if (response.statusCode != 200) {
      debugPrint('Failed to retrieve the http package!');
    }
    List<dynamic> decode = json.decode(response.body);

    List<EquipmentData> data =
        decode.map((e) => EquipmentData.fromJson(e)).toList();
    yield data;
  }

  static insertEquipment(EquipmentData data) async {
    final response = await http.post(
        Uri.parse('http://localhost:5000/post/equipment'),
        body: data.toJson());
    Future.value(response.statusCode == 200);
  }

  static updateEquipment(EquipmentData data) async {
    final response = await http.put(
        Uri.parse('http://localhost:5000/put/equipment'),
        body: data.toJson());
    Future.value(response.statusCode == 200);
  }

  static deleteEquiment(EquipmentData data) async {
    final response = await http.delete(
        Uri.parse('http://localhost:5000/delete/equipment'),
        body: data.toJson());
    Future.value(response.statusCode == 200);
  }

  //! instructor
  static Stream<List<InstructorData>> instructorStream() async* {
    final response =
        await http.get(Uri.parse('http://localhost:5000/instructor'));
    if (response.statusCode != 200) {
      debugPrint('Failed to retrieve the http package!');
    }
    List<dynamic> decode = json.decode(response.body);

    List<InstructorData> data =
        decode.map((e) => InstructorData.fromJson(e)).toList();
    yield data;
  }

  static insertInstructor(InstructorData data) async {
    final response = await http.post(
        Uri.parse('http://localhost:5000/post/instructor'),
        body: data.toJson());
    Future.value(response.statusCode == 200);
  }

  static updateInstructor(InstructorData data) async {
    final response = await http.put(
        Uri.parse('http://localhost:5000/put/instructor'),
        body: data.toJson());
    Future.value(response.statusCode == 200);
  }

  static deleteInstructor(InstructorData data) async {
    final response = await http.delete(
        Uri.parse('http://localhost:5000/delete/instructor'),
        body: data.toJson());
    Future.value(response.statusCode == 200);
  }
//! enrollment

  static Stream<List<EnrollData>> enrollStream() async* {
    final response =
        await http.get(Uri.parse('http://localhost:5000/enrollment'));
    if (response.statusCode != 200) {
      debugPrint('Failed to retrieve the http package!');
    }
    List<dynamic> decode = json.decode(response.body);

    List<EnrollData> data = decode.map((e) => EnrollData.fromJson(e)).toList();
    yield data;
  }
}
