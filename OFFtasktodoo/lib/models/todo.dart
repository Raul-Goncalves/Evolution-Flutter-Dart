class Todo{

  Todo({required this.titulo , required this.dia});

  Todo.fromJson(Map<String, dynamic> json)
      : titulo = json['title'],
        dia = DateTime.parse(json['datetime']);

  String titulo;
  DateTime dia;

  Map<String, dynamic> toJson(){
    return{
      'title': titulo,
      'datetime' : dia.toIso8601String(),
    };
  }

}


