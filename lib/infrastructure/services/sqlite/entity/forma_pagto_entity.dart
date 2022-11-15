import 'package:floor/floor.dart';

@Entity(
  tableName: 'forma_pagto',
)
class FormaPagtoEntity {
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'id')
  int? id;
  @ColumnInfo(name: 'descricao')
  String? descricao;
  @ColumnInfo(name: 'cod_sefaz')
  int? codSefaz;

  FormaPagtoEntity({
    this.id,
    this.descricao,
    this.codSefaz,
  });

  factory FormaPagtoEntity.fromJson(Map<String, dynamic> json) => FormaPagtoEntity(
        id: json['id'],
        descricao: json['descricao'],
        codSefaz: json['cod_sefaz'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'descricao': descricao,
        'cod_sefaz': codSefaz,
      };
}
