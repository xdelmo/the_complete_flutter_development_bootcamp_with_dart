import 'dart:core';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result = "";
  // sleep(
  //     threeSeconds); // sleep is a synchronous function (blocks the code execution for 3 seconds)
  await Future.delayed(threeSeconds, () {
    // Future is a asynchronous function (delay the code execution for 3 seconds)
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2Data) {
  print('Task 3 complete with $task2Data');
}
