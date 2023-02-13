import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database/data_base_sqlite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    DataBaseSqlite().openConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
