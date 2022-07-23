class Person {
  final String firstName;
  final String lastName;
  final String gender;
  final int age;
  final int height;
  final int weight;
  final double latitude;
  final double longitude;
  final List intrests;

  Person({
    this.firstName = '',
    this.lastName = '',
    this.gender = '',
    this.age = 0,
    this.height = 0,
    this.weight = 0,
    this.longitude = 0,
    this.latitude = 0,
    this.intrests = const [],
  });

  factory Person.fromDocument(doc) {
    return Person(
      firstName: doc['firstname'],
      lastName: doc['lastname'],
      gender: doc['gender'],
      age: doc['age'],
      height: doc['height'],
      weight: doc['weight'],
      longitude: doc['longitide'],
      latitude: doc['latitiude'],
      intrests: doc['interests'],
    );
  }
}
