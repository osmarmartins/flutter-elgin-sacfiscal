import 'package:floor/floor.dart';

@Entity(
  tableName: 'produto',
)
class ProdutosEntity {
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'id')
  int? id;
  @ColumnInfo(name: 'descricao')
  String? descricao;
  @ColumnInfo(name: 'gtin')
  String? gtin;
  @ColumnInfo(name: 'un')
  String? un;
  @ColumnInfo(name: 'preco')
  double? preco;
  @ColumnInfo(name: 'ncm')
  String? ncm;
  @ColumnInfo(name: 'cest')
  String? cest;
  @ColumnInfo(name: 'cfop')
  String? cfop;
  @ColumnInfo(name: 'cst_icms')
  String? cstIcms;
  @ColumnInfo(name: 'origem')
  String? origem;
  @ColumnInfo(name: 'cst_pis')
  String? cstPis;
  @ColumnInfo(name: 'cst_cofins')
  String? cstCofins;
  @ColumnInfo(name: 'ibpt_federal')
  double? ibptFederal;
  @ColumnInfo(name: 'ibpt_estadual')
  double? ibptEstadual;
  @ColumnInfo(name: 'ibpt_municipal')
  double? ibptMunicipal;
  @ColumnInfo(name: 'aliq_icms')
  double? aliqIcms;
  @ColumnInfo(name: 'aliq_pis')
  double? aliqPis;
  @ColumnInfo(name: 'aliq_cofins')
  double? aliqCofins;
  @ColumnInfo(name: 'img')
  String? img;
  @ColumnInfo(name: 'grupo')
  String? grupo;

  ProdutosEntity({
    this.id,
    this.descricao,
    this.gtin,
    this.un,
    this.preco,
    this.ncm,
    this.cest,
    this.cfop,
    this.cstIcms,
    this.origem,
    this.cstPis,
    this.cstCofins,
    this.ibptFederal,
    this.ibptEstadual,
    this.ibptMunicipal,
    this.aliqIcms,
    this.aliqPis,
    this.aliqCofins,
    this.img,
    this.grupo,
  });

  factory ProdutosEntity.fromJson(Map<String, dynamic> json) => ProdutosEntity(
        id: json['id'],
        descricao: json['descricao'],
        gtin: json['gtin'],
        un: json['un'],
        preco: json['preco'],
        ncm: json['ncm'],
        cest: json['cest'],
        cfop: json['cfop'],
        cstIcms: json['cst_icms'],
        origem: json['origem'],
        cstPis: json['cst_pis'],
        cstCofins: json['cst_cofins'],
        ibptFederal: json['ibpt_federal'],
        ibptEstadual: json['ibpt_estadual'],
        ibptMunicipal: json['ibpt_municipal'],
        aliqIcms: json['aliq_icms'],
        aliqPis: json['aliq_pis'],
        aliqCofins: json['aliq_cofins'],
        img: json['img'],
        grupo: json['grupo'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'descricao': descricao,
        'gtin': gtin,
        'un': un,
        'preco': preco,
        'ncm': ncm,
        'cest': cest,
        'cfop': cfop,
        'cst_icms': cstIcms,
        'origem': origem,
        'cst_pis': cstPis,
        'cst_cofins': cstCofins,
        'ibpt_federal': ibptFederal,
        'ibpt_estadual': ibptEstadual,
        'ibpt_municipal': ibptMunicipal,
        'aliq_icms': aliqIcms,
        'aliq_pis': aliqPis,
        'aliq_cofins': aliqCofins,
        'img': img,
        'grupo': grupo,
      };
}
