class Student {
  late String name;
  late String surname;
  late int score;
  late String examMark;
  late String status;

  Student(this.name, this.surname, this.score);

  String get getStatus {
    String warning = '';
    if (this.score >= 50 && this.score <= 100) {
      warning = 'Geçti';
    } else if (this.score >= 30) {
      warning = 'Bütünleme';
    } else {
      warning = "Kaldı";
    }
    status = warning;
    return status;
  }
}
