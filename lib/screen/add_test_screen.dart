import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/provider/add_test_provider.dart';
import 'package:group8_mapd722/util/util.dart';
import 'package:group8_mapd722/widget/common_appbar.dart';
import 'package:group8_mapd722/widget/custom_elevated_button.dart';
import 'package:group8_mapd722/widget/text_field_container.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddTestScreen extends StatefulWidget {
  const AddTestScreen({super.key});

  @override
  State<AddTestScreen> createState() => _AddTestScreenState();
}

class _AddTestScreenState extends State<AddTestScreen> {
  final AddTestProvider _provider = AddTestProvider();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _doctorController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940, 8),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kPrimaryColor, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: kPrimaryColor, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: kPrimaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text =
            Util.getFormattedDate(picked, DateFormat('dd-MM-yyyy')) ??
                ""; // you can format the date as you want
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // _setData();
  }

  @override
  void dispose() {
    super.dispose();
    _fNameController.dispose();
    _lNameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _dateController.dispose();
    _addressController.dispose();
    _departmentController.dispose();
    _doctorController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CommonAppBar(title: 'Add Patient'),
      body: ChangeNotifierProvider.value(
        value: _provider,
        builder: (context, child) {
          return Consumer<AddTestProvider>(
              builder: (context, provider, child) {
                return _getBody;
              });
        },
      ),
    );
  }

  get _getBody {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [

              // First Name TextField
              TextFieldContainer(
                controller: _fNameController,
                labelText: 'Nurse Name',
                onSaved: (value) {
                  //name = value;
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter First Name';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),

              // DOB TextField
              TextFieldContainer(
                controller: _dateController,
                labelText: 'Test Date',
                suffixIconData: Icons.calendar_month_rounded,
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
                onSaved: (value) {
                  //name = value;
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select test date';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: TextFieldContainer(
                    controller: _departmentController,
                    labelText: 'Systolic',
                    onSaved: (value) {
                      //name = value;
                    },
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter systolic value';
                      } else {
                        return null;
                      }
                    },
                  ),),
                  const SizedBox(width: 12,),
                  Expanded(child: TextFieldContainer(
                    controller: _departmentController,
                    labelText: 'Diastolic',
                    onSaved: (value) {
                      //name = value;
                    },
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter diastolic value';
                      } else {
                        return null;
                      }
                    },
                  ),)
                ],
              ),
              const SizedBox(height: 20),

              // First Name TextField
              TextFieldContainer(
                controller: _departmentController,
                labelText: 'Respiratory Rate',
                onSaved: (value) {
                  //name = value;
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Respiratory rate';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),

              // Last Name TextField
              TextFieldContainer(
                controller: _doctorController,
                labelText: 'Blood Oxygen Level',
                onSaved: (value) {
                  //name = value;
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Blood oxygen Level';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),

              TextFieldContainer(
                controller: _departmentController,
                labelText: 'Heartbeat Rate',
                onSaved: (value) {
                  //name = value;
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Heartbeat rate';
                  } else {
                    return null;
                  }
                },
              ),


              const SizedBox(height: 40),

              CustomElevatedButton(
                buttonText: 'Add Test',
                onTap: () => _addTest(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _addTest() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      bool isOnline = await InternetConnectionChecker().hasConnection;
      if (!isOnline) {
        if (!context.mounted) return;
        Util.showMsg(context, kNoInternetMsg);
        return;
      }

      /*Map<String, dynamic> body = {
        "fullName" : _nameController.text,
        "contactNumber" : _contactController.text,
        "dateOfBirth" : _dateController.text
      };
      String jsonBody = json.encode(body);

      DialogUtil.getInstance()?.showLoaderDialog();
      NetworkResponse response = await NetworkRepository.post(
          '${GetIt.instance<AppConfig>().baseUrl}$kProfileApi/${widget.customer?.id}', body: jsonBody);
      DialogUtil.getInstance()?.dismissLoaderDialog();

      if (response.success && response.response != null) {
        if (!context.mounted) return;
        Util.showMsg(context, kProfileUpdateSuccessMsg);

        Navigator.pop(context, true);
      }else {
        if (!context.mounted) return;
        Util.showMsg(context, 'Invalid username or password');
        //Util.showMsg(context, response.errorMsg ?? kSomethingWentWrongMsg);
      }*/
    }
  }
}
