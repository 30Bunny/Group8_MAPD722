import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/screen/patient_tests_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kOffWhiteColor,
        appBar: const CommonAppBar(
          title: 'Patients',
          showButton: true,
          buttonText: 'Delete All',
          buttonTextColor: Colors.red,
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
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(color: kGreyColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(color: kGreyColor),
                            ),
                            prefixIcon: const Icon(Icons.search),
                          ),
                        ),
                      ),
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
                    onViewTests: () => _navigateToViewTests(),
                    onDelete: (){},
                    onUpdate: (){},
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 12);
                },
              )
            ],
          ),
        ));
  }

  _navigateToViewTests(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const  PatientTestScreen()));
  }
}
