import 'package:flutter/widgets.dart';

class ChooseYearScreen extends StatefulWidget {
  const ChooseYearScreen({Key? key}) : super(key: key);

  @override
  State<ChooseYearScreen> createState() {
    return _ChoooseYearScreenState();
  }
}

class _ChoooseYearScreenState extends State<ChooseYearScreen> {
  @override
  Widget build(Object context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }
}

Widget _
