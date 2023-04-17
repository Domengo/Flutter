class Human {
  double? height;
  
  Human({this.height});
}
void main() {
  Human jenny = Human(height: 20);
  print(jenny.height);
}
