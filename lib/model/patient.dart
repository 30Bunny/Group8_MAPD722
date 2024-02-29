class Patient {
  String? sId;
  String? firstName;
  String? lastName;
  String? address;
  String? email;
  String? mobile;
  String? dateOfBirth;
  String? gender;
  String? department;
  String? doctor;
  String? status;
  String? createdOn;
  String? createdBy;
  String? modifiedOn;
  String? modifiedBy;
  List<Tests>? tests;
  int? iV;

  Patient(
      {this.sId,
        this.firstName,
        this.lastName,
        this.address,
        this.email,
        this.mobile,
        this.dateOfBirth,
        this.gender,
        this.department,
        this.doctor,
        this.status,
        this.createdOn,
        this.createdBy,
        this.modifiedOn,
        this.modifiedBy,
        this.tests,
        this.iV});

  Patient.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    email = json['email'];
    mobile = json['mobile'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    department = json['department'];
    doctor = json['doctor'];
    status = json['status'];
    createdOn = json['created_on'];
    createdBy = json['created_by'];
    modifiedOn = json['modified_on'];
    modifiedBy = json['modified_by'];
    if (json['tests'] != null) {
      tests = <Tests>[];
      json['tests'].forEach((v) {
        tests!.add(Tests.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['address'] = address;
    data['email'] = email;
    data['mobile'] = mobile;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = gender;
    data['department'] = department;
    data['doctor'] = doctor;
    data['status'] = status;
    data['created_on'] = createdOn;
    data['created_by'] = createdBy;
    data['modified_on'] = modifiedOn;
    data['modified_by'] = modifiedBy;
    if (tests != null) {
      data['tests'] = tests!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }

  Map<String, dynamic> toJsonRequest() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['address'] = address;
    data['email'] = email;
    data['mobile'] = mobile;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = gender;
    data['department'] = department;
    data['doctor'] = doctor;
    data['status'] = status;
    data['created_on'] = createdOn;
    data['created_by'] = createdBy;
    data['modified_on'] = modifiedOn;
    data['modified_by'] = modifiedBy;
    if (tests != null) {
      data['tests'] = tests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tests {
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

  Tests(
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

  Tests.fromJson(Map<String, dynamic> json) {
    readings = json['readings'] != null
        ? Readings.fromJson(json['readings'])
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
    final Map<String, dynamic> data = <String, dynamic>{};
    if (readings != null) {
      data['readings'] = readings!.toJson();
    }
    data['testDate'] = testDate;
    data['testName'] = testName;
    data['nurseName'] = nurseName;
    data['type'] = type;
    data['testStatus'] = testStatus;
    data['category'] = category;
    data['created_on'] = createdOn;
    data['created_by'] = createdBy;
    data['modified_on'] = modifiedOn;
    data['modified_by'] = modifiedBy;
    data['_id'] = sId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['diastolicBP'] = diastolicBP;
    data['systolicBP'] = systolicBP;
    data['respiratoryRate'] = respiratoryRate;
    data['bloodOxygenLevel'] = bloodOxygenLevel;
    data['heartRate'] = heartRate;
    return data;
  }
}
