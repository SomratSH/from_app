import 'package:flutter/material.dart';
import 'package:from_app/presentation/home/submit_page.dart';
import 'package:from_app/presentation/home/widget/info_review.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                    _buildStepIndicator(3, true, false),
                    Expanded(child: _buildStepLine(false, false)),
                    _buildStepIndicator(4, false, false),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xffe8f1ff),
                  borderRadius: BorderRadius.circular(6),
                  border: Border(
                    bottom: BorderSide(color: Colors.blue.shade800, width: 2),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.person, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      "ব্যক্তিগত তথ্য",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              InfoTile(
                icon: Icons.person,
                title: "তথ্য সংগ্রাহীর নাম",
                value: "-",
              ),
              InfoTile(
                icon: Icons.people,
                title: "দুঃখজনক ঘটনার ব্যক্তির নাম",
                value: "Chester Robinson",
              ),
              InfoTile(
                icon: Icons.calendar_month,
                title: "জন্ম তারিখ",
                value: "21-Dec-1985",
              ),
              InfoTile(
                icon: Icons.credit_card,
                title: "জাতীয় পরিচয় পত্র নম্বর",
                value: "Obcaecati commodo pe",
              ),
              InfoTile(
                icon: Icons.male,
                title: "পিতার নাম",
                value: "Emerson Robbins",
              ),
              InfoTile(
                icon: Icons.female,
                title: "মাতার নাম",
                value: "Katelyn Weber",
              ),
              InfoTile(
                icon: Icons.favorite,
                title: "স্বামী/স্ত্রীর নাম",
                value: "Hoyt Barlow",
              ),
              InfoTile(
                icon: Icons.calendar_today,
                title: "বয়স",
                value: "Saepe quod sint hic",
              ),
              InfoTile(
                icon: Icons.transgender,
                title: "লিঙ্গ",
                value: "অন্যান্য",
              ),
              InfoTile(
                icon: Icons.info,
                title: "বৈবাহিক অবস্থা",
                value: "বিবাহিত",
              ),

              // --------------------------------------
              // যোগাযোগের তথ্য
              // --------------------------------------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffe8f1ff),
                  borderRadius: BorderRadius.circular(6),
                  border: Border(
                    bottom: BorderSide(color: Colors.blue.shade800, width: 2),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.contact_mail, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      "যোগাযোগের তথ্য",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Grid items
              const InfoTile(
                icon: Icons.location_on,
                title: "বর্তমান ঠিকানা",
                value: "Aut voluptatem Sit",
              ),
              const InfoTile(
                icon: Icons.home,
                title: "স্থায়ী ঠিকানা",
                value: "Itaque sint suscipit",
              ),
              const InfoTile(
                icon: Icons.call,
                title: "মোবাইল/পরিবারের যোগাযোগ",
                value: "Libero sequi nostrum",
              ),

              // --------------------------------------
              // কর্মক্ষেত্রের তথ্য
              // --------------------------------------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffe8f1ff),
                  borderRadius: BorderRadius.circular(6),
                  border: Border(
                    bottom: BorderSide(color: Colors.blue.shade800, width: 2),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.work, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      "কর্মক্ষেত্রের তথ্য",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const InfoTile(
                icon: Icons.store,
                title: "কারখানা/প্রতিষ্ঠানের নাম ও ঠিকানা",
                value: "Dexter Pierce",
              ),
              const InfoTile(
                icon: Icons.receipt,
                title: "রেজি. নং",
                value: "Commodi velit velit",
              ),
              const InfoTile(
                icon: Icons.phone_in_talk,
                title: "টেলিফোন, মোবাইল, ফ্যাক্স ও ইমেইল",
                value: "Voluptatum ducimus",
              ),
              const InfoTile(
                icon: Icons.people,
                title: "ম্যানেজারের ফোন নম্বর",
                value: "Blanditiis esse sint",
              ),
              const InfoTile(
                icon: Icons.production_quantity_limits,
                title: "উৎপাদিত দ্রব্য/সেবার প্রকার ও ধরন",
                value: "A quis anim esse vo",
              ),
              const InfoTile(
                icon: Icons.place,
                title: "স্থান/শাখা/বিভাগ",
                value: "Quisquam aut nisi ip",
              ),
              const InfoTile(
                icon: Icons.domain,
                title: "মজুরি",
                value: "Eum ut quod proident",
              ),

              // --------------------------------------
              // দুর্ঘটনার তথ্য
              // --------------------------------------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffe8f1ff),
                  borderRadius: BorderRadius.circular(6),
                  border: Border(
                    bottom: BorderSide(color: Colors.blue.shade800, width: 2),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.warning_amber_rounded, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      "দুঘটনার তথ্য",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const InfoTile(
                icon: Icons.info_outline,
                title: "কারখানার নাম",
                value: "পাটকল",
              ),

              const InfoTile(
                icon: Icons.info_outline,
                title: "দুঘটনার ধরন",
                value: "স্থায়ী আংশিক দৈহিক অক্ষমতা",
              ),

              const InfoTile(
                icon: Icons.info_outline,
                title: "দুঘটনার অংশ",
                value: "পায়ের বড়ো আঙ্গুল: Cum consequatur Sed",
              ),

              const InfoTile(
                icon: Icons.info_outline,
                title: "আঘাতপ্রাপ্ত অংশ",
                value: "আঙ্গুল: Voluptate nemo reici",
              ),

              const InfoTile(
                icon: Icons.info_outline,
                title: "সহায়তাকারীর অংশ",
                value: "হাতে ব্যবহৃতিত হাতুড়িপাটি: Ut harum autem animi",
              ),

              const InfoTile(
                icon: Icons.timer,
                title: "দুঘটনার তারিখ ও সময়",
                value: "2015-01-07T00:14",
              ),

              const InfoTile(
                icon: Icons.timelapse,
                title: "মৃত্যুর তারিখ ও সময়",
                value: "1980-09-05T17:36",
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Previous Button
                      ElevatedButton.icon(
                        onPressed: () {
                          print('Previous button pressed');
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                        label: const Text(
                          'পূর্ববর্তী ধাপ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF607D8B),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 2,
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Save Button
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SubmitPage()),
                          );
                        },
                        icon: const Icon(
                          Icons.save_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        label: const Text(
                          'সংরক্ষণ করুন',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5C6BC0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
