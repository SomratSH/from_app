import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:from_app/provider/information_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'review_page.dart';

class FormPageStepTwo extends StatelessWidget {
  const FormPageStepTwo({super.key});

  Future<void> pickFileOptions(BuildContext context) async {
    final provider = context.read<InformationProvider>();
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  Navigator.pop(ctx);
                  final picker = ImagePicker();
                  final picked = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (picked != null) provider.addFiles([File(picked.path)]);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () async {
                  Navigator.pop(ctx);
                  final picker = ImagePicker();
                  final picked = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (picked != null) provider.addFiles([File(picked.path)]);
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_file),
                title: const Text('Files'),
                onTap: () async {
                  Navigator.pop(ctx);
                  final result = await FilePicker.platform.pickFiles(
                    allowMultiple: true,
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf'],
                  );
                  if (result != null) {
                    provider.addFiles(
                      result.paths.map((p) => File(p!)).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InformationProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  Colors.red,
        title: const Text(
          'তথ্য সংগ্রহকারী ফর্ম',
          style: TextStyle(color: Colors.white),
        ),
       leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step indicator
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

            // Section title
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                "আপনার ডকুমেন্ট",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Upload Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () => pickFileOptions(context),
                icon: const Icon(Icons.upload_file, color: Colors.red),
                label: const Text(
                  "Upload File",
                  style: TextStyle(color: Colors.red),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade100,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Table Header
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      "SI",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "ডকুমেন্ট টাইপ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "টাইপ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 40), // For delete icon
                ],
              ),
            ),

            // File List
            Expanded(
              child: provider.uploadedFiles.isEmpty
                  ? const Center(child: Text("কোন ফাইল আপলোড করা হয়নি"))
                  : ListView.builder(
                      itemCount: provider.uploadedFiles.length,
                      itemBuilder: (context, index) {
                        File file = provider.uploadedFiles[index];
                        String name = file.path.split('/').last;
                        String ext = name.split('.').last.toUpperCase();

                        return Container(
                          padding: const EdgeInsets.all(12),
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
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () => provider.removeFile(index),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 10),

            // Navigation Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("পূর্ববর্তী ধাপ"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ReviewPage()),
                      );
                    },
                    icon: const Icon(Icons.arrow_right_alt),
                    label: const Text("পরবর্তী ধাপ"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
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
}

// Step Indicator widgets
Widget _buildStepIndicator(int step, bool isActive, bool isDone) {
  return Container(
    width: 32,
    height: 32,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isActive
          ? Colors.red
          : isDone
          ? Colors.green
          : Colors.grey[300],
      border: Border.all(
        color: isActive
            ? Colors.red
            : isDone
            ? Colors.green
            : Colors.grey[400]!,
        width: 2,
      ),
    ),
    child: Center(
      child: isDone
          ? const Icon(Icons.check, color: Colors.white)
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
        ? Colors.red
        : isDone
        ? Colors.green
        : Colors.grey[300],
  );
}
