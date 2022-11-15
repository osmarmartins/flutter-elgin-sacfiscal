import 'package:floor/floor.dart';

@Entity(
  tableName: 'produto_grupo',
)
class ProdutosGrupoEntity {
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'id')
  int? id;
  @ColumnInfo(name: 'descricao')
  String? descricao;
  @ColumnInfo(name: 'color')
  String? color;

  ProdutosGrupoEntity({
    this.id,
    this.descricao,
    this.color,
  });

  factory ProdutosGrupoEntity.fromJson(Map<String, dynamic> json) => ProdutosGrupoEntity(
        id: json['id'],
        descricao: json['descricao'],
        color: json['color'],
      );

  Map<String, dynamic> toJson() => {
        'íd': id,
        'descricao': descricao,
        'color': color,
      };
}
