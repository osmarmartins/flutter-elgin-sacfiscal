import 'package:floor/floor.dart';

@Entity(
  tableName: 'usuario',
)
class UsuarioEntity {
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'id')
  int? id;
  @ColumnInfo(name: 'usuario')
  String? usuario;
  @ColumnInfo(name: 'senha')
  String? senha;

  UsuarioEntity({
    this.id,
    this.usuario,
    this.senha,
  });

  factory UsuarioEntity.fromJson(Map<String, dynamic> json) => UsuarioEntity(
        id: json['id'],
        usuario: json['usuario'],
        senha: json['senha'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'usuario': usuario,
        'senha': senha,
      };
}
