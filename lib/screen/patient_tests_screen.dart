import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:group8_mapd722/app_config.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/model/test.dart';
import 'package:group8_mapd722/network/network_repository.dart';
import 'package:group8_mapd722/network/network_response.dart';
import 'package:group8_mapd722/provider/test_provider.dart';
import 'package:group8_mapd722/screen/add_test_screen.dart';
import 'package:group8_mapd722/util/dialog_util.dart';
import 'package:group8_mapd722/util/util.dart';
import 'package:group8_mapd722/widget/common_appbar.dart';
import 'package:group8_mapd722/widget/test_card.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class PatientTestScreen extends StatefulWidget {
  final String? patientID;

  const PatientTestScreen({super.key, this.patientID});

  @override
  State<PatientTestScreen> createState() => _PatientTestScreenState();
}

class _PatientTestScreenState extends State<PatientTestScreen> {
  final TestProvider _provider = TestProvider();

  // Fetch Patient test data from API and update the state variables
  void _fetchPatientTests() async {
    bool isOnline = await InternetConnectionChecker().hasConnection;
    if (!isOnline) {
      if (!context.mounted) return;
      Util.showMsg(context, kNoInternetMsg);
      return;
    }

    DialogUtil.getInstance()?.showLoaderDialog();
    NetworkResponse response = await NetworkRepository.get(
        '${GetIt.instance<AppConfig>().baseUrl}$kGetPatient/${widget.patientID}$kGetPatientTests');
    DialogUtil.getInstance()?.dismissLoaderDialog();
    if (response.success && response.response != null) {
      try {
        var parsedJson = json.decode(response.response!);
        _provider.setPatientTestList(
            List<Test>.from(parsedJson.map((model) => Test.fromJson(model)))
                .reversed
                .toList());
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPatientTests();
  }

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
        onPressed: () => _navigateToAddOrEditTest(),
        label: Text(
          'Add Test',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white),
        ),
        icon: const Icon(Icons.add, color: Colors.white, size: 20),
      ),
      body: ChangeNotifierProvider.value(
        value: _provider,
        builder: (context, child) {
          return Consumer<TestProvider>(builder: (context, provider, child) {
            return _getBody;
          });
        },
      ),
    );
  }

  get _getBody {
    if (_provider.tests.isEmpty) {
      return const Center(child: Text('No data found'));
    }
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: _provider.tests.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (ctx, index) {
        return TestCard(
          test: _provider.tests[index],
          onDelete: () => _showDeleteAlert(index),
          onUpdate: () => _navigateToAddOrEditTest(
              isEdit: true, test: _provider.tests[index]),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
    );
  }

  _navigateToAddOrEditTest({bool isEdit = false, Test? test}) async {
    final isUpdated = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddTestScreen(
                  patientID: widget.patientID,
                  isEdit: isEdit,
                  test: test,
                )));
    if (isUpdated != null && isUpdated) {
      _fetchPatientTests();
    }
  }

  _showDeleteAllAlert() {
    DialogUtil.getInstance()?.showAlertDialog(
        context, 'Are you sure you want to delete all records?',
        title: 'Delete All', onButtonTap: () => _onDeleteAll());
  }

  _onDeleteAll() async {
    Navigator.pop(context);

    bool isOnline = await InternetConnectionChecker().hasConnection;
    if (!isOnline) {
      if (!context.mounted) return;
      Util.showMsg(context, kNoInternetMsg);
      return;
    }

    DialogUtil.getInstance()?.showLoaderDialog();
    NetworkResponse response = await NetworkRepository.delete(
        '${GetIt.instance<AppConfig>().baseUrl}$kGetPatient/${widget.patientID}$kGetPatientTests');
    DialogUtil.getInstance()?.dismissLoaderDialog();
    if (response.success && response.response != null) {
      try {
        _provider.clearPatientTest();
      } catch (e) {
        print(e.toString());
      }
    }
  }

  _showDeleteAlert(int index) {
    DialogUtil.getInstance()?.showAlertDialog(
        context, 'Are you sure you want to delete records?',
        title: 'Delete', onButtonTap: () => _onDelete(index));
  }

  _onDelete(int index) async {
    Navigator.pop(context);

    bool isOnline = await InternetConnectionChecker().hasConnection;
    if (!isOnline) {
      if (!context.mounted) return;
      Util.showMsg(context, kNoInternetMsg);
      return;
    }

    DialogUtil.getInstance()?.showLoaderDialog();
    NetworkResponse response = await NetworkRepository.delete(
        '${GetIt.instance<AppConfig>().baseUrl}$kGetPatient/${widget.patientID}$kGetPatientTests/${_provider.tests[index].sId}');
    DialogUtil.getInstance()?.dismissLoaderDialog();
    if (response.success && response.response != null) {
      try {
        _provider.removePatientTestAtIndex(index);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
