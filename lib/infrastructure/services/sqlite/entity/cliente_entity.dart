import 'package:floor/floor.dart';

@Entity(
  tableName: 'cliente',
)
class ClienteEntity {
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'id')
  int? id;
  @ColumnInfo(name: 'nome')
  String? nome;
  @ColumnInfo(name: 'cnpjcpf')
  String? cnpjCpf;

  ClienteEntity({
    this.id,
    this.nome,
    this.cnpjCpf,
  });

  factory ClienteEntity.fromJson(Map<String, dynamic> json) => ClienteEntity(
        id: json['id'],
        nome: json['nome'],
        cnpjCpf: json['cnpjcpf'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'cnpjcpf': cnpjCpf,
      };
}
