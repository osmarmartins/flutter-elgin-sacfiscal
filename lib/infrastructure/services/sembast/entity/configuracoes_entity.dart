class ConfigruacoesEntity {
  int? id;
  String? caixa;
  String? enderecoWebService;
  String? dataUltimoAcesso;
  String? dataUltimaSincronizacao;
  String? loginUsuario;
  bool? manterDadosLogin;
  bool? logado;
  Map<String, dynamic>? profile;
  String? nomeCaixa;
  bool? inicialDataLoaded;

  ConfigruacoesEntity({
    this.id,
    this.caixa = '01',
    this.enderecoWebService,
    this.dataUltimoAcesso,
    this.dataUltimaSincronizacao,
    this.loginUsuario,
    this.manterDadosLogin = false,
    this.logado = false,
    this.profile,
    this.nomeCaixa,
    this.inicialDataLoaded = false,
  });

  factory ConfigruacoesEntity.fromJson(Map<String, dynamic> json) => ConfigruacoesEntity(
        id: json['id'],
        caixa: json['caixa'],
        enderecoWebService: json['enderecoWebService'],
        dataUltimoAcesso: json['dataUltimoAcesso'],
        dataUltimaSincronizacao: json['dataUltimaSincronizacao'],
        loginUsuario: json['loginUsuario'],
        manterDadosLogin: json['manterDadosLogin'],
        logado: json['logado'],
        profile: json['profile'],
        nomeCaixa: json['nomeCaixa'],
        inicialDataLoaded: json['inicialDataLoaded'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'caixa': caixa,
        'enderecoWebService': enderecoWebService,
        'dataUltimoAcesso': dataUltimoAcesso,
        'dataUltimaSincronizacao': dataUltimaSincronizacao,
        'loginUsuario': loginUsuario,
        'manterDadosLogin': manterDadosLogin,
        'logado': logado,
        'profile': profile,
        'nomeCaixa': nomeCaixa,
        'inicialDataLoaded': inicialDataLoaded,
      };
}
