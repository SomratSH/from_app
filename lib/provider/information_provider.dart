import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InformationProvider extends ChangeNotifier {
  InformationProvider() {
    firstListCheck = List.generate(firstList.length, (_) => false);
    secondListCheck = List.generate(secondList.length, (_) => false);
    thirdListCheck = List.generate(thirdList.length, (_) => false);
    fourthListCheck = List.generate(fourthList.length, (_) => false);
    fifthistCheck = List.generate(fifthList.length, (_) => false);
    sixthListCheck = List.generate(sixthList.length, (_) => false);

    notifyListeners();
  }

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController spouseNameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  final TextEditingController birthCertificateController =
      TextEditingController();
  final TextEditingController passportController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // Address controllers
  final TextEditingController permanentVillageController =
      TextEditingController();
  final TextEditingController permanentPostOfficeController =
      TextEditingController();
  final TextEditingController permanentDistrictController =
      TextEditingController();
  final TextEditingController permanentDivisionController =
      TextEditingController();

  final TextEditingController presentVillageController =
      TextEditingController();
  final TextEditingController presentPostOfficeController =
      TextEditingController();
  final TextEditingController presentDistrictController =
      TextEditingController();
  final TextEditingController presentDivisionController =
      TextEditingController();

  // Dropdown values
  String? gender;
  String? religion;
  String? maritalStatus;
  String? bloodGroup;
  String? selectedDistrict;

  TextEditingController currentAddressController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController permanentAddressController = TextEditingController();

  TextEditingController degesicnationController = TextEditingController();

  bool workplaceSelections = false;
  bool workshopSelections = false;
  bool accidentTypeSelections = false;
  bool bodyPartSelections = false;
  bool accidentHelperSelections = false;
  bool afterAccidentSelections = false;

  updateGender(String v) {
    gender = v;
    notifyListeners();
  }

  // Update religion
  void updateReligion(String value) {
    religion = value;
    notifyListeners();
  }

  // Update marital status
  void updateMaritalStatus(String value) {
    maritalStatus = value;
    notifyListeners();
  }

  // Update blood group
  void updateBloodGroup(String value) {
    bloodGroup = value;
    notifyListeners();
  }

  // Update selected district
  void updateDistrict(String value) {
    selectedDistrict = value;
    notifyListeners();
  }

  // Optionally, reset all values
  void resetSelections() {
    gender = null;
    religion = null;
    maritalStatus = null;
    bloodGroup = null;
    selectedDistrict = null;
    notifyListeners();
  }

  Future<bool> submitData(
    Map<String, dynamic> data,
    List<File> attachments,
    String token,
  ) async {
    try {
      isLoading = true;
      notifyListeners();

      var uri = Uri.parse(
        "https://admin.bdsofttechnology.com/api/data-collection",
      );

      var request = http.MultipartRequest("POST", uri);

      // Add Authorization header
      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';

      // Add all TEXT fields (form-data)
      data.forEach((key, value) {
        request.fields[key] = value?.toString() ?? "";
      });

      // Add FILES (attachments[])
      for (var file in attachments) {
        request.files.add(
          await http.MultipartFile.fromPath(
            "attachments", // <-- parameter name
            file.path,
            contentType: http.MediaType("application", "octet-stream"),
          ),
        );
      }

      var response = await request.send();

      isLoading = false;
      notifyListeners();

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print("UPLOAD ERROR: $e");
      return false;
    }
  }

  //other value
  String? workplaceName;
  String? workShopeName;
  String? accidentDate;
  String? accidentSystem;
  String? ifDeath;
  String? afterAccidentFeactire;

  TextEditingController othersProductController = TextEditingController();

  TextEditingController officeNameController = TextEditingController();

  TextEditingController officeRegistrationController = TextEditingController();

  TextEditingController officeMdNameController = TextEditingController();

  TextEditingController produceProductNameController = TextEditingController();

  TextEditingController accidentPlaceController = TextEditingController();

  TextEditingController accidentPersonSalaryController =
      TextEditingController();

  TextEditingController officeTelephoneController = TextEditingController();

  TextEditingController afterAccidentFeactureController =
      TextEditingController();

  void updateWorkPlaceName(int index, String v) {
    workplaceName = v;
    for (int i = 0; i < firstListCheck.length; i++) {
      firstListCheck[i] = false;
    }
    firstListCheck[index] = true;
    notifyListeners();
  }

  void updateWorkshopName(int index, String? v) {
    workShopeName = v;
    for (int i = 0; i < secondListCheck.length; i++) {
      secondListCheck[i] = false;
    }
    secondListCheck[index] = true;
    notifyListeners();
  }

  void updateAccidentData(String formattedDate) {
    accidentDate = formattedDate;
    notifyListeners();
  }

  String? deathDate;
  void updateAccidentIfDeathDate(String formattedDate) {
    deathDate = formattedDate;
    notifyListeners();
  }

  void updateAccidentSystem(int index, String? v) {
    for (int i = 0; i < thirdListCheck.length; i++) {
      thirdListCheck[i] = false;
    }
    accidentSystem = v;
    thirdListCheck[index] = true;
    notifyListeners();
  }

  void updateIfDeath(String formattedDate) {
    ifDeath = formattedDate;
    notifyListeners();
  }

  void updateAfterAccidentFeacture(int index, String? v) {
    for (int i = 0; i < fifthistCheck.length; i++) {
      fifthistCheck[i] = false;
    }
    afterAccidentFeactire = v;
    fifthistCheck[index] = false;
    notifyListeners();
  }

  String? accidentHelper;

  TextEditingController otherFireProductController = TextEditingController();

  TextEditingController informationGiveHelperController =
      TextEditingController();

  TextEditingController informationHelperPhoneController =
      TextEditingController();
  void updateAccidentHelper(int index, String? v) {
    for (int i = 0; i < sixthListCheck.length; i++) {
      sixthListCheck[i] = false;
    }
    accidentHelper = v;
    sixthListCheck[index] = true;
    notifyListeners();
  }

  List<File> uploadedFiles = [];

  void addFiles(List<File> files) {
    uploadedFiles.addAll(files);
    notifyListeners();
  }

  void removeFile(int index) {
    uploadedFiles.removeAt(index);
    notifyListeners();
  }

  void clearFiles() {
    uploadedFiles.clear();
    notifyListeners();
  }

  String? bodyPartFeacture;

  TextEditingController otherBoydpartFecatureController =
      TextEditingController();

  void updateBodyPartFeacture(int index, String? v) {
    bodyPartFeacture = v;
    fourthListCheck[index] = true;
    notifyListeners();
  }

  List<String> firstList = [
    'তৈরি পোশাক কারখানা',
    'চা শিল্প',
    'জুতার কারখানা',
    'নির্মান ও অবকাঠামো ভাঙ্গা।',
    'করলা খনি',
    "সরকারি পরিষেবা কর্মী",
    "চিনি কল",
    "চালের কল",
    "ভ্যালু চেইন",
    "জাহাজ ভাঙ্গা বা জাহাজ নির্মাণ",
    "পরিবহন",
    "স্টিল মিল ও রি-রোলিং",
    "গ্যাস ক্ষেত্র",
    "ফার্মাসিউটিক্যালস",
    "কাগজের কারখানা",
    "অটোমোবাইল",
    "ট্যানারি কারখানা বা চামড়া শিল্প"
        "মৎস্য",
    "খাদ্য ও পানিয়",
    "পাটকল",
    "সেবা খাত (স্বাস্থ্য পরিচর্যা, নার্স, ক্লিনার, সিকিউরিটি গার্ড, হোটেল বয়, ওয়াসা কর্মী, ডেসা কর্মী)",
    "রাসায়নিক শিল্প",
    "ইট তৈরির কারখানা",
    "ঝালাই কারখানা",
  ];
  List<String> secondList = [
    'পাথর কারখানা।',
    'জেলে',
    'কসাই',
    'ফসল উৎপাদন কর্মী।',
    'হস্ত শিল্প অথবা অনানুষ্ঠানিক পরিবহন কর্মী (রিকশা/মোকা/ভান) হলে এখানে লিখুন',
    'তাঁত',
    'পুহস্তী',
    'দিনমজুর।',
    'আসবাবপত্র তৈরী কর্মী',
    'স্বর্ণকার।',
    'ফেরিওয়ালা',
    'নির্মাণ পুহস্তী সম্পর্কিত ব্যাক্তিত্ব।',
  ];
  List<String> thirdList = [
    'মৃত্যু',
    'স্থায়ী পূর্ণ দৈহিক অক্ষমতা',
    'স্থায়ী আংশিক দৈহিক অক্ষমতা',
    "জখমের ফলে ১৬ ঘন্টার অতিরিক্ত এবং ২০ দিন পর্যন্ত কাজে অনুপস্থিতির কারণ ঘটলে",
  ];
  List<String> fourthList = [
    'ডান বাহু কনুই-এ অথবা কনুই এর উপরে।',
    'পা-হাঁটুতে বা হাঁটুর উপরে।',
    'শ্রবণশক্তি স্থায়ী পূর্ণ',
    "এক পায়ের সব কয়টি আঙ্গুল",
    "পায়ের বুড়ো আঙ্গুল",
    "বাম বাহু কনুই-এ অথবা কনুই এর উপরে",
    "পা হাঁটুর নীচে",
    "এক চোখ",
    "বৃদ্ধাঙ্গুলির একটি হাঁড়",
    "ডান বাহু কনুই এর নিচে",
    "বাম বাহু কনুই এর নীচে",
    "বৃদ্ধাঙ্গুলি",
    "তর্জনী",
  ];
  List<String> fifthList = [
    'কোন ব্যাক্তি পতিত হওয়া',
    'কোন বস্তু পতিত হওয়া',
    'পতিত বস্তু ব্যতীত কোন বস্তু দ্বারা বস্তু কর্তৃক আঘাত।',
    "বিদ্যুৎ",
    "বিষ, ক্ষয়কারী বস্তু বা ক্ষতিকর বস্তু, বিকিরণসহ",
    "বিস্ফোরণ",
    "আগুন",
    "সবেগে পানি প্রবেশ",
    "গ্যাসে শ্বাসরোধ",
    "অতিরিক্ত বল প্রয়োগ",
    "অতিরিক্ত চলাফেরা",
    "সড়ক দুর্ঘটনা (সমুদ্র/নদী সহ)",
    "ভূমিধস",
    "উচ্চতা থেকে পড়ে",
    "বয়লার বা পানির পাইপ বা সিলিন্ডার বিস্ফোরণ",
    "প্রাকৃতিক দূর্যোগ",
    "জলদস্যু/দুর্বৃত্তদের দ্বারা আক্রান্ত (শুধু মৎস্য চাসের জন্য)",
    "বজ্রপাত",
  ];
  List<String> sixthList = [
    'প্রধান চালক যন্ত্র',
    'সঞ্চালক যন্ত্রপাতি',
    'উত্তোলক যন্ত্রপাতি',
    "কার্যরত যন্ত্রপাতি",
    "অন্য যন্ত্রপাতি বা সংস্থাপনসমূহ",
    "রেল বা ট্রলি পরিবহন",
    "পণ্য পরিবহন বা মাল পরিবহন",
    "হাতে ব্যবহারিত যন্ত্রপাতি",
  ];

  List<bool> firstListCheck = [];
  List<bool> secondListCheck = [];
  List<bool> thirdListCheck = [];
  List<bool> fourthListCheck = [];
  List<bool> fifthistCheck = [];
  List<bool> sixthListCheck = [];

Future<bool> submitDataWithBase64({
  required Map<String, dynamic> formData,
  required List<File> attachments,
  required String token, // 🔥 add token here
}) async {
  try {
    // Convert files to base64 strings
    List<String> base64Images = [];

    for (var file in attachments) {
      List<int> fileBytes = await file.readAsBytes();
      String base64File = base64Encode(fileBytes);
      base64Images.add(base64File);
    }

    // Add images to body data
    formData["attachments"] = base64Images;

    print("Final Body: $formData");

    // Send JSON POST request with Token
    var response = await http.post(
      Uri.parse('https://admin.bdsofttechnology.com/api/data-collection'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",  // 🔥 TOKEN ADDED
      },
      body: jsonEncode(formData),
    );

    print("Response: ${response.body}");

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse["success"] == true;
    } else {
      print("Failed: ${response.statusCode}");
      return false;
    }
  } catch (e) {
    print("Exception: $e");
    return false;
  }
}



  Future<bool> submitExample() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // 1️⃣ JSON form data
    Map<String, dynamic> formData = {
      "collector_name": informationGiveHelperController.text,
      "victim_name": nameController.text,
      "date_of_birth": birthDateController.text,
      "nid_no": nidController.text,
      "father_name": fatherNameController.text,
      "mother_name": motherNameController.text,
      "spouse_name": spouseNameController.text,
      "present_address": currentAddressController.text,
      "parmananet_address": permanentAddressController.text,
      "relative_contact": phoneController.text,
      "age": ageController.text,
      "gender": gender,
      "marital_status": maritalStatus,
      "workplace_name": workplaceName,
      "workshop_name": workShopeName,
      "reg_no": officeRegistrationController.text,
      "contact_no": officeTelephoneController.text,
      "managing_contact_no": officeMdNameController.text,
      "industry_type": produceProductNameController.text,
      "date_of_incident": accidentDate,
      "location": accidentPlaceController.text,
      "salary": accidentPersonSalaryController.text,
      "accident_type": accidentSystem,
      "death_date": deathDate,
      "accident_part": bodyPartFeacture,
      "accident_part_injury": afterAccidentFeactire,
      "informer_name": informationGiveHelperController.text,
      "informer_phone": informationHelperPhoneController.text,
      "accident_part_injury_val": "Severe",
      "accident_part_assistant_val": "First Aid Provided",
      "accident_part_val": "Upper Limb",
      "accident_part_assistant": "Factory Nurse",
      "type": "Industrial Accident",
      "identification_no": "ID-2024-0456",
      "degination": "Machine Operator",
      "case_no": "CASE-2024-789",
      "online_journal_page": "https://example.com/journal/page123",
      "online_journal": "Online Safety Journal",
      "journal_page": "Page 45",
      "journal": "Industrial Safety Log Book",
      "network": "Safety Network Bangladesh",
      "investigation_team": "Team A - Investigation Unit",
      "journal_network": "National Safety Database",
      "information_source": "Factory Supervisor Report",
      "report_date": "2024-11-21",
      "medical_officer": "Dr. Ahmed Hassan",
      "unattended_work": "Machine maintenance pending",
      "identify_no": "EMP-2024-1234",
      "onlilne_journal": "Digital Safety Records",
      "accident_type_val": "Type-A Critical",
    };

    // // 2️⃣ Pick files
    // List<File> files = [];
    // FilePickerResult? result = await FilePicker.platform.pickFiles(
    //   allowMultiple: true,
    // );
    // if (result != null) {
    //   files = result.paths.map((path) => File(path!)).toList();
    // }

    // 3️⃣ Submit form + files
    final value = await submitDataWithBase64(
      formData: formData,
      attachments: uploadedFiles,
      token:  preferences.getString("token")!
    );

    return value;
  }
}
