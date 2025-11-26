import 'package:flutter/material.dart';
import 'package:from_app/presentation/home/home_page.dart';
import 'package:from_app/provider/information_provider.dart';
import 'package:provider/provider.dart';

class SubmitPage extends StatelessWidget {
  const SubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InformationProvider>();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildStepIndicator(1, false, true),
                  Expanded(child: _buildStepLine(false, true)),
                  _buildStepIndicator(2, false, true),
                  Expanded(child: _buildStepLine(false, true)),
                  _buildStepIndicator(3, false, true),
                  Expanded(child: _buildStepLine(false, true)),
                  _buildStepIndicator(4, true, false),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff667EEA),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.person, color: Colors.white),
                      Text(
                        "ব্যক্তিগত তথ্য",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildInfoRow(
              'তথ্য সংগ্রহকারীর নাম',
              provider.informationGiveHelperController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow(
              'দুর্ঘটনা কবলিত ব্যাক্তির নাম',
              provider.nameController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow('জন্ম তারিখ', provider.birthDateController.text),
            const Divider(height: 1),
            _buildInfoRow(
              'জাতীয় পরিচয় পত্র নম্বর',
              provider.nidController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow('পিতার নাম', provider.fatherNameController.text),
            const Divider(height: 1),
            _buildInfoRow('মাতার নাম', provider.motherNameController.text),
            const Divider(height: 1),
            _buildInfoRow(
              'স্বামী/স্ত্রীর নাম',
              provider.spouseNameController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow('বয়স', provider.ageController.text),
            const Divider(height: 1),
            _buildInfoRow('লিঙ্গ', provider.gender!),
            const Divider(height: 1),
            _buildInfoRow('বৈবাহিক অবস্থা', provider.maritalStatus!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff667EEA),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.book, color: Colors.white),
                      Text(
                        "যোগাযোগের তথ্য",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildInfoRow(
              'বর্তমান ঠিকানা',
              provider.currentAddressController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow(
              'স্থায়ী ঠিকানা',
              provider.permanentAddressController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow(
              'মোবাইল/পরিবারের যোগাযোগ',
              provider.phoneController.text,
            ),
            const Divider(height: 1),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff667EEA),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.person, color: Colors.white),
                      Text(
                        "কর্মক্ষেত্রের তথ্য",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildInfoRow(
              'কারখানা/প্রতিষ্ঠানের নাম ও ঠিকানা',
              provider.officeNameController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow(
              'রেজিস্ট্রেশন নম্বর',
              provider.officeRegistrationController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow(
              'টেলিফোন, মোবাইল, ফ্যাক্স ও ইমেইল',
              provider.officeTelephoneController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow(
              'ম্যানেজারের ফোন নম্বর',
              provider.officeMdNameController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow(
              'উৎপাদিত দ্রব্য/সেবার প্রকৃতি ও ধরন',
              provider.produceProductNameController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow(
              'স্থান/শাখা/বিভাগ',
              provider.accidentPlaceController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow(
              'মজুরি',
              provider.accidentPersonSalaryController.text,
            ),
            const Divider(height: 1),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff667EEA),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.warning, color: Colors.white),
                      Text(
                        "দুর্ঘটনার তথ্য",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildInfoRow('কর্মস্থলের নাম', provider.workplaceName!),
            const Divider(height: 1),
            _buildInfoRow('দুর্ঘটনার ধরন', provider.accidentSystem!),
            const Divider(height: 1),
            _buildInfoRow(
              'দুর্ঘটনার অংশ',
              provider.afterAccidentFeactureController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow('আঘাতপ্রাপ্ত অংশ', provider.bodyPartFeacture ?? provider.otherBoydpartFecatureController.text),
            const Divider(height: 1),
            _buildInfoRow('সহায়তাকারী অংশ', provider.accidentHelper!),
            const Divider(height: 1),
            _buildInfoRow('দুর্ঘটনার তারিখ ও সময়', provider.accidentDate!),
            const Divider(height: 1),
            _buildInfoRow('মৃত্যুর তারিখ ও সময়', provider.ifDeath!),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff667EEA),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.warning, color: Colors.white),
                      Text(
                        "তথ্য প্রদানকারীর বিবরণ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildInfoRow(
              'তথ্য সহায়তাকারীর নাম',
              provider.informationGiveHelperController.text,
            ),
            const Divider(height: 1),
            _buildInfoRow(
              'ফোন নম্বর	',
              provider.informationHelperPhoneController.text,
            ),
            const Divider(height: 1),

            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.home, size: 20),
                      label: const Text('Home', style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Print action
                        CustomSnackbar.show(
                          context,
                          message: "Successfully Submit",
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      icon: const Icon(Icons.print, size: 20),
                      label: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildInfoRow(String label, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: const BoxDecoration(color: Color(0xffF8F9FA)),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ],
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
        color: isActive
            ? const Color(0xFF1976D2)
            : isDone
            ? Colors.green
            : Colors.grey[400]!,
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

class CustomSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    IconData icon = Icons.info,
    Color backgroundColor = Colors.teal,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackBar = SnackBar(
      duration: duration,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: textColor),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 20, left: 16, right: 16),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
