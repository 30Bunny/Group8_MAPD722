import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/screen/add_new_patient.dart';
import 'package:group8_mapd722/screen/view_all_patients.dart';
import 'package:group8_mapd722/widget/custom_elevated_button.dart';
import 'package:group8_mapd722/widget/custom_outline_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLogoBackColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(kAppLogo),
            )),
            CustomElevatedButton(buttonText: 'View All Patients',onTap: () => _navigateToViewAllPatients(),),
            const SizedBox(height: 12,),
            CustomOutlineButton(buttonText: 'Add New Patient', onTap: () => _navigateToAddNewPatient(),),
            const SizedBox(height: 32,),
          ],
        ),
      ),
    );
  }

  _navigateToViewAllPatients(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewAllPatients()));
  }

  _navigateToAddNewPatient(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewPatient()));
  }
}
