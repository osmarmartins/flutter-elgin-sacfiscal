import 'package:floor/floor.dart';

@Entity(
  tableName: 'venda',
)
class VendaEntity {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'id')
  int? id;
  @ColumnInfo(name: 'cuf')
  int? cuf;
  @ColumnInfo(name: 'cnf')
  int? cnf;
  @ColumnInfo(name: 'natope')
  String? natope;
  @ColumnInfo(name: 'modelo')
  int? modelo;
  @ColumnInfo(name: 'serie')
  int? serie;
  @ColumnInfo(name: 'nnf')
  int? nnf;
  @ColumnInfo(name: 'dhemi')
  String? dhemi;
  @ColumnInfo(name: 'dhsaient')
  String? dhsaient;
  @ColumnInfo(name: 'tpnf')
  int? tpnf;
  @ColumnInfo(name: 'iddest')
  int? iddest;
  @ColumnInfo(name: 'cmunfg')
  String? cmunfg;
  @ColumnInfo(name: 'tpimp')
  int? tpimp;
  @ColumnInfo(name: 'tpemis')
  int? tpemis;
  @ColumnInfo(name: 'cdv')
  int? cdv;
  @ColumnInfo(name: 'tpamb')
  int? tpamb;
  @ColumnInfo(name: 'finnfe')
  int? finnfe;
  @ColumnInfo(name: 'indfinal')
  int? indfinal;
  @ColumnInfo(name: 'indpres')
  int? indpres;
  @ColumnInfo(name: 'procemi')
  int? procemi;
  @ColumnInfo(name: 'verproc')
  String? verproc;
  @ColumnInfo(name: 'dhcont')
  String? dhcont;
  @ColumnInfo(name: 'xjust')
  String? xjust;
  @ColumnInfo(name: 'cnpjemi')
  String? cnpjemi;
  @ColumnInfo(name: 'xnomeemi')
  String? xnomeemi;
  @ColumnInfo(name: 'xfant')
  String? xfant;
  @ColumnInfo(name: 'xlgremi')
  String? xlgremi;
  @ColumnInfo(name: 'nroemi')
  String? nroemi;
  @ColumnInfo(name: 'xcplemi')
  String? xcplemi;
  @ColumnInfo(name: 'xbairroemi')
  String? xbairroemi;
  @ColumnInfo(name: 'cmunemi')
  String? cmunemi;
  @ColumnInfo(name: 'xmunemi')
  String? xmunemi;
  @ColumnInfo(name: 'ufemi')
  String? ufemi;
  @ColumnInfo(name: 'cepemi')
  String? cepemi;
  @ColumnInfo(name: 'cpaisemi')
  String? cpaisemi;
  @ColumnInfo(name: 'xpaisemi')
  String? xpaisemi;
  @ColumnInfo(name: 'foneemi')
  String? foneemi;
  @ColumnInfo(name: 'ieemi')
  String? ieemi;
  @ColumnInfo(name: 'iest')
  String? iest;
  @ColumnInfo(name: 'imemi')
  String? imemi;
  @ColumnInfo(name: 'cnae')
  String? cnae;
  @ColumnInfo(name: 'crt')
  String? crt;
  @ColumnInfo(name: 'cnpjdest')
  String? cnpjdest;
  @ColumnInfo(name: 'cpfdest')
  String? cpfdest;
  @ColumnInfo(name: 'xlgrdest')
  String? xlgrdest;
  @ColumnInfo(name: 'nrodest')
  String? nrodest;
  @ColumnInfo(name: 'xcpldest')
  String? xcpldest;
  @ColumnInfo(name: 'xbairrodest')
  String? xbairrodest;
  @ColumnInfo(name: 'cmundest')
  String? cmundest;
  @ColumnInfo(name: 'xmundest')
  String? xmundest;
  @ColumnInfo(name: 'ufdest')
  String? ufdest;
  @ColumnInfo(name: 'cepdest')
  String? cepdest;
  @ColumnInfo(name: 'cpaisdest')
  String? cpaisdest;
  @ColumnInfo(name: 'xpaisdest')
  String? xpaisdest;
  @ColumnInfo(name: 'fonedest')
  String? fonedest;
  @ColumnInfo(name: 'indiedest')
  String? indiedest;
  @ColumnInfo(name: 'iedest')
  String? iedest;
  @ColumnInfo(name: 'isuf')
  String? isuf;
  @ColumnInfo(name: 'imdest')
  String? imdest;
  @ColumnInfo(name: 'email')
  String? email;
  @ColumnInfo(name: 'vbc')
  double? vbc;
  @ColumnInfo(name: 'vicms')
  double? vicms;
  @ColumnInfo(name: 'vbcst')
  double? vbcst;
  @ColumnInfo(name: 'vst')
  double? vst;
  @ColumnInfo(name: 'vprod')
  double? vprod;
  @ColumnInfo(name: 'vfrete')
  double? vfrete;
  @ColumnInfo(name: 'vseg')
  double? vseg;
  @ColumnInfo(name: 'vdesc')
  double? vdesc;
  @ColumnInfo(name: 'vii')
  double? vii;
  @ColumnInfo(name: 'vipi')
  double? vipi;
  @ColumnInfo(name: 'vpis')
  double? vpis;
  @ColumnInfo(name: 'vcofins')
  double? vcofins;
  @ColumnInfo(name: 'voutro')
  double? voutro;
  @ColumnInfo(name: 'vnf')
  double? vnf;
  @ColumnInfo(name: 'vtottrib')
  double? vtottrib;
  @ColumnInfo(name: 'vicmsdeson')
  double? vicmsdeson;
  @ColumnInfo(name: 'vicmsufdestopc')
  double? vicmsufdestopc;
  @ColumnInfo(name: 'vicmsufremet')
  double? vicmsufremet;
  @ColumnInfo(name: 'vfcpufdestopc')
  double? vfcpufdestopc;
  @ColumnInfo(name: 'vfcp')
  double? vfcp;
  @ColumnInfo(name: 'vfcpst')
  double? vfcpst;
  @ColumnInfo(name: 'vfcpstret')
  double? vfcpstret;
  @ColumnInfo(name: 'vipidevol')
  double? vipidevol;
  @ColumnInfo(name: 'modfrete')
  String? modfrete;
  @ColumnInfo(name: 'cnpjtransp')
  String? cnpjtransp;
  @ColumnInfo(name: 'cpftransp')
  String? cpftransp;
  @ColumnInfo(name: 'xnometransp')
  String? xnometransp;
  @ColumnInfo(name: 'ietransp')
  String? ietransp;
  @ColumnInfo(name: 'xender')
  String? xender;
  @ColumnInfo(name: 'xmuntransp')
  String? xmuntransp;
  @ColumnInfo(name: 'uftransp')
  String? uftransp;
  @ColumnInfo(name: 'infadfisco')
  String? infadfisco;
  @ColumnInfo(name: 'infcpl')
  String? infcpl;
  @ColumnInfo(name: 'nfat')
  String? nfat;
  @ColumnInfo(name: 'vorig')
  double? vorig;
  @ColumnInfo(name: 'vdescfatura')
  double? vdescfatura;
  @ColumnInfo(name: 'vliq')
  double? vliq;
  @ColumnInfo(name: 'versao')
  String? versao;
  @ColumnInfo(name: 'chavenf')
  String? chavenf;
  @ColumnInfo(name: 'statusnfe')
  String? statusnfe;

  // Future<int> get totalItensVenda async {
  //   List<Map> ultimoID = await Get.find<SQLiteConnection>()
  //       .database
  //       .rawQuery('select count(*) as totalItens from venda_item where id = $id');
  //   return ultimoID.first['totalItens'] ?? 0;
  // }

  VendaEntity({
    this.id,
    this.cuf,
    this.cnf,
    this.natope,
    this.modelo,
    this.serie,
    this.nnf,
    this.dhemi,
    this.dhsaient,
    this.tpnf,
    this.iddest,
    this.cmunfg,
    this.tpimp,
    this.tpemis,
    this.cdv,
    this.tpamb,
    this.finnfe,
    this.indfinal,
    this.indpres,
    this.procemi,
    this.verproc,
    this.dhcont,
    this.xjust,
    this.cnpjemi,
    this.xnomeemi,
    this.xfant,
    this.xlgremi,
    this.nroemi,
    this.xcplemi,
    this.xbairroemi,
    this.cmunemi,
    this.xmunemi,
    this.ufemi,
    this.cepemi,
    this.cpaisemi,
    this.xpaisemi,
    this.foneemi,
    this.ieemi,
    this.iest,
    this.imemi,
    this.cnae,
    this.crt,
    this.cnpjdest,
    this.cpfdest,
    this.xlgrdest,
    this.nrodest,
    this.xcpldest,
    this.xbairrodest,
    this.cmundest,
    this.xmundest,
    this.ufdest,
    this.cepdest,
    this.cpaisdest,
    this.xpaisdest,
    this.fonedest,
    this.indiedest,
    this.iedest,
    this.isuf,
    this.imdest,
    this.email,
    this.vbc,
    this.vicms,
    this.vbcst,
    this.vst,
    this.vprod,
    this.vfrete,
    this.vseg,
    this.vdesc,
    this.vii,
    this.vipi,
    this.vpis,
    this.vcofins,
    this.voutro,
    this.vnf,
    this.vtottrib,
    this.vicmsdeson,
    this.vicmsufdestopc,
    this.vicmsufremet,
    this.vfcpufdestopc,
    this.vfcp,
    this.vfcpst,
    this.vfcpstret,
    this.vipidevol,
    this.modfrete,
    this.cnpjtransp,
    this.cpftransp,
    this.xnometransp,
    this.ietransp,
    this.xender,
    this.xmuntransp,
    this.uftransp,
    this.infadfisco,
    this.infcpl,
    this.nfat,
    this.vorig,
    this.vdescfatura,
    this.vliq,
    this.versao,
    this.chavenf,
    this.statusnfe,
  });

  factory VendaEntity.fromJson(Map<String, dynamic> json) => VendaEntity(
        id: json['id'],
        cuf: json['cuf'],
        cnf: json['cnf'],
        natope: json['natope'],
        modelo: json['modelo'],
        serie: json['serie'],
        nnf: json['nnf'],
        dhemi: json['dhemi'],
        dhsaient: json['dhsaient'],
        tpnf: json['tpnf'],
        iddest: json['iddest'],
        cmunfg: json['cmunfg'],
        tpimp: json['tpimp'],
        tpemis: json['tpemis'],
        cdv: json['cdv'],
        tpamb: json['tpamb'],
        finnfe: json['finnfe'],
        indfinal: json['indfinal'],
        indpres: json['indpres'],
        procemi: json['procemi'],
        verproc: json['verproc'],
        dhcont: json['dhcont'],
        xjust: json['xjust'],
        cnpjemi: json['cnpjemi'],
        xnomeemi: json['xnomeemi'],
        xfant: json['xfant'],
        xlgremi: json['xlgremi'],
        nroemi: json['nroemi'],
        xcplemi: json['xcplemi'],
        xbairroemi: json['xbairroemi'],
        cmunemi: json['cmunemi'],
        xmunemi: json['xmunemi'],
        ufemi: json['ufemi'],
        cepemi: json['cepemi'],
        cpaisemi: json['cpaisemi'],
        xpaisemi: json['xpaisemi'],
        foneemi: json['foneemi'],
        ieemi: json['ieemi'],
        iest: json['iest'],
        imemi: json['imemi'],
        cnae: json['cnae'],
        crt: json['crt'],
        cnpjdest: json['cnpjdest'],
        cpfdest: json['cpfdest'],
        xlgrdest: json['xlgrdest'],
        nrodest: json['nrodest'],
        xcpldest: json['xcpldest'],
        xbairrodest: json['xbairrodest'],
        cmundest: json['cmundest'],
        xmundest: json['xmundest'],
        ufdest: json['ufdest'],
        cepdest: json['cepdest'],
        cpaisdest: json['cpaisdest'],
        xpaisdest: json['xpaisdest'],
        fonedest: json['fonedest'],
        indiedest: json['indiedest'],
        iedest: json['iedest'],
        isuf: json['isuf'],
        imdest: json['imdest'],
        email: json['email'],
        vbc: json['vbc'],
        vicms: json['vicms'],
        vbcst: json['vbcst'],
        vst: json['vst'],
        vprod: json['vprod'],
        vfrete: json['vfrete'],
        vseg: json['vseg'],
        vdesc: json['vdesc'],
        vii: json['vii'],
        vipi: json['vipi'],
        vpis: json['vpis'],
        vcofins: json['vcofins'],
        voutro: json['voutro'],
        vnf: json['vnf'],
        vtottrib: json['vtottrib'],
        vicmsdeson: json['vicmsdeson'],
        vicmsufdestopc: json['vicmsufdestopc'],
        vicmsufremet: json['vicmsufremet'],
        vfcpufdestopc: json['vfcpufdestopc'],
        vfcp: json['vfcp'],
        vfcpst: json['vfcpst'],
        vfcpstret: json['vfcpstret'],
        vipidevol: json['vipidevol'],
        modfrete: json['modfrete'],
        cnpjtransp: json['cnpjtransp'],
        cpftransp: json['cpftransp'],
        xnometransp: json['xnometransp'],
        ietransp: json['ietransp'],
        xender: json['xender'],
        xmuntransp: json['xmuntransp'],
        uftransp: json['uftransp'],
        infadfisco: json['infadfisco'],
        infcpl: json['infcpl'],
        nfat: json['nfat'],
        vorig: json['vorig'],
        vdescfatura: json['vdescfatura'],
        vliq: json['vliq'],
        versao: json['versao'],
        chavenf: json['chavenf'],
        statusnfe: json['statusnfe'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'cuf': cuf,
        'cnf': cnf,
        'natope': natope,
        'modelo': modelo,
        'serie': serie,
        'nnf': nnf,
        'dhemi': dhemi,
        'dhsaient': dhsaient,
        'tpnf': tpnf,
        'iddest': iddest,
        'cmunfg': cmunfg,
        'tpimp': tpimp,
        'tpemis': tpemis,
        'cdv': cdv,
        'tpamb': tpamb,
        'finnfe': finnfe,
        'indfinal': indfinal,
        'indpres': indpres,
        'procemi': procemi,
        'verproc': verproc,
        'dhcont': dhcont,
        'xjust': xjust,
        'cnpjemi': cnpjemi,
        'xnomeemi': xnomeemi,
        'xfant': xfant,
        'xlgremi': xlgremi,
        'nroemi': nroemi,
        'xcplemi': xcplemi,
        'xbairroemi': xbairroemi,
        'cmunemi': cmunemi,
        'xmunemi': xmunemi,
        'ufemi': ufemi,
        'cepemi': cepemi,
        'cpaisemi': cpaisemi,
        'xpaisemi': xpaisemi,
        'foneemi': foneemi,
        'ieemi': ieemi,
        'iest': iest,
        'imemi': imemi,
        'cnae': cnae,
        'crt': crt,
        'cnpjdest': cnpjdest,
        'cpfdest': cpfdest,
        'xlgrdest': xlgrdest,
        'nrodest': nrodest,
        'xcpldest': xcpldest,
        'xbairrodest': xbairrodest,
        'cmundest': cmundest,
        'xmundest': xmundest,
        'ufdest': ufdest,
        'cepdest': cepdest,
        'cpaisdest': cpaisdest,
        'xpaisdest': xpaisdest,
        'fonedest': fonedest,
        'indiedest': indiedest,
        'iedest': iedest,
        'isuf': isuf,
        'imdest': imdest,
        'email': email,
        'vbc': vbc,
        'vicms': vicms,
        'vbcst': vbcst,
        'vst': vst,
        'vprod': vprod,
        'vfrete': vfrete,
        'vseg': vseg,
        'vdesc': vdesc,
        'vii': vii,
        'vipi': vipi,
        'vpis': vpis,
        'vcofins': vcofins,
        'voutro': voutro,
        'vnf': vnf,
        'vtottrib': vtottrib,
        'vicmsdeson': vicmsdeson,
        'vicmsufdestopc': vicmsufdestopc,
        'vicmsufremet': vicmsufremet,
        'vfcpufdestopc': vfcpufdestopc,
        'vfcp': vfcp,
        'vfcpst': vfcpst,
        'vfcpstret': vfcpstret,
        'vipidevol': vipidevol,
        'modfrete': modfrete,
        'cnpjtransp': cnpjtransp,
        'cpftransp': cpftransp,
        'xnometransp': xnometransp,
        'ietransp': ietransp,
        'xender': xender,
        'xmuntransp': xmuntransp,
        'uftransp': uftransp,
        'infadfisco': infadfisco,
        'infcpl': infcpl,
        'nfat': nfat,
        'vorig': vorig,
        'vdescfatura': vdescfatura,
        'vliq': vliq,
        'versao': versao,
        'chavenf': chavenf,
        'statusnfe': statusnfe,
      };
}
