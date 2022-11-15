import 'package:floor/floor.dart';

@Entity(
  tableName: 'caixa',
)
class CaixaEntity {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'id')
  int? id;
  @ColumnInfo(name: 'terminal')
  String? terminal;
  @ColumnInfo(name: 'abertura')
  String? abertura;
  @ColumnInfo(name: 'valor_abertura')
  double? valorAbertura;
  @ColumnInfo(name: 'id_usuario')
  int? idUsuario;
  @ColumnInfo(name: 'fechamento')
  String? fechamento;
  @ColumnInfo(name: 'valor_fechamento')
  double? valorFechamento;
  @ColumnInfo(name: 'diferenca')
  double? diferenca;

  CaixaEntity({
    this.id,
    this.terminal,
    this.abertura,
    this.valorAbertura = 0.0,
    this.idUsuario,
    this.fechamento,
    this.valorFechamento = 0.0,
    this.diferenca,
  });

  factory CaixaEntity.fromMap(Map<String, dynamic> json) => CaixaEntity(
        id: json['id'],
        terminal: json['terminal'],
        abertura: json['abertura'],
        valorAbertura: json['valor_abertura'].toDouble(),
        idUsuario: json['id_usuario'],
        fechamento: json['fechamento'],
        valorFechamento: json['valor_fechamento'].toDouble(),
        diferenca: json['diferenca'].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'terminal': terminal,
        'abertura': abertura,
        'valor_abertura': valorAbertura,
        'id_usuario': idUsuario,
        'fechamento': fechamento,
        'valor_fechamento': valorFechamento,
        'diferenca': diferenca,
      };
}
