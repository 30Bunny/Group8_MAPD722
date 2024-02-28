import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/screen/add_new_patient.dart';
import 'package:group8_mapd722/screen/patient_profile_screen.dart';
import 'package:group8_mapd722/screen/patient_tests_screen.dart';
import 'package:group8_mapd722/util/dialog_util.dart';
import 'package:group8_mapd722/widget/common_appbar.dart';
import 'package:group8_mapd722/widget/patient_card.dart';

class ViewAllPatients extends StatefulWidget {
  const ViewAllPatients({super.key});

  @override
  State<ViewAllPatients> createState() => _ViewAllPatientsState();
}

class _ViewAllPatientsState extends State<ViewAllPatients> {
  final TextEditingController _controller = TextEditingController();
  String _searchText = '';
  String categoryValue = kCategoryList[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kOffWhiteColor,
        appBar: CommonAppBar(
          title: 'Patients',
          showButton: true,
          buttonText: 'Delete All',
          buttonTextColor: Colors.red,
          onButtonTap: () => _showDeleteAllAlert(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 4, left: 12, right: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(height: 1.0),
                          controller: _controller,
                          onChanged: (value) {
                            setState(() {
                              _searchText = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: kGreyColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: kGreyColor),
                            ),
                            prefixIcon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),

                    Flexible(
                      child: DropdownButtonFormField(
                          isExpanded: true,
                          value: categoryValue,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(height: 1.0),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: kGreyColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: kGreyColor),
                            ),
                          ),
                          items: kCategoryList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              categoryValue = val.toString();
                            });
                          }),
                    ),
                  ],
                ),
              ),


              // Patient List
              ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 10,
                padding: const EdgeInsets.all(16),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return PatientCard(
                    onTap: () => _navigateToPatientProfile(),
                    onViewTests: () => _navigateToViewTests(),
                    onDelete: () => _showDeleteAlert(index),
                    onUpdate: () => _navigateToEditPatient(),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
              )
            ],
          ),
        ));
  }

  _navigateToPatientProfile(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const  PatientProfileScreen()));
  }

  _navigateToViewTests(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const  PatientTestScreen()));
  }

  _navigateToEditPatient(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const  AddNewPatient(isEdit: true,)));
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
