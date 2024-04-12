import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:group8_mapd722/app_config.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/model/test.dart';
import 'package:group8_mapd722/network/network_repository.dart';
import 'package:group8_mapd722/network/network_response.dart';
import 'package:group8_mapd722/provider/add_test_provider.dart';
import 'package:group8_mapd722/util/dialog_util.dart';
import 'package:group8_mapd722/util/util.dart';
import 'package:group8_mapd722/widget/common_appbar.dart';
import 'package:group8_mapd722/widget/custom_elevated_button.dart';
import 'package:group8_mapd722/widget/text_field_container.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddTestScreen extends StatefulWidget {
  final bool isEdit;
  final String? patientID;
  final Test? test;

  const AddTestScreen(
      {super.key, this.isEdit = false, this.patientID, this.test});

  @override
  State<AddTestScreen> createState() => _AddTestScreenState();
}

class _AddTestScreenState extends State<AddTestScreen> {
  final AddTestProvider _provider = AddTestProvider();
  final _formKey = GlobalKey<FormState>();

  final _nurseNameController = TextEditingController();
  final _testDateController = TextEditingController();
  final _systolicController = TextEditingController();
  final _diastolicController = TextEditingController();
  final _rasRateController = TextEditingController();
  final _bloodOxyLevelController = TextEditingController();
  final _heartRateController = TextEditingController();
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
        _testDateController.text =
            Util.getFormattedDate(picked, DateFormat('dd-MM-yyyy')) ??
                ""; // you can format the date as you want
      });
    }
  }

  _setData() {
    if (widget.isEdit) {
      _nurseNameController.text = widget.test?.nurseName ?? '';
      _testDateController.text = widget.test?.testDate ?? '';
      _systolicController.text =
          widget.test?.readings?.systolicBP?.toString() ?? '';
      _diastolicController.text =
          widget.test?.readings?.diastolicBP?.toString() ?? '';
      _rasRateController.text =
          widget.test?.readings?.respiratoryRate?.toString() ?? '';
      _bloodOxyLevelController.text =
          widget.test?.readings?.bloodOxygenLevel?.toString() ?? '';
      _heartRateController.text =
          widget.test?.readings?.heartRate?.toString() ?? '';
    }

    _provider.test.readings = Readings();
  }

  @override
  void initState() {
    super.initState();
    _setData();
  }

  @override
  void dispose() {
    super.dispose();
    _nurseNameController.dispose();
    _testDateController.dispose();
    _systolicController.dispose();
    _diastolicController.dispose();
    _rasRateController.dispose();
    _bloodOxyLevelController.dispose();
    _heartRateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonAppBar(title: widget.isEdit ? 'Update Test' : 'Add Test'),
      body: ChangeNotifierProvider.value(
        value: _provider,
        builder: (context, child) {
          return Consumer<AddTestProvider>(builder: (context, provider, child) {
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
                controller: _nurseNameController,
                labelText: 'Nurse Name',
                onSaved: (value) {
                  _provider.test.nurseName = value;
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
                controller: _testDateController,
                labelText: 'Test Date',
                suffixIconData: Icons.calendar_month_rounded,
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
                onSaved: (value) {
                  _provider.test.testDate = value;
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
                  Expanded(
                    child: TextFieldContainer(
                      controller: _systolicController,
                      labelText: 'Systolic',
                      hint: 'X/Y mmHg',
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        _provider.test.readings?.systolicBP =
                            int.parse(value ?? '0');
                      },
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter systolic value';
                        } else if ((int.tryParse(value) ?? 0) <= 0) {
                          return 'Please enter valid systolic value';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextFieldContainer(
                      controller: _diastolicController,
                      labelText: 'Diastolic',
                      hint: 'X/Y mmHg',
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        _provider.test.readings?.diastolicBP =
                            int.parse(value ?? '0');
                      },
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter diastolic value';
                        } else if ((int.tryParse(value) ?? 0) <= 0) {
                          return 'Please enter valid diastolic value';
                        } else {
                          return null;
                        }
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // First Name TextField
              TextFieldContainer(
                controller: _rasRateController,
                labelText: 'Respiratory Rate',
                hint: 'X/min',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _provider.test.readings?.respiratoryRate =
                      int.parse(value ?? '0');
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Respiratory rate';
                  } else if ((int.tryParse(value) ?? 0) <= 0) {
                    return 'Please enter valid Respiratory rate';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),

              // Last Name TextField
              TextFieldContainer(
                controller: _bloodOxyLevelController,
                labelText: 'Blood Oxygen Level',
                hint: 'X%',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _provider.test.readings?.bloodOxygenLevel =
                      int.parse(value ?? '0');
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Blood oxygen Level';
                  } else if ((int.tryParse(value) ?? 0) <= 0) {
                    return 'Please enter valid Blood oxygen Level';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),

              TextFieldContainer(
                controller: _heartRateController,
                labelText: 'Heartbeat Rate',
                hint: 'X/min',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _provider.test.readings?.heartRate = int.parse(value ?? '0');
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Heartbeat rate';
                  } else if ((int.tryParse(value) ?? 0) <= 0) {
                    return 'Please enter valid Heartbeat rate';
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(height: 40),

              CustomElevatedButton(
                buttonText: widget.isEdit ? 'Update Test' : 'Add Test',
                onTap: () => widget.isEdit ? _updateTest() : _addTest(),
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

      _provider.test.createdBy = 'Bansi';
      String jsonBody = json.encode(_provider.test.toJson());

      DialogUtil.getInstance()?.showLoaderDialog();
      NetworkResponse response = await NetworkRepository.post(
          '${GetIt.instance<AppConfig>().baseUrl}$kGetPatient/${widget.patientID}$kGetPatientTests',
          body: jsonBody);
      DialogUtil.getInstance()?.dismissLoaderDialog();

      if (response.success && response.response != null) {
        if (!context.mounted) return;
        Util.showMsg(context, kPatientTestAddedSuccessMsg);

        Navigator.pop(context, true);
      } else {
        if (!context.mounted) return;
        Util.showMsg(context, response.errorMsg ?? kSomethingWentWrongMsg);
      }
    }
  }

  _updateTest() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      bool isOnline = await InternetConnectionChecker().hasConnection;
      if (!isOnline) {
        if (!context.mounted) return;
        Util.showMsg(context, kNoInternetMsg);
        return;
      }

      _provider.test.sId = widget.test?.sId;
      _provider.test.modifiedBy = 'Bansi';
      _provider.test.createdBy = 'Bansi';
      _provider.test.createdOn = widget.test?.createdOn;

      String jsonBody = json.encode(_provider.test.toJson());

      DialogUtil.getInstance()?.showLoaderDialog();
      NetworkResponse response = await NetworkRepository.put(
          '${GetIt.instance<AppConfig>().baseUrl}$kGetPatient/${widget.patientID}$kGetPatientTests/${widget.test?.sId}',
          body: jsonBody);
      DialogUtil.getInstance()?.dismissLoaderDialog();
      print(response.errorMsg);
      if (response.success && response.response != null) {
        if (!context.mounted) return;
        Util.showMsg(context, kPatientTestUpdatedSuccessMsg);

        Navigator.pop(context, true);
      } else {
        if (!context.mounted) return;
        Util.showMsg(context, response.errorMsg ?? kSomethingWentWrongMsg);
      }
    }
  }
}
