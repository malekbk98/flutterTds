import 'package:faker/faker.dart';
import 'package:todolist/models/Task.dart';

late List<Task> tasksList;

//Create random/fake tasks
List getRandTasks() {
  var faker = Faker();
  tasksList = List<Task>.generate(
    50,
    (int index) => Task(
      random.integer(9999),
      faker.lorem.sentence(),
      random.boolean(),
      faker.date.dateTime(minYear: 2020, maxYear: 2022),
    ),
  );

  return tasksList;
}
