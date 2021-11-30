class Recipe {
  String? title;
  String? url;

  Recipe({this.title, this.url});

  factory Recipe.fromJson(Map<String, dynamic> json) =>
      Recipe(title: json['title'], url: json['image']);
}
