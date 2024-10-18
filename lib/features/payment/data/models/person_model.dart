class Person {
  String label;
  String price;
  int count;

  Person({
    required this.label,
    required this.price,
    this.count = 0,
  });
}

final List<Person> people = [
  Person(
    label: "Baby",
    price: "20 EGP from 8 to 13 (year)",
  ),
  Person(
    label: "Child",
    price: "30 EGP from 14 to 19 (year)",
  ),
  Person(
    label: "Adult",
    price: "50 EGP from 20 to 50 (year)",
  ),
];

final List<Person> additionalService = [
  Person(
    label: "Dinner",
    price: "A Dinner meal in 5 starts resturant",
  ),
  Person(
    label: "Bus",
    price: "A Bus to drive you to your destination ",
  ),
  Person(
    label: "Adult",
    price: "50 EGP From 20 to 50 (year)",
  ),
];
