import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/infrastructure/model/task_model.dart';
import 'package:todo_app/infrastructure/services/task_services.dart';

import '../utils/appconstant_wodget.dart';
import '../widgets/custom_text.dart';

class Pending extends StatefulWidget {
  const Pending({Key? key}) : super(key: key);

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  TaskServices _taskServices = TaskServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: StreamProvider.value(
          value: _taskServices.pendingTasks(),
          initialData: [TaskModel()],
          builder: (context, child) {
            List<TaskModel> pendingTaskList = context.watch<List<TaskModel>>();
            return pendingTaskList.isEmpty
                ? const Center(
                    child: Text("No Pending Task found"),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: pendingTaskList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          await FirebaseFirestore.instance
                              .collection("task")
                              .doc(pendingTaskList[index].taskId)
                              .update({"isCompleted": true});
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  pendingTaskList[index]
                                                      .taskImage
                                                      .toString()),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          myText: pendingTaskList[index]
                                              .taskName
                                              .toString(),
                                          textFont: FontWeight.bold,
                                          textColor:
                                              AppConstantWidget.blackColor,
                                          textSize: 15,
                                          textSpaceing: 0,
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        CustomText(
                                          myText: pendingTaskList[index]
                                              .dateTime
                                              .toString(),
                                          textFont: FontWeight.normal,
                                          textColor: Colors.grey,
                                          textSize: 13,
                                          textSpaceing: 0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        const Icon(
                                          Icons.delete,
                                          size: 25,
                                        ),
                                        CustomText(
                                          myText: pendingTaskList[index]
                                                  .isCompleted!
                                              ? "Completed"
                                              : "pending",
                                          textFont: FontWeight.normal,
                                          textColor:
                                              AppConstantWidget.blackColor,
                                          textSize: 13,
                                          textSpaceing: 0,
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
                    },
                  );
          },
        ),
      ),
    );
  }
}
