import 'package:floor/floor.dart';

@Entity(
  tableName: 'venda_item',
)
class VendaItemEntity {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'id')
  int? id;
  @ColumnInfo(name: 'id_venda')
  int? idVenda;
  @ColumnInfo(name: 'cprod')
  String? cprod;
  @ColumnInfo(name: 'cean')
  String? cean;
  @ColumnInfo(name: 'xprod')
  String? xprod;
  @ColumnInfo(name: 'ncm')
  String? ncm;
  @ColumnInfo(name: 'cest')
  String? cest;
  @ColumnInfo(name: 'cfop')
  int? cfop;
  @ColumnInfo(name: 'ucom')
  String? ucom;
  @ColumnInfo(name: 'qcom')
  double? qcom;
  @ColumnInfo(name: 'vuncom')
  double? vuncom;
  @ColumnInfo(name: 'vprod')
  double? vprod;
  @ColumnInfo(name: 'ceantrib')
  String? ceantrib;
  @ColumnInfo(name: 'utrib')
  String? utrib;
  @ColumnInfo(name: 'vuntrib')
  double? vuntrib;
  @ColumnInfo(name: 'vfrete')
  double? vfrete;
  @ColumnInfo(name: 'vseg')
  double? vseg;
  @ColumnInfo(name: 'vdesc')
  double? vdesc;
  @ColumnInfo(name: 'voutro')
  double? voutro;
  @ColumnInfo(name: 'indtot')
  int? indtot;
  @ColumnInfo(name: 'orig')
  String? orig;
  @ColumnInfo(name: 'csticms')
  String? csticms;
  @ColumnInfo(name: 'modbc')
  int? modbc;
  @ColumnInfo(name: 'predbc')
  double? predbc;
  @ColumnInfo(name: 'vbcicms')
  double? vbcicms;
  @ColumnInfo(name: 'picms')
  double? picms;
  @ColumnInfo(name: 'vicms')
  double? vicms;
  @ColumnInfo(name: 'modbcst')
  int? modbcst;
  @ColumnInfo(name: 'pmvast')
  double? pmvast;
  @ColumnInfo(name: 'predbcst')
  double? predbcst;
  @ColumnInfo(name: 'vbcst')
  double? vbcst;
  @ColumnInfo(name: 'picmsst')
  double? picmsst;
  @ColumnInfo(name: 'vicmsst')
  double? vicmsst;
  @ColumnInfo(name: 'vbcstret')
  double? vbcstret;
  @ColumnInfo(name: 'vicmsstret')
  double? vicmsstret;
  @ColumnInfo(name: 'vbcstdest')
  double? vbcstdest;
  @ColumnInfo(name: 'vicmsstdest')
  double? vicmsstdest;
  @ColumnInfo(name: 'pbcop')
  double? pbcop;
  @ColumnInfo(name: 'pcredsn')
  double? pcredsn;
  @ColumnInfo(name: 'vcredicmssn')
  double? vcredicmssn;
  @ColumnInfo(name: 'vicmsdeson')
  double? vicmsdeson;
  @ColumnInfo(name: 'vicmsop')
  double? vicmsop;
  @ColumnInfo(name: 'pdif')
  double? pdif;
  @ColumnInfo(name: 'vicmsdif')
  double? vicmsdif;
  @ColumnInfo(name: 'vbcfcp')
  double? vbcfcp;
  @ColumnInfo(name: 'pfcp')
  double? pfcp;
  @ColumnInfo(name: 'vfcp')
  double? vfcp;
  @ColumnInfo(name: 'vbcfcpstret')
  double? vbcfcpstret;
  @ColumnInfo(name: 'pfcpstret')
  double? pfcpstret;
  @ColumnInfo(name: 'vfcpstret')
  double? vfcpstret;
  @ColumnInfo(name: 'pst')
  double? pst;
  @ColumnInfo(name: 'cenq')
  String? cenq;
  @ColumnInfo(name: 'cstipi')
  String? cstipi;
  @ColumnInfo(name: 'vbcipi')
  double? vbcipi;
  @ColumnInfo(name: 'pipi')
  double? pipi;
  @ColumnInfo(name: 'vipi')
  double? vipi;
  @ColumnInfo(name: 'qunid')
  double? qunid;
  @ColumnInfo(name: 'vunid')
  double? vunid;
  @ColumnInfo(name: 'cstpis')
  String? cstpis;
  @ColumnInfo(name: 'vbcpis')
  double? vbcpis;
  @ColumnInfo(name: 'ppis')
  double? ppis;
  @ColumnInfo(name: 'vpis')
  double? vpis;
  @ColumnInfo(name: 'qbcprodpis')
  double? qbcprodpis;
  @ColumnInfo(name: 'valiqprodpis')
  double? valiqprodpis;
  @ColumnInfo(name: 'cstcofins')
  String? cstcofins;
  @ColumnInfo(name: 'vbccofins')
  double? vbccofins;
  @ColumnInfo(name: 'pcofins')
  double? pcofins;
  @ColumnInfo(name: 'vcofins')
  double? vcofins;
  @ColumnInfo(name: 'qbcprodcofins')
  double? qbcprodcofins;
  @ColumnInfo(name: 'valiqprodcofins')
  double? valiqprodcofins;

  VendaItemEntity({
    this.id,
    this.idVenda,
    this.cprod,
    this.cean,
    this.xprod,
    this.ncm,
    this.cest,
    this.cfop,
    this.ucom,
    this.qcom,
    this.vuncom,
    this.vprod,
    this.ceantrib,
    this.utrib,
    this.vuntrib,
    this.vfrete,
    this.vseg,
    this.vdesc,
    this.voutro,
    this.indtot,
    this.orig,
    this.csticms,
    this.modbc,
    this.predbc,
    this.vbcicms,
    this.picms,
    this.vicms,
    this.modbcst,
    this.pmvast,
    this.predbcst,
    this.vbcst,
    this.picmsst,
    this.vicmsst,
    this.vbcstret,
    this.vicmsstret,
    this.vbcstdest,
    this.vicmsstdest,
    this.pbcop,
    this.pcredsn,
    this.vcredicmssn,
    this.vicmsdeson,
    this.vicmsop,
    this.pdif,
    this.vicmsdif,
    this.vbcfcp,
    this.pfcp,
    this.vfcp,
    this.vbcfcpstret,
    this.pfcpstret,
    this.vfcpstret,
    this.pst,
    this.cenq,
    this.cstipi,
    this.vbcipi,
    this.pipi,
    this.vipi,
    this.qunid,
    this.vunid,
    this.cstpis,
    this.vbcpis,
    this.ppis,
    this.vpis,
    this.qbcprodpis,
    this.valiqprodpis,
    this.cstcofins,
    this.vbccofins,
    this.pcofins,
    this.vcofins,
    this.qbcprodcofins,
    this.valiqprodcofins,
  });

  factory VendaItemEntity.fromJson(Map<String, dynamic> json) => VendaItemEntity(
        id: json['id'],
        idVenda: json['id_venda'],
        cprod: json['cprod'],
        cean: json['cean'],
        xprod: json['xprod'],
        ncm: json['ncm'],
        cest: json['cest'],
        cfop: json['cfop'],
        ucom: json['ucom'],
        qcom: json['qcom'].toDouble(),
        vuncom: json['vuncom'].toDouble(),
        vprod: json['vprod'].toDouble(),
        ceantrib: json['ceantrib'],
        utrib: json['utrib'],
        vuntrib: json['vuntrib'].toDouble(),
        vfrete: json['vfrete'].toDouble(),
        vseg: json['vseg'].toDouble(),
        vdesc: json['vdesc'].toDouble(),
        voutro: json['voutro'].toDouble(),
        indtot: json['indtot'],
        orig: json['orig'],
        csticms: json['csticms'],
        modbc: json['modbc'],
        predbc: json['predbc'].toDouble(),
        vbcicms: json['vbcicms'].toDouble(),
        picms: json['picms'].toDouble(),
        vicms: json['vicms'].toDouble(),
        modbcst: json['modbcst'],
        pmvast: json['pmvast'].toDouble(),
        predbcst: json['predbcst'].toDouble(),
        vbcst: json['vbcst'].toDouble(),
        picmsst: json['picmsst'].toDouble(),
        vicmsst: json['vicmsst'].toDouble(),
        vbcstret: json['vbcstret'].toDouble(),
        vicmsstret: json['vicmsstret'].toDouble(),
        vbcstdest: json['vbcstdest'].toDouble(),
        vicmsstdest: json['vicmsstdest'].toDouble(),
        pbcop: json['pbcop'].toDouble(),
        pcredsn: json['pcredsn'].toDouble(),
        vcredicmssn: json['vcredicmssn'].toDouble(),
        vicmsdeson: json['vicmsdeson'].toDouble(),
        vicmsop: json['vicmsop'].toDouble(),
        pdif: json['pdif'].toDouble(),
        vicmsdif: json['vicmsdif'].toDouble(),
        vbcfcp: json['vbcfcp'].toDouble(),
        pfcp: json['pfcp'].toDouble(),
        vfcp: json['vfcp'].toDouble(),
        vbcfcpstret: json['vbcfcpstret'].toDouble(),
        pfcpstret: json['pfcpstret'].toDouble(),
        vfcpstret: json['vfcpstret'].toDouble(),
        pst: json['pst'].toDouble(),
        cenq: json['cenq'],
        cstipi: json['cstipi'],
        vbcipi: json['vbcipi'].toDouble(),
        pipi: json['pipi'].toDouble(),
        vipi: json['vipi'].toDouble(),
        qunid: json['qunid'].toDouble(),
        vunid: json['vunid'].toDouble(),
        cstpis: json['cstpis'],
        vbcpis: json['vbcpis'].toDouble(),
        ppis: json['ppis'].toDouble(),
        vpis: json['vpis'].toDouble(),
        qbcprodpis: json['qbcprodpis'].toDouble(),
        valiqprodpis: json['valiqprodpis'].toDouble(),
        cstcofins: json['cstcofins'],
        vbccofins: json['vbccofins'].toDouble(),
        pcofins: json['pcofins'].toDouble(),
        vcofins: json['vcofins'].toDouble(),
        qbcprodcofins: json['qbcprodcofins'].toDouble(),
        valiqprodcofins: json['valiqprodcofins'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_venda': idVenda,
        'cprod': cprod,
        'cean': cean,
        'xprod': xprod,
        'ncm': ncm,
        'cest': cest,
        'cfop': cfop,
        'ucom': ucom,
        'qcom': qcom,
        'vuncom': vuncom,
        'vprod': vprod,
        'ceantrib': ceantrib,
        'utrib': utrib,
        'vuntrib': vuntrib,
        'vfrete': vfrete,
        'vseg': vseg,
        'vdesc': vdesc,
        'voutro': voutro,
        'indtot': indtot,
        'orig': orig,
        'csticms': csticms,
        'modbc': modbc,
        'predbc': predbc,
        'vbcicms': vbcicms,
        'picms': picms,
        'vicms': vicms,
        'modbcst': modbcst,
        'pmvast': pmvast,
        'predbcst': predbcst,
        'vbcst': vbcst,
        'picmsst': picmsst,
        'vicmsst': vicmsst,
        'vbcstret': vbcstret,
        'vicmsstret': vicmsstret,
        'vbcstdest': vbcstdest,
        'vicmsstdest': vicmsstdest,
        'pbcop': pbcop,
        'pcredsn': pcredsn,
        'vcredicmssn': vcredicmssn,
        'vicmsdeson': vicmsdeson,
        'vicmsop': vicmsop,
        'pdif': pdif,
        'vicmsdif': vicmsdif,
        'vbcfcp': vbcfcp,
        'pfcp': pfcp,
        'vfcp': vfcp,
        'vbcfcpstret': vbcfcpstret,
        'pfcpstret': pfcpstret,
        'vfcpstret': vfcpstret,
        'pst': pst,
        'cenq': cenq,
        'cstipi': cstipi,
        'vbcipi': vbcipi,
        'pipi': pipi,
        'vipi': vipi,
        'qunid': qunid,
        'vunid': vunid,
        'cstpis': cstpis,
        'vbcpis': vbcpis,
        'ppis': ppis,
        'vpis': vpis,
        'qbcprodpis': qbcprodpis,
        'valiqprodpis': valiqprodpis,
        'cstcofins': cstcofins,
        'vbccofins': vbccofins,
        'pcofins': pcofins,
        'vcofins': vcofins,
        'qbcprodcofins': qbcprodcofins,
        'valiqprodcofins': valiqprodcofins,
      };
}
