import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/provider/add_patient_provider.dart';
import 'package:group8_mapd722/util/util.dart';
import 'package:group8_mapd722/widget/common_appbar.dart';
import 'package:group8_mapd722/widget/custom_elevated_button.dart';
import 'package:group8_mapd722/widget/text_field_container.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddNewPatient extends StatefulWidget {
  const AddNewPatient({super.key});

  @override
  State<AddNewPatient> createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient> {

  final AddPatientProvider _provider = AddPatientProvider();
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
        _dateController.text = Util.getFormattedDate(picked, DateFormat('dd-MM-yyyy')) ?? ""; // you can format the date as you want
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
          return Consumer<AddPatientProvider>(builder: (context, provider, child) {
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

              Text('Personal Information', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),),
              const SizedBox(height: 12,),

              // First Name TextField
              TextFieldContainer(
                controller: _fNameController,
                labelText: 'First Name',
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

              // Last Name TextField
              TextFieldContainer(
                controller: _lNameController,
                labelText: 'Last Name',
                onSaved: (value) {
                  //name = value;
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Last Name';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),

              // Email TextField
              TextFieldContainer(
                  controller: _emailController,
                  labelText: 'Email',
                  onSaved: (value) {
                    //name = value;
                  },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  } else if (!Util.isValidEmail(value)) {
                    return 'Please enter valid Email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),

              // Mobile TextField
              TextFieldContainer(
                controller: _contactController,
                labelText: 'Mobile',
                onSaved: (value) {
                  //name = value;
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Mobile Number';
                  } else if (!Util.isValidMobile(value)) {
                    return 'Please enter valid Number';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text('Gender', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),),
              ),
              Wrap(
                spacing: 5.0,
                children: List<Widget>.generate(
                  kGenderList.length,
                      (int index) {
                    return ChoiceChip(
                      label: Text(kGenderList[index]),
                      selected: _provider.genderValue == index,
                      selectedColor: kPrimaryColor,
                      backgroundColor: kSecondaryColor.withOpacity(0.5),
                      side: const BorderSide(color: Colors.transparent),
                      checkmarkColor: Colors.white,
                      onSelected: (bool selected) => _provider.changeGender(selected, index),
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 20),

              // DOB TextField
              TextFieldContainer(
                controller: _dateController,
                labelText: 'Date of birth',
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
                    return 'Please select date of birth';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),

              // Address TextField
              TextFieldContainer(
                controller: _addressController,
                labelText: 'Address',
                maxLines: 3,
                onSaved: (value) {
                  //name = value;
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter address';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),

              Text('Other Information', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),),
              const SizedBox(height: 12,),

              // First Name TextField
              TextFieldContainer(
                controller: _departmentController,
                labelText: 'Department',
                onSaved: (value) {
                  //name = value;
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Department';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),

              // Last Name TextField
              TextFieldContainer(
                controller: _doctorController,
                labelText: 'Doctor',
                onSaved: (value) {
                  //name = value;
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Doctor Name';
                  } else {
                    return null;
                  }
                },
              ),


              const SizedBox(height: 40),

              CustomElevatedButton(buttonText: 'Add Patient',onTap: () => _addPatient(),),
            ],
          ),
        ),
      ),
    );
  }

  _addPatient() async{
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
