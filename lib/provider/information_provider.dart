import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class InformationProvider extends ChangeNotifier {
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

  void updateWorkPlaceName(String? v) {
    workplaceName = v;
    notifyListeners();
  }

  void updateWorkshopName(String? v) {
    workShopeName = v;
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

  void updateAccidentSystem(String? v) {
    accidentSystem = v;
    notifyListeners();
  }

  void updateIfDeath(String formattedDate) {
    ifDeath = formattedDate;
    notifyListeners();
  }

  void updateAfterAccidentFeacture(String? v) {
    afterAccidentFeactire = v;
    notifyListeners();
  }

  String? accidentHelper;

  TextEditingController otherFireProductController = TextEditingController();

  TextEditingController informationGiveHelperController =
      TextEditingController();

  TextEditingController informationHelperPhoneController =
      TextEditingController();
  void updateAccidentHelper(String? v) {
    accidentHelper = v;
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

  void updateBodyPartFeacture(String? v) {
    bodyPartFeacture = v;
    notifyListeners();
  }
}
