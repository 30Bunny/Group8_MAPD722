import 'dart:ui';

const kAppName = "WeCare";
const kNoInternetMsg = 'No internet connection!!';
const kPatientAddedSuccessMsg = 'Patient added successfully!!';
const kPatientUpdatedSuccessMsg = 'Patient detail updated successfully!!';
const kPatientTestAddedSuccessMsg = 'Test added successfully!!';
const kPatientTestUpdatedSuccessMsg = 'Test updated successfully!!';
const kSomethingWentWrongMsg = 'Something went wrong, please try again later.';
const kGenderList = ['Male', 'Female'];
const kCategoryList = ['All','Normal', 'Critical'];

// Color Constant
const kPrimaryColor = Color(0XFF457D58);
const kPrimaryDarkColor = Color(0xFF0E6D47);
const kSecondaryColor = Color(0XFF97B690);
const kLogoBackColor = Color(0XFFF6F6E9);
const kGreyColor = Color(0xFFA6A6A6);
const kOffWhiteColor = Color(0xFFFAF9F6);
const kAlphaGreenBackColor = Color(0xFFD9E7E2);
const kAlphaRedBackColor = Color(0xFFf5dfe2);
const kRedColor = Color(0xFFFF0404);

// Image Constant
const kAppLogo = 'assets/images/medicare_logo.png';
const kUserIcon = 'assets/images/user.png';
const kPositiveIcon = 'assets/images/positive.png';
const kCriticalIcon = 'assets/images/critical.png';

// API Constant
const kGetPatient = '/patients';
const kGetPatientTests = '/tests';