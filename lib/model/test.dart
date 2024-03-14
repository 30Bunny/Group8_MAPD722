class Test {
  Readings? readings;
  String? testDate;
  String? testName;
  String? nurseName;
  String? type;
  String? testStatus;
  String? category;
  String? createdOn;
  String? createdBy;
  String? modifiedOn;
  String? modifiedBy;
  String? sId;

  Test(
      {this.readings,
        this.testDate,
        this.testName,
        this.nurseName,
        this.type,
        this.testStatus,
        this.category,
        this.createdOn,
        this.createdBy,
        this.modifiedOn,
        this.modifiedBy,
        this.sId});

  Test.fromJson(Map<String, dynamic> json) {
    readings = json['readings'] != null
        ? new Readings.fromJson(json['readings'])
        : null;
    testDate = json['testDate'];
    testName = json['testName'];
    nurseName = json['nurseName'];
    type = json['type'];
    testStatus = json['testStatus'];
    category = json['category'];
    createdOn = json['created_on'];
    createdBy = json['created_by'];
    modifiedOn = json['modified_on'];
    modifiedBy = json['modified_by'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.readings != null) {
      data['readings'] = this.readings!.toJson();
    }
    data['testDate'] = this.testDate;
    data['testName'] = this.testName;
    data['nurseName'] = this.nurseName;
    data['type'] = this.type;
    data['testStatus'] = this.testStatus;
    data['category'] = this.category;
    data['created_on'] = this.createdOn;
    data['created_by'] = this.createdBy;
    data['modified_on'] = this.modifiedOn;
    data['modified_by'] = this.modifiedBy;
    data['_id'] = this.sId;
    return data;
  }
}

class Readings {
  int? diastolicBP;
  int? systolicBP;
  int? respiratoryRate;
  int? bloodOxygenLevel;
  int? heartRate;

  Readings(
      {this.diastolicBP,
        this.systolicBP,
        this.respiratoryRate,
        this.bloodOxygenLevel,
        this.heartRate});

  Readings.fromJson(Map<String, dynamic> json) {
    diastolicBP = json['diastolicBP'];
    systolicBP = json['systolicBP'];
    respiratoryRate = json['respiratoryRate'];
    bloodOxygenLevel = json['bloodOxygenLevel'];
    heartRate = json['heartRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diastolicBP'] = this.diastolicBP;
    data['systolicBP'] = this.systolicBP;
    data['respiratoryRate'] = this.respiratoryRate;
    data['bloodOxygenLevel'] = this.bloodOxygenLevel;
    data['heartRate'] = this.heartRate;
    return data;
  }
}