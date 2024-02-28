import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/screen/add_test_screen.dart';
import 'package:group8_mapd722/widget/common_appbar.dart';
import 'package:group8_mapd722/widget/patient_card.dart';

class PatientTestScreen extends StatefulWidget {
  const PatientTestScreen({super.key});

  @override
  State<PatientTestScreen> createState() => _PatientTestScreenState();
}

class _PatientTestScreenState extends State<PatientTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Patient Tests',
        showButton: true,
        buttonText: 'Delete All',
        buttonTextColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        onPressed: () => _navigateToAddTest(),
        label: Text('Add Test', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),),
        icon: const Icon(Icons.add, color: Colors.white, size: 20),
      ),
      body: _getBody,
    );
  }

  get _getBody{
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 10,
      padding: const EdgeInsets.all(16),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) {
        return const PatientCard();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
    );
  }

  _navigateToAddTest(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const  AddTestScreen()));
  }
}
