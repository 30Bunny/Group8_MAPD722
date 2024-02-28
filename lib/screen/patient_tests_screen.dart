import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/screen/add_test_screen.dart';
import 'package:group8_mapd722/util/dialog_util.dart';
import 'package:group8_mapd722/widget/common_appbar.dart';
import 'package:group8_mapd722/widget/test_card.dart';

class PatientTestScreen extends StatefulWidget {
  const PatientTestScreen({super.key});

  @override
  State<PatientTestScreen> createState() => _PatientTestScreenState();
}

class _PatientTestScreenState extends State<PatientTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Patient Tests',
        showButton: true,
        buttonText: 'Delete All',
        buttonTextColor: Colors.red,
        onButtonTap: () => _showDeleteAllAlert(),
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
      itemBuilder: (ctx, index) {
        return TestCard(
          onDelete: () => _showDeleteAlert(index),
          onUpdate: () => _navigateToEditTest(),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
    );
  }

  _navigateToAddTest(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const  AddTestScreen()));
  }

  _navigateToEditTest(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const  AddTestScreen(isEdit: true,)));
  }

  _showDeleteAllAlert(){
    DialogUtil.getInstance()?.showAlertDialog(context, 'Are you sure you want to delete all records?',title: 'Delete All', onButtonTap: () => _onDeleteAll());
  }

  _onDeleteAll(){
    Navigator.pop(context);
    //Todo
  }

  _showDeleteAlert(int index){
    DialogUtil.getInstance()?.showAlertDialog(context, 'Are you sure you want to delete records?',title: 'Delete', onButtonTap: () => _onDelete(index));
  }

  _onDelete(int index){
    Navigator.pop(context);
    //Todo
  }
}
