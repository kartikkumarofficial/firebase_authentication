import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FileUploadPage extends StatefulWidget {
  const FileUploadPage({super.key});

  @override
  State<FileUploadPage> createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  PlatformFile? pickedFile;


  Future<void> selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result==null) return;
  setState(() {
    pickedFile=result.files.first;
  });
  }





  @override
  Widget build(BuildContext context) {
    var srcheight = MediaQuery.of(context).size.height;
    var srcwidth = MediaQuery.of(context).size.width;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'File Upload',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF6A11CB),
      ),
      body: Container(
        width: srcwidth,
        height: srcheight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6A11CB),
              Color(0xFF2575FC),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: srcwidth * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(pickedFile!=null)
                  Expanded(
                      child: Container(
                        color: Colors.blue[100],
                        child: Image.file(
                          File(pickedFile!.path!),
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )),
                ElevatedButton(
                  onPressed: selectFile,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: srcwidth * 0.15, vertical: srcheight * 0.015),
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6A11CB),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(srcwidth * 0.04),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.file_open, size: 28),
                      SizedBox(width: srcwidth * 0.03),
                      Text(
                        "Select File",
                        style: TextStyle(
                          fontSize: textScaleFactor * 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: srcheight * 0.03),
                ElevatedButton(
                  onPressed: (){},
                  // onPressed: uploadFile,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: srcwidth * 0.15, vertical: srcheight * 0.015),
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6A11CB),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(srcwidth * 0.04),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.cloud_upload, size: 28),
                      SizedBox(width: srcwidth * 0.03),
                      Text(
                        "Upload File",
                        style: TextStyle(
                          fontSize: textScaleFactor * 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
