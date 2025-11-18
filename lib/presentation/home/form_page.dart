import 'package:flutter/material.dart';

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
                _buildStepIndicator(1, true),
                Expanded(child: _buildStepLine(true)),
                _buildStepIndicator(2, false),
                Expanded(child: _buildStepLine(false)),
                _buildStepIndicator(3, false),
                Expanded(child: _buildStepLine(false)),
                _buildStepIndicator(4, false),
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
                    _buildSectionTitle('শিক্ষাগত তথ্য'),
                    const SizedBox(height: 16),

                    const Text(
                      'এস.এস.সি/সমমান পরীক্ষা',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField('রোল', _sscRollController),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'রেজিস্ট্রেশন',
                            _sscRegController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'পাসের সন',
                            _sscYearController,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField('বোর্ড', _sscBoardController),
                        ),
                      ],
                    ),
                    _buildTextField('জিপিএ', _sscGpaController),

                    const SizedBox(height: 16),
                    const Text(
                      'এইচ.এস.সি/সমমান পরীক্ষা',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField('রোল', _hscRollController),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'রেজিস্ট্রেশন',
                            _hscRegController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'পাসের সন',
                            _hscYearController,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField('বোর্ড', _hscBoardController),
                        ),
                      ],
                    ),
                    _buildTextField('জিপিএ', _hscGpaController),

                    const SizedBox(height: 24),
                    _buildSectionTitle('অভিভাবকের তথ্য'),
                    const SizedBox(height: 16),
                    _buildTextField('অভিভাবকের নাম', TextEditingController()),
                    _buildTextField('সম্পর্ক', TextEditingController()),
                    _buildTextField('মোবাইল নম্বর', TextEditingController()),
                    _buildTextField(
                      'জাতীয় পরিচয়পত্র নম্বর',
                      TextEditingController(),
                    ),

                    const SizedBox(height: 24),
                    _buildSectionTitle('জরুরি যোগাযোগ'),
                    const SizedBox(height: 16),
                    _buildTextField('নাম', TextEditingController()),
                    _buildTextField('সম্পর্ক', TextEditingController()),
                    _buildTextField('মোবাইল নম্বর', TextEditingController()),
                    _buildTextField(
                      'ঠিকানা',
                      TextEditingController(),
                      maxLines: 3,
                    ),

                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            // Cancel action
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            side: const BorderSide(color: Colors.grey),
                          ),
                          child: const Text(
                            'বাতিল করুন',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Save and proceed to next step
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('তথ্য সংরক্ষণ করা হচ্ছে...'),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1976D2),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                          ),
                          child: const Text(
                            'সংরক্ষণ করুন',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int step, bool isActive) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color(0xFF1976D2) : Colors.grey[300],
        border: Border.all(
          color: isActive ? const Color(0xFF1976D2) : Colors.grey[400]!,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          step.toString(),
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildStepLine(bool isActive) {
    return Container(
      height: 2,
      color: isActive ? const Color(0xFF1976D2) : Colors.grey[300],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
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
