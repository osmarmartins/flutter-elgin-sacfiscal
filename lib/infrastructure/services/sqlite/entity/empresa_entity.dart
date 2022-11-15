import 'package:floor/floor.dart';

@Entity(
  tableName: 'empresa',
)
class EmpresaEntity {
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'id')
  int? id;
  @ColumnInfo(name: 'nome')
  String? nome;
  @ColumnInfo(name: 'cnpj')
  String? cnpj;
  @ColumnInfo(name: 'ie')
  String? ie;
  @ColumnInfo(name: 'logradouro')
  String? logradouro;
  @ColumnInfo(name: 'numero')
  String? numero;
  @ColumnInfo(name: 'bairro')
  String? bairro;
  @ColumnInfo(name: 'cidade')
  String? cidade;
  @ColumnInfo(name: 'uf')
  String? uf;
  @ColumnInfo(name: 'ibge')
  String? ibge;
  @ColumnInfo(name: 'cep')
  String? cep;
  @ColumnInfo(name: 'crt')
  int? crt;
  @ColumnInfo(name: 'forma_emissao')
  int? formaEmissao;
  @ColumnInfo(name: 'serie')
  String? serie;
  @ColumnInfo(name: 'ultimo_doc')
  int? ultimoDoc;

  EmpresaEntity({
    this.id,
    this.nome,
    this.cnpj,
    this.ie,
    this.logradouro,
    this.numero,
    this.bairro,
    this.cidade,
    this.uf,
    this.ibge,
    this.cep,
    this.crt,
    this.formaEmissao,
    this.serie,
    this.ultimoDoc,
  });

  factory EmpresaEntity.fromJson(Map<String, dynamic> json) => EmpresaEntity(
        id: json['id'],
        nome: json['nome'],
        cnpj: json['cnpj'],
        ie: json['ie'],
        logradouro: json['logradouro'],
        numero: json['numero'],
        bairro: json['bairro'],
        cidade: json['cidade'],
        uf: json['uf'],
        ibge: json['ibge'],
        cep: json['cep'],
        crt: json['crt'],
        formaEmissao: json['forma_emissao'],
        serie: json['serie'],
        ultimoDoc: json['ultimo_doc'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'cnpj': cnpj,
        'ie': ie,
        'logradouro': logradouro,
        'numero': numero,
        'bairro': bairro,
        'cidade': cidade,
        'uf': uf,
        'ibge': ibge,
        'cep': cep,
        'crt': crt,
        'forma_emissao': formaEmissao,
        'serie': serie,
        'ultimo_doc': ultimoDoc,
      };
}
