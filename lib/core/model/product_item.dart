class Fruits {
  final String? imageOfFruit;
  final String? nameOfFruit;
  final double? price;

  Fruits({this.imageOfFruit, this.nameOfFruit, this.price});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fruits && nameOfFruit == other.nameOfFruit;

  @override
  int get hashCode => nameOfFruit.hashCode;
}
