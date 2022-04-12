class object_item {
  String? name;
  String? tipo;
  String? senha;

  object_item({this.name, this.tipo, this.senha});

  object_item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tipo = json['tipo'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['tipo'] = this.tipo;
    data['senha'] = this.senha;
    return data;
  }
}
