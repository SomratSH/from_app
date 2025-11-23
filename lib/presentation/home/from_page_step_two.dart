import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:from_app/presentation/home/review_page.dart';

class FormPageStepTwo extends StatefulWidget {
  @override
  State<FormPageStepTwo> createState() => _FormPageStepTwoState();
}

class _FormPageStepTwoState extends State<FormPageStepTwo> {
  List<File> uploadedFiles = [];

  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf'],
    );

    if (result != null) {
      setState(() {
        uploadedFiles.addAll(result.paths.map((p) => File(p!)).toList());
      });
    }
  }

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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildStepIndicator(1, false, true),
                  Expanded(child: _buildStepLine(false, true)),
                  _buildStepIndicator(2, true, false),
                  Expanded(child: _buildStepLine(false, false)),
                  _buildStepIndicator(3, false, false),
                  Expanded(child: _buildStepLine(false, false)),
                  _buildStepIndicator(4, false, false),
                ],
              ),
            ),
            // ------------ SECTION TITLE ----------------
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "আপনার ডকুমেন্ট",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),

            SizedBox(height: 20),

            // ------------ Upload Button ----------------
            Center(
              child: ElevatedButton.icon(
                onPressed: pickFiles,
                icon: Icon(Icons.upload_file, color: Colors.white),
                label: Text(
                  "Upload File",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),

            SizedBox(height: 20),

            // ------------ TABLE HEADER ----------------
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
              ),
              child: Row(
                children: [
                  Expanded(child: Text("SI", style: titleStyle)),
                  Expanded(child: Text("ডকুমেন্ট টাইপ", style: titleStyle)),
                  Expanded(child: Text("টাইপ", style: titleStyle)),
                ],
              ),
            ),

            // ------------ FILE LIST ----------------
            Expanded(
              child: uploadedFiles.isEmpty
                  ? Center(child: Text("কোন ফাইল আপলোড করা হয়নি"))
                  : ListView.builder(
                      itemCount: uploadedFiles.length,
                      itemBuilder: (context, index) {
                        File file = uploadedFiles[index];
                        String name = file.path.split('/').last;
                        String ext = name.split('.').last.toUpperCase();

                        return Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(child: Text("${index + 1}")),
                              Expanded(child: Text(name)),
                              Expanded(child: Text(ext)),

                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    uploadedFiles.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),

            SizedBox(height: 10),

            // ------------ NAVIGATION BUTTONS ----------------
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    label: Text("পূর্ববর্তী ধাপ"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[600],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ReviewPage()),
                      );
                    },
                    icon: Icon(Icons.arrow_right_alt),
                    label: Text("পরবর্তী ধাপ"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get titleStyle =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
}

// Dummy Next Page
class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Next Step Page")));
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
