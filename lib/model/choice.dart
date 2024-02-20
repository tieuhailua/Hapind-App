class Choice {
  int? id;
  String? name;

  Choice({
    this.id,
    this.name,
  });

  Choice.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
