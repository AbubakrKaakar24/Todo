class Task {
  bool isChecked;
  String name;
  Task(this.isChecked, this.name);
  void toggle() {
    isChecked = !isChecked;
  }
}
