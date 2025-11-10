import 'package:intl/intl.dart';

class Program {
  final String imageUrl;
  final String title;
  final String date;
  final String details;

  Program({required this.imageUrl, required this.title, required this.date, required this.details});

  List<String> convertDate() {
    DateTime dateTime = DateFormat("yyyy-MM-dd").parse(date);

    String formattedDate = DateFormat("d MMM").format(dateTime);
    return formattedDate.split(' ');
  }
}

final List<Program> programs = [
  Program(
    imageUrl: 'assets/images/program_1.jpg',
    title: 'IA DEFENSE & ESPACE',
    date: '2025-12-21',
    details: """Lorem ipsum dolor sit amet, consectetur elit adipiscing elit. Venenatis pulvinar a a
    met in, suspendisse vitae, posuere eu tortor et. Und commodo, fermentum, mauris leo eg.
    Lorem ipsum dolor sit amet, consectetur elit adipiscing elit. Venenatis pulvinar a amet in, suspendisse vitae, posuere eu tortor et. Und commodo, fermentum, mauris leo eget.t.""",
  ),
  Program(
    imageUrl: 'assets/images/program_2.jpg',
    title: 'Fire Store',
    date: '2025-12-22',
    details: """Lorem ipsum dolor sit amet, consectetur elit adipiscing elit. Venenatis pulvinar a a
    met in, suspendisse vitae, posuere eu tortor et. Und commodo, fermentum, mauris leo eg.
    Lorem ipsum dolor sit amet, consectetur elit adipiscing elit. Venenatis pulvinar a amet in, suspendisse vitae, posuere eu tortor et. Und commodo, fermentum, mauris leo eget.t.""",
  ),
  Program(
    imageUrl: 'assets/images/program_1.jpg',
    title: 'IA DEFENSE & ESPACE',
    date: '2025-12-21',
    details: """Lorem ipsum dolor sit amet, consectetur elit adipiscing elit. Venenatis pulvinar a a
    met in, suspendisse vitae, posuere eu tortor et. Und commodo, fermentum, mauris leo eg.
    Lorem ipsum dolor sit amet, consectetur elit adipiscing elit. Venenatis pulvinar a amet in, suspendisse vitae, posuere eu tortor et. Und commodo, fermentum, mauris leo eget.t.""",
  ),
  Program(
    imageUrl: 'assets/images/program_2.jpg',
    title: 'Fire Store',
    date: '2025-12-22',
    details: """Lorem ipsum dolor sit amet, consectetur elit adipiscing elit. Venenatis pulvinar a a
    met in, suspendisse vitae, posuere eu tortor et. Und commodo, fermentum, mauris leo eg.
    Lorem ipsum dolor sit amet, consectetur elit adipiscing elit. Venenatis pulvinar a amet in, suspendisse vitae, posuere eu tortor et. Und commodo, fermentum, mauris leo eget.t.""",
  ),
  Program(
    imageUrl: 'assets/images/program_1.jpg',
    title: 'IA DEFENSE & ESPACE',
    date: '2025-12-21',
    details: """Lorem ipsum dolor sit amet, consectetur elit adipiscing elit. Venenatis pulvinar a a
    met in, suspendisse vitae, posuere eu tortor et. Und commodo, fermentum, mauris leo eg.
    Lorem ipsum dolor sit amet, consectetur elit adipiscing elit. Venenatis pulvinar a amet in, suspendisse vitae, posuere eu tortor et. Und commodo, fermentum, mauris leo eget.t.""",
  ),
  Program(
    imageUrl: 'assets/images/program_2.jpg',
    title: 'Fire Store',
    date: '2025-12-22',
    details: """Lorem ipsum dolor sit amet, consectetur elit adipiscing elit. Venenatis pulvinar a a
    met in, suspendisse vitae, posuere eu tortor et. Und commodo, fermentum, mauris leo eg.
    Lorem ipsum dolor sit amet, consectetur elit adipiscing elit. Venenatis pulvinar a amet in, suspendisse vitae, posuere eu tortor et. Und commodo, fermentum, mauris leo eget.t.""",
  ),
];
