import 'package:flutter/material.dart';
import 'package:from_app/presentation/home/from_page_step_two.dart';
import 'package:from_app/provider/information_provider.dart';
import 'package:provider/provider.dart';

class InformationFormScreen extends StatelessWidget {
  const InformationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InformationProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'তথ্য সংগ্রহকারী ফর্ম',
          style: TextStyle(color: Colors.white),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.white)),
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
                key: provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('মৌলিক তথ্য'),
                    const SizedBox(height: 16),
                    _buildTextField(
                      'দুর্ভিক্ষা কবলিত ব্যাক্তির নাম',
                      provider.nameController,
                    ),
                    SizedBox(height: 5),
                    _buildTextField(
                      'দুর্ভিক্ষা কবলিত ব্যাক্তির জন্ম তারিখ',
                      provider.birthDateController,
                    ),
                    SizedBox(height: 5),

                    _buildTextField(
                      'দুর্ভিক্ষা কবলিত ব্যাক্তির জাতিয় পরিচয় পত্র নম্বর',
                      provider.nidController,
                    ),
                    SizedBox(height: 5),

                    _buildTextField(
                      'দুর্ভিক্ষা কবলিত ব্যাক্তির পিতার নাম',
                      provider.fatherNameController,
                    ),
                    SizedBox(height: 5),
                    _buildTextField(
                      'দুর্ভিক্ষা কবলিত ব্যাক্তির মাতার নাম',
                      provider.motherNameController,
                    ),
                    SizedBox(height: 5),
                    _buildTextField(
                      'দুর্ভিক্ষা কবলিত ব্যাক্তির স্বামী বা স্ত্রীর নাম',
                      provider.spouseNameController,
                    ),
                    SizedBox(height: 5),

                    _buildTextField(
                      'দুর্ভিক্ষা কবলিত ব্যাক্তির বর্তমান ঠিকানা',
                      provider.currentAddressController,
                    ),
                    SizedBox(height: 5),

                    _buildTextField(
                      'দুর্ভিক্ষা কবলিত ব্যাক্তির স্থায়ী ঠিকানা',
                      provider.permanentAddressController,
                    ),
                    SizedBox(height: 5),
                    _buildTextField(
                      'দুর্ভিক্ষা কবলিত ব্যাক্তির মোবাইল নম্বর বা তার স্বজনের যোগাযোগের নম্বর:',
                      provider.phoneController,
                    ),
                    SizedBox(height: 5),
                    _buildTextField(
                      'দুর্ভিক্ষা কবলিত ব্যাক্তির বয়স',
                      provider.phoneController,
                    ),
                    SizedBox(height: 5),

                    _buildTextField(
                      'দুর্ভিক্ষা কবলিত ব্যাক্তির পদবী',
                      provider.degesicnationController,
                    ),
                    SizedBox(height: 5),
                    _buildDropdown(
                      'লিঙ্গ:',
                      provider.gender,
                      ['নির্বাচন করুন', 'পুরুষ', 'মহিলা', 'অন্যান্য'],
                      (value) {
                        provider.updateGender(value!);
                      },
                    ),

                    _buildDropdown(
                      'বৈবাহিক অবস্থা',
                      provider.maritalStatus,
                      [
                        'নির্বাচন করুন',
                        'অবিবাহিত',
                        'বিবাহিত',
                        'বিধবা',
                        'তালাকপ্রাপ্ত',
                      ],
                      (value) {
                        provider.updateMaritalStatus(value!);
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
                    Column(
                      children: List.generate(provider.firstList.length, (
                        index,
                      ) {
                        return CheckboxListTile(
controlAffinity: ListTileControlAffinity.leading,
                          title: Text(provider.firstList[index]),
                          value: provider.firstListCheck[index],
                          onChanged: (v) {
                            provider.updateWorkPlaceName(
                              index,
                              provider.firstList[index],
                            );
                          },
                        );
                      }),
                    ),

                    // _buildCheckboxGroup(
                    //  provider.firstList,

                    //   (v) {
                    //     provider.updateWorkPlaceName(v);

                    //   },
                    //   isSelected: provider.firstList,

                    // ),
                    const SizedBox(height: 8),

                    _buildTextField(
                      'অন্যান্য উপাদান',
                      provider.othersProductController,
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

                    Column(
                      children: List.generate(provider.secondList.length, (
                        index,
                      ) {
                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(provider.secondList[index]),
                          value: provider.secondListCheck[index],
                          onChanged: (v) {
                            provider.updateWorkshopName(
                              index,
                              provider.secondList[index],
                            );
                          },
                        );
                      }),
                    ),

                    // _buildCheckboxGroup(
                    //  provider.secondList ,
                    //   (v) {
                    //     provider.updateWorkshopName(v);
                    //   },
                    //    isSelected:  provider. secondListCheck,
                    // ),
                    _buildTextField(
                      'অন্যান্য উপাদান',
                      provider.othersProductController,
                      maxLines: 2,
                    ),

                    const SizedBox(height: 24),
                    _buildSectionTitle('প্রতিষ্ঠানের তথ্য'),
                    const SizedBox(height: 16),
                    _buildTextField(
                      'কারখানা/প্রতিষ্ঠানের নাম ও ঠিকানা',
                      provider.officeNameController,
                    ),
                    SizedBox(height: 5),
                    _buildTextField(
                      'কারখানা/প্রতিষ্ঠানের রেজি. নং',
                      provider.officeRegistrationController,
                    ),
                    SizedBox(height: 5),
                    _buildTextField(
                      'টেলিফোন, মোবাইল, ফ্যাক্স ও ইমেইল',
                      provider.officeTelephoneController,
                    ),
                    SizedBox(height: 5),
                    _buildTextField(
                      'ব্যবস্থাপকের নাম ও ঠিকানা (ফোন নম্বরসহ)',
                      provider.officeMdNameController,
                    ),
                    SizedBox(height: 5),
                    _buildTextField(
                      'প্রতিষ্ঠানের উৎপাদিত দ্রব্য/সেবার প্রকৃতি ও ধরন:',
                      provider.produceProductNameController,
                    ),
                    SizedBox(height: 5),

                    _buildTextField(
                      'দুর্ঘটনার তারিখ ও সময়:',
                      TextEditingController(text: provider.accidentDate),
                      suffixIcon: Icons.calendar_today,
                      readonly: true,
                      onTapSuffixIcon: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                          provider.updateAccidentData(
                            formattedDate,
                          ); // update provider
                        }
                      },
                    ),
                    SizedBox(height: 5),
                    _buildTextField(
                      'স্থান/শাখা/বিভাগ (যেখানে দুর্ঘটনা সংঘটিত হয়েছে)',
                      provider.accidentPlaceController,
                    ),
                    _buildTextField(
                      'দুর্ঘটনা কবলিত ব্যাক্তির মজুরি',
                      provider.accidentPersonSalaryController,
                    ),

                    const SizedBox(height: 24),
                    _buildSectionTitle('দুর্ঘটনার ধরন'),

                    const SizedBox(height: 16),

                    Column(
                      children: List.generate(provider.thirdList.length, (
                        index,
                      ) {
                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(provider.thirdList[index]),
                          value: provider.thirdListCheck[index],
                          onChanged: (v) {
                            provider.updateAccidentSystem(
                              index,
                              provider.thirdList[index],
                            );
                          },
                        );
                      }),
                    ),
                    // _buildCheckboxGroup(
                    //  provider.thirdList,
                    //   (v) {
                    //     provider.updateAccidentSystem(v);
                    //   },
                    //   isSelected: provider.thirdListCheck,
                    // ),
                    SizedBox(height: 10),
                    Text("যদি মৃত্যু হয় তাহলে মৃত্যুর তারিখ ও সময় উল্লেখ করুন"),
                    SizedBox(height: 15),
                    _buildTextField(
                      'দুর্ঘটনার তারিখ ও সময়:',
                      TextEditingController(text: provider.ifDeath),
                      readonly: true,
                      suffixIcon: Icons.calendar_today,
                      onTapSuffixIcon: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                          provider.updateIfDeath(
                            formattedDate,
                          ); // update provider
                        }
                      },
                    ),
                  provider.accidentSystem == null ||  provider.accidentSystem == "মৃত্যু"  ? SizedBox() : SizedBox(height: 16),
                provider.accidentSystem == null ||   provider.accidentSystem == "মৃত্যু"  ? SizedBox() : _buildSectionTitle('অঙ্গহানির বিবরণ'),
                  provider.accidentSystem == null ||  provider.accidentSystem == "মৃত্যু"  ? SizedBox() : Column(
                      children: List.generate(provider.fourthList.length, (
                        index,
                      ) {
                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(provider.fourthList[index]),
                          value: provider.fourthListCheck[index],
                          onChanged: (v) {
                            provider.updateBodyPartFeacture(
                              index,
                              provider.fourthList[index],
                            );
                          },
                        );
                      }),
                    ),
                    // _buildCheckboxGroup(
                    //  provider.fourthList,
                    //   (v) {
                    //     provider.updateBodyPartFeacture(v);
                    //   },
                    //   isSelected: provider.fourthListCheck,
                    // ),
                    Text("তর্জনী বাদে অন্য কোন আঙ্গুল অন্যান্য এখানে লিখুন:"),
                    SizedBox(height: 15),
                    _buildTextField(
                      'অন্যান্য উপাদান',
                      provider.otherBoydpartFecatureController,
                    ),

                    _buildSectionTitle('দুর্ঘটনার ফলে অক্ষমতা'),

                    const SizedBox(height: 16),
                    Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(provider.fifthList.length, (
                        index,
                      ) {
                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(provider.fifthList[index]),
                          value: provider.fifthistCheck[index],
                          onChanged: (v) {
                            provider.updateAfterAccidentFeacture(
                              index,
                              provider.fifthList[index],
                            );
                          },
                        );
                      }),
                    ),

                    // _buildCheckboxGroup(
                    // provider.fifthList,
                    //   (v) {
                    //     provider.updateAfterAccidentFeacture(v);
                    //   },
                    //   isSelected: provider.fifthistCheck
                    // ),
                    Text("অন্যান্য এখানে লিখুন:"),
                    _buildTextField(
                      'অন্যান্য উপাদান',
                      provider.afterAccidentFeactureController,
                      maxLines: 2,
                    ),
                    _buildSectionTitle('দুর্ঘটনার সহায়ক বস্তু'),

                    const SizedBox(height: 16),
                    Text(
                      "দুর্ঘটনার সহায়ক বস্তুর শ্রেণিবিভাগ (যেটি প্রযোজ্য সেখানে টিক চিহ্ন দিন):",
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: List.generate(provider.sixthList.length, (
                        index,
                      ) {
                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(provider.sixthList[index]),
                          value: provider.sixthListCheck[index],
                          onChanged: (v) {
                            provider.updateAccidentHelper(
                              index,
                              provider.sixthList[index],
                            );
                          },
                        );
                      }),
                    ),

                    // _buildCheckboxGroup(
                    //   provider.sixthList,
                    //   (v) {
                    //     provider.updateAccidentHelper(v);
                    //   },
                    //   isSelected: provider.sixthListCheck,
                    // ),
                    SizedBox(height: 10),
                    Text("দাহ্য পদার্থ অন্যান্য এখানে লিখুন:"),
                    SizedBox(height: 10),
                    _buildTextField(
                      'অন্যান্য উপাদান',
                      provider.otherFireProductController,
                      maxLines: 2,
                    ),

                    _buildSectionTitle('সহয়তাকারীর তথ্য'),
                    SizedBox(height: 15),
                    _buildTextField(
                      'তথ্য সহায়তাকারির নাম',
                      provider.informationGiveHelperController,
                    ),
                    _buildTextField(
                      'ফোন নং',
                      provider.informationHelperPhoneController,
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
                              // final provider = context
                              //     .read<InformationProvider>();

                              // // 1️⃣ Validate all TextFormFields
                              // if (!(provider.formKey.currentState?.validate() ??
                              //     false))
                              //   return;

                              // // 2️⃣ Validate dropdowns
                              // if (provider.gender == null ||
                              //     provider.gender == "নির্বাচন করুন") {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text("লিঙ্গ নির্বাচন করুন"),
                              //     ),
                              //   );
                              //   return;
                              // }
                              // if (provider.maritalStatus == null ||
                              //     provider.maritalStatus == "নির্বাচন করুন") {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text(
                              //         "বৈবাহিক অবস্থা নির্বাচন করুন",
                              //       ),
                              //     ),
                              //   );
                              //   return;
                              // }

                              // // 3️⃣ Validate checkbox selections
                              // if (provider.workplaceName == null ||
                              //     provider.workplaceName!.isEmpty) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text(
                              //         "কর্মসংস্থানের স্থান নির্বাচন করুন",
                              //       ),
                              //     ),
                              //   );
                              //   return;
                              // }
                              // if (provider.workShopeName == null ||
                              //     provider.workShopeName!.isEmpty) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text(
                              //         "ইনফরমাল ইন্ডাস্ট্রিস নির্বাচন করুন",
                              //       ),
                              //     ),
                              //   );
                              //   return;
                              // }
                              // if (provider.accidentSystem == null ||
                              //     provider.accidentSystem!.isEmpty) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text(
                              //         "দুর্ঘটনার ধরন নির্বাচন করুন",
                              //       ),
                              //     ),
                              //   );
                              //   return;
                              // }
                              // if (provider.accidentHelper == null ||
                              //     provider.accidentHelper!.isEmpty) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text(
                              //         "দুর্ঘটনার সহায়ক বস্তু নির্বাচন করুন",
                              //       ),
                              //     ),
                              //   );
                              //   return;
                              // }

                              // // 4️⃣ Validate dates
                              // if (provider.accidentDate == null ||
                              //     provider.accidentDate!.isEmpty) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text(
                              //         "দুর্ঘটনার তারিখ নির্বাচন করুন",
                              //       ),
                              //     ),
                              //   );
                              //   return;
                              // }

                              // if (provider.accidentSystem == "মৃত্যু") {
                              //   if (provider.ifDeath == null ||
                              //       provider.ifDeath!.isEmpty) {
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //         content: Text(
                              //           "মৃত্যুর তারিখ নির্বাচন করুন",
                              //         ),
                              //       ),
                              //     );
                              //     return;
                              //   }
                              // }

                              // ✅ All validation passed -> Navigate to next page
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
                              backgroundColor: Colors.red,
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
        color: Colors.red,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    IconData? suffixIcon,
    Function()? onTapSuffixIcon,
    int maxLines = 1,
    bool readonly = false,
    String? Function(String?)? validator, // <-- optional custom validator
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        readOnly: readonly,
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: suffixIcon != null
              ? InkWell(onTap: onTapSuffixIcon, child: Icon(suffixIcon))
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
        ),
        validator:
            validator ??
            (value) {
              if (value == null || value.isEmpty)
                return 'এই ক্ষেত্রটি পূরণ করুন';
              return null;
            },
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String? value,
    List<String> items,
    Function(String?) onChanged, {
    bool requiredField = false,
  }) {
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
        items: items.map((item) {
          return DropdownMenuItem<String>(value: item, child: Text(item));
        }).toList(),
        onChanged: onChanged,
        validator: requiredField
            ? (val) {
                if (val == null || val.isEmpty || val == items[0]) {
                  return 'একটি অপশন নির্বাচন করুন';
                }
                return null;
              }
            : null,
      ),
    );
  }

  Widget _buildCheckboxGroup(
    List<String> items,
    Function(String) onChanged, {
    required List<bool> isSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (index) {
        return CheckboxListTile(
          title: Text(items[index]),
          value: isSelected[index],
          onChanged: (_) {
            onChanged(items[index]); // parent updates the list
          },
        );
      }),
    );
  }
}
