import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/infrastructure/model/task_model.dart';
import 'package:todo_app/infrastructure/services/task_services.dart';

import '../utils/appconstant_wodget.dart';
import '../widgets/custom_row.dart';
import '../widgets/custom_text.dart';

class AllTask extends StatefulWidget {
  const AllTask({Key? key}) : super(key: key);

  @override
  State<AllTask> createState() => _AllTaskState();
}

TaskServices _taskServices = TaskServices();

class _AllTaskState extends State<AllTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamProvider.value(
        initialData: [TaskModel()],
        value: _taskServices.allTasks(),
        builder: (context, child) {
          List<TaskModel> allTaskList = context.watch<List<TaskModel>>();
          return SafeArea(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: allTaskList.length,
                itemBuilder: (context, index) {
                  DateTime myDateTime = DateTime.parse(
                      allTaskList[index].dateTime!.toDate().toString());
                  String formattedDateTime =
                      DateFormat('dd/MM/yyyy  hh:mm').format(myDateTime);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 15),
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
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(allTaskList[index]
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    myText: allTaskList[index].taskName,
                                    textFont: FontWeight.normal,
                                    textColor: AppConstantWidget.blackColor,
                                    textSize: 13,
                                    textSpaceing: 0,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  CustomText(
                                    myText: formattedDateTime,
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
                                  InkWell(
                                    onTap: () {
                                      _taskServices.deleteTask(
                                          allTaskList[index].taskId.toString());
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      size: 25,
                                    ),
                                  ),
                                  FittedBox(
                                    child: CustomText(
                                      myText: allTaskList[index].isCompleted!
                                          ? "Completed"
                                          : "pending",
                                      textFont: FontWeight.normal,
                                      textColor: AppConstantWidget.blackColor,
                                      textSize: 13,
                                      textSpaceing: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
