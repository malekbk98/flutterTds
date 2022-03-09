import 'package:faker/faker.dart';
import 'package:todolist/models/Task.dart';

var faker = Faker();
List<Task> tasks = List<Task>.generate(
  15,
  (int index) => Task(
    random.integer(9999),
    faker.lorem.sentence(),
    random.boolean(),
    faker.date.dateTime(minYear: 2020, maxYear: 2022),
  ),
);
