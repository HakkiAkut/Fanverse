import 'package:flutter/material.dart';

class RecentActivities extends StatefulWidget {
  @override
  _RecentActivitiesState createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recent Activities"),
      ),
    );
  }
}
