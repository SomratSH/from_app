import 'package:flutter/material.dart';
import 'package:from_app/presentation/home/from_page_step_two.dart';

class InformationFormScreen extends StatefulWidget {
  const InformationFormScreen({Key? key}) : super(key: key);

  @override
  State<InformationFormScreen> createState() => _InformationFormScreenState();
}

class _InformationFormScreenState extends State<InformationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _spouseNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _nidController = TextEditingController();
  final TextEditingController _birthCertificateController =
      TextEditingController();
  final TextEditingController _passportController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Address controllers
  final TextEditingController _permanentVillageController =
      TextEditingController();
  final TextEditingController _permanentPostOfficeController =
      TextEditingController();
  final TextEditingController _permanentDistrictController =
      TextEditingController();
  final TextEditingController _permanentDivisionController =
      TextEditingController();

  final TextEditingController _presentVillageController =
      TextEditingController();
  final TextEditingController _presentPostOfficeController =
      TextEditingController();
  final TextEditingController _presentDistrictController =
      TextEditingController();
  final TextEditingController _presentDivisionController =
      TextEditingController();

  // Education controllers
  final TextEditingController _sscRollController = TextEditingController();
  final TextEditingController _sscRegController = TextEditingController();
  final TextEditingController _sscYearController = TextEditingController();
  final TextEditingController _sscBoardController = TextEditingController();
  final TextEditingController _sscGpaController = TextEditingController();

  final TextEditingController _hscRollController = TextEditingController();
  final TextEditingController _hscRegController = TextEditingController();
  final TextEditingController _hscYearController = TextEditingController();
  final TextEditingController _hscBoardController = TextEditingController();
  final TextEditingController _hscGpaController = TextEditingController();

  // Dropdown values
  String? _gender;
  String? _religion;
  String? _maritalStatus;
  String? _bloodGroup;
  String? _selectedDistrict;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        title: const Text(
          'তথ্য সংগ্রহকারী ফর্ম',
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(Icons.menu, color: Colors.white),
      ),
      body: Column(
        children: [
          // Progress Indicator
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildStepIndicator(1, true, false),
                Expanded(child: _buildStepLine(true, false)),
                _buildStepIndicator(2, false, false),
                Expanded(child: _buildStepLine(false, false)),
                _buildStepIndicator(3, false, false),
                Expanded(child: _buildStepLine(false, false)),
                _buildStepIndicator(4, false, false),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('মৌলিক তথ্য'),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'দুর্ভিক্ষা কবলিত ব্যাক্তির নাম:',
                            _nameController,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'দুর্ভিক্ষা কবলিত ব্যাক্তির জন্ম তারিখ:',
                            _birthDateController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'দুর্ভিক্ষা কবলিত ব্যাক্তির জাতিয় পরিচয় পত্র নম্বর:',
                            _nidController,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'দুর্ভিক্ষা কবলিত ব্যাক্তির পিতার নাম:',
                            _fatherNameController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'দুর্ভিক্ষা কবলিত ব্যাক্তির মাতার নাম:',
                            _motherNameController,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'দুর্ভিক্ষা কবলিত ব্যাক্তির স্বামী বা স্ত্রীর নাম:',
                            _spouseNameController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'দুর্ভিক্ষা কবলিত ব্যাক্তির বর্তমান ঠিকানা:',
                            TextEditingController(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'দুর্ভিক্ষা কবলিত ব্যাক্তির স্থায়ী ঠিকানা:',
                            TextEditingController(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'দুর্ভিক্ষা কবলিত ব্যাক্তির মোবাইল নম্বর বা তার স্বজনের যোগাযোগের নম্বর:',
                            _phoneController,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'দুর্ভিক্ষা কবলিত ব্যাক্তির বয়স:',
                            TextEditingController(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'দুর্ভিক্ষা কবলিত ব্যাক্তির পদবী:',
                            TextEditingController(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildDropdown(
                            'লিঙ্গ:',
                            _gender,
                            ['নির্বাচন করুন', 'পুরুষ', 'মহিলা', 'অন্যান্য'],
                            (value) {
                              setState(() => _gender = value);
                            },
                          ),
                        ),
                      ],
                    ),
                    _buildDropdown(
                      'বৈবাহিক অবস্থা',
                      _maritalStatus,
                      [
                        'নির্বাচন করুন',
                        'অবিবাহিত',
                        'বিবাহিত',
                        'বিধবা',
                        'তালাকপ্রাপ্ত',
                      ],
                      (value) {
                        setState(() => _maritalStatus = value);
                      },
                    ),

                    const SizedBox(height: 24),
                    _buildSectionTitle('কর্মসংস্থানের স্থান নির্বাচন'),
                    const SizedBox(height: 16),

                    const Text(
                      'কি ধরনের কারখানা (করমুল ইন্ডাস্ট্রিস)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),

                    _buildCheckboxGroup([
                      'তৈরি পোশাক কারখানা',
                      'চা শিল্প',
                      'জুতার কারখানা',
                      'নির্মান ও অবকাঠামো ভাঙ্গা।',
                      'করলা খনি',
                    ]),

                    const SizedBox(height: 8),
                    _buildCheckboxGroup([
                      'ভালু টেইন',
                      'আহাজে অল্যা বা আহাজে নির্মাণ',
                      'পরিবহন',
                      'স্ট্রিল মিল ও রি-রোলিং',
                      'গ্যাস ফেক্ত্র',
                    ]),

                    const SizedBox(height: 8),
                    _buildCheckboxGroup([
                      'চামারি কারখানা বা চামড়া শিল্প',
                      'মৎস্য',
                      'খাদ্য ও পানীয়',
                      'পাটকল',
                      'সেবা খাত (হাস্ত পরিচর্যা, নার্স, ক্লিনার, সিকিউরিটি সার্ভ, যোটেন বয়, ওয়াসা কর্মী, তেজা কর্মী)',
                    ]),

                    const SizedBox(height: 8),
                    _buildCheckboxGroup([
                      'সরকারি পরিষেবা কর্মী',
                      'চিনি কল',
                      'চালের কল',
                      'হস্ত শিল্প অনান্যা ,এখানে লিখুন',
                    ]),

                    const SizedBox(height: 8),
                    _buildCheckboxGroup([
                      'ফার্মাসিউটিক্যালস',
                      'কাগজের কারখানা',
                      'অটোমোবাইল',
                    ]),

                    const SizedBox(height: 8),
                    _buildCheckboxGroup([
                      'রাসায়নিক শিল্প',
                      'ইট তৈরির কারখানা',
                      'ঝালাই কারখানা',
                    ]),
                    _buildTextField(
                      'অন্যান্য উপাদান',
                      TextEditingController(),
                      maxLines: 2,
                    ),

                    const SizedBox(height: 24),
                    const Text(
                      '(ইনফরমাল ইন্ডাস্ট্রিস)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),

                    _buildCheckboxGroup([
                      'পাথর কারখানা।',
                      'জেলে',
                      'কসাই',
                      'ফসল উৎপাদন কর্মী।',
                      'হস্ত শিল্প অথবা অনানুষ্ঠানিক পরিবহন কর্মী (রিকশা/মোকা/ভান) হলে এখানে লিখুন',
                    ]),

                    const SizedBox(height: 8),
                    _buildCheckboxGroup([
                      'তাঁত',
                      'পুহস্তী',
                      'দিনমজুর।',
                      'আসবাবপত্র তৈরী কর্মী',
                    ]),

                    const SizedBox(height: 8),
                    _buildCheckboxGroup([
                      'স্বর্ণকার।',
                      'ফেরিওয়ালা',
                      'নির্মাণ পুহস্তী সম্পর্কিত ব্যাক্তিত্ব।',
                    ]),
                    _buildTextField(
                      'অন্যান্য উপাদান',
                      TextEditingController(),
                      maxLines: 2,
                    ),

                    const SizedBox(height: 24),
                    _buildSectionTitle('প্রতিষ্ঠানের তথ্য'),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'কারখানা/প্রতিষ্ঠানের নাম ও ঠিকানা',
                            TextEditingController(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'কারখানা/প্রতিষ্ঠানের রেজি. নং:',
                            TextEditingController(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'টেলিফোন, মোবাইল, ফ্যাক্স ও ইমেইল:',
                            TextEditingController(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'ব্যবস্থাপকের নাম ও ঠিকানা (ফোন নম্বরসহ):',
                            TextEditingController(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'প্রতিষ্ঠানের উৎপাদিত দ্রব্য/সেবার প্রকৃতি ও ধরন:',
                            TextEditingController(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'দুর্ঘটনার তারিখ ও সময়:',
                            TextEditingController(),
                            suffixIcon: Icons.calendar_today,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'স্থান/শাখা/বিভাগ (যেখানে দুর্ঘটনা সংঘটিত হয়েছে):',
                            TextEditingController(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'দুর্ঘটনা কবলিত ব্যাক্তির মজুরি:',
                            TextEditingController(),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    _buildSectionTitle('দুর্ঘটনার ধরন'),

                    const SizedBox(height: 16),
                    _buildCheckboxGroup([
                      'মৃত্যু',
                      'স্থায়ী পূর্ণ দৈহিক অক্ষমতা',
                      'স্থায়ী আংশিক দৈহিক অক্ষমতা',
                      "জখমের ফলে ১৬ ঘন্টার অতিরিক্ত এবং ২০ দিন পর্যন্ত কাজে অনুপস্থিতির কারণ ঘটলে",
                    ]),
                    SizedBox(height: 10),
                    Text("যদি মৃত্যু হয় তাহলে মৃত্যুর তারিখ ও সময় উল্লেখ করুন"),
                    SizedBox(height: 15),
                    _buildTextField(
                      'দুর্ঘটনার তারিখ ও সময়:',
                      TextEditingController(),
                      suffixIcon: Icons.calendar_today,
                    ),
                    _buildSectionTitle('দুর্ঘটনার ফলে অক্ষমতা'),

                    const SizedBox(height: 16),
                    _buildCheckboxGroup([
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
                    ]),
                    Text("অন্যান্য এখানে লিখুন:"),
                    _buildTextField(
                      'অন্যান্য উপাদান',
                      TextEditingController(),
                      maxLines: 2,
                    ),
                    _buildSectionTitle('দুর্ঘটনার সহায়ক বস্তু'),

                    const SizedBox(height: 16),
                    Text(
                      "দুর্ঘটনার সহায়ক বস্তুর শ্রেণিবিভাগ (যেটি প্রযোজ্য সেখানে টিক চিহ্ন দিন):",
                    ),
                    const SizedBox(height: 10),
                    _buildCheckboxGroup([
                      'প্রধান চালক যন্ত্র',
                      'সঞ্চালক যন্ত্রপাতি',
                      'উত্তোলক যন্ত্রপাতি',
                      "কার্যরত যন্ত্রপাতি",
                      "অন্য যন্ত্রপাতি বা সংস্থাপনসমূহ",
                      "রেল বা ট্রলি পরিবহন",
                      "পণ্য পরিবহন বা মাল পরিবহন",
                      "হাতে ব্যবহারিত যন্ত্রপাতি",
                    ]),
                    SizedBox(height: 10),
                    Text("দাহ্য পদার্থ অন্যান্য এখানে লিখুন:"),
                    SizedBox(height: 10),
                    _buildTextField(
                      'অন্যান্য উপাদান',
                      TextEditingController(),
                      maxLines: 2,
                    ),

                    _buildSectionTitle('সহয়তাকারীর তথ্য'),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'তথ্য সহায়তাকারির নাম',
                            TextEditingController(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'ফোন নং',
                            TextEditingController(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        // Reset Button
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.refresh, size: 18),
                            label: Text(
                              'রিসেট করুন',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[600],
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 10),

                        // Next Step Button
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FormPageStepTwo(),
                                ),
                              );
                            },
                            icon: Icon(Icons.arrow_right_alt, size: 22),
                            label: Text(
                              'পরবর্তী ধাপ',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int step, bool isActive, bool isDone) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? const Color(0xFF1976D2)
            : isDone
            ? Colors.green
            : Colors.grey[300],
        border: Border.all(
          color: isActive ? const Color(0xFF1976D2) : Colors.grey[400]!,
          width: 2,
        ),
      ),
      child: Center(
        child: isDone
            ? Icon(Icons.check, color: Colors.white)
            : Text(
                step.toString(),
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  Widget _buildStepLine(bool isActive, bool isDone) {
    return Container(
      height: 2,
      color: isActive
          ? const Color(0xFF1976D2)
          : isDone
          ? Colors.green
          : Colors.grey[300],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1976D2),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    IconData? suffixIcon,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'এই ক্ষেত্রটি পূরণ করুন';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String? value,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(value: item, child: Text(item));
        }).toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'একটি অপশন নির্বাচন করুন';
          }
          return null;
        },
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _fatherNameController.dispose();
    _motherNameController.dispose();
    _spouseNameController.dispose();
    _birthDateController.dispose();
    _nidController.dispose();
    _birthCertificateController.dispose();
    _passportController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _permanentVillageController.dispose();
    _permanentPostOfficeController.dispose();
    _permanentDistrictController.dispose();
    _permanentDivisionController.dispose();
    _presentVillageController.dispose();
    _presentPostOfficeController.dispose();
    _presentDistrictController.dispose();
    _presentDivisionController.dispose();
    _sscRollController.dispose();
    _sscRegController.dispose();
    _sscYearController.dispose();
    _sscBoardController.dispose();
    _sscGpaController.dispose();
    _hscRollController.dispose();
    _hscRegController.dispose();
    _hscYearController.dispose();
    _hscBoardController.dispose();
    _hscGpaController.dispose();
    super.dispose();
  }
}

Widget _buildCheckboxGroup(List<String> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: items.map((item) {
      return StatefulBuilder(
        builder: (context, setState) {
          bool isChecked = false;

          return CheckboxListTile(
            value: isChecked,
            title: Text(item),
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          );
        },
      );
    }).toList(),
  );
}
