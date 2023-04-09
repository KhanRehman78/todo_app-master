import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:todo_app/infrastructure/model/task_model.dart';
import 'package:todo_app/infrastructure/services/task_services.dart';
import 'package:todo_app/infrastructure/services/ulpoad_file.dart';

import '../utils/appconstant_wodget.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_row.dart';
import '../widgets/custom_stack_container.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfromfield.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

TextEditingController _tnController = TextEditingController();

final _formkey = GlobalKey<FormState>();
bool isLoading = false;
TaskServices _taskServices = TaskServices();
DateTime _selectedDate = DateTime.now();

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: LoadingOverlay(
            isLoading: isLoading,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomRow(
                    myText: "Add Task",
                    textFont: FontWeight.bold,
                    textColor: Colors.white,
                    textSize: 18,
                    textSpaceing: 0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomStackContainer(
                          myImage: file != null
                              ? Image.file(file!)
                              : Image.asset("assets/images/artnine.jpg"),
                          addButton: GestureDetector(
                              onTap: () {
                                getImage();
                              },
                              child: const Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.black,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          myText: "Task Name",
                          textFont: FontWeight.w600,
                          textColor: AppConstantWidget.blackColor,
                          textSize: 12,
                          textSpaceing: 1,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        CustomTextformfield(
                          obsecurePWD: false,
                          validate: (email) => email.isEmpty
                              ? "Please Enter Your Task Name"
                              : null,
                          controller: _tnController,
                          borderRadius: 20,
                          borderSide: 2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              makeLoadingTrue();
                              _taskServices
                                  .createTask(TaskModel(
                                taskName: _tnController.text,
                                taskImage: imageUrl,
                                isCompleted: false,
                                dateTime: Timestamp.fromDate(_selectedDate),
                              ))
                                  .then((value) {
                                makeLoadingFalse();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Task Added successfully")));
                              }).onError((error, stackTrace) {
                                makeLoadingFalse();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Failed!!")));
                              });
                            }
                          },
                          child: CustomButton(
                            myText: "ADD",
                            textFont: FontWeight.bold,
                            textSize: 15,
                            textColor: Colors.white,
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
      ),
    );
  }

  makeLoadingTrue() {
    setState(() {
      isLoading = true;
    });
  }

  makeLoadingFalse() {
    setState(() {
      isLoading = false;
    });
  }

  ImagePicker picker = ImagePicker();
  File? file;

  String imageUrl = "";

  Future getImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 30);
    if (pickedFile != null && pickedFile.path != null) {
      file = File(pickedFile.path);
      setState(() {});

      // ignore: use_build_context_synchronously
      imageUrl = await UploadFileServices().getUrl(context, file: file!);
      setState(() {});
    }
  }
}
