import 'package:cloud_firestore/cloud_firestore.dart';

class OpsModel {
  int id;
  int orderpcp;
  DocumentReference reference;
  int orcamento;
  String cliente;
  String servico;
  int quant;
  double valor;
  DateTime entrada;
  DateTime entrega;
  DateTime entregaprog;
  String vendedor;
  DateTime produzido;
  DateTime entregue;
  bool cancelada;
  String obs;
  int op;
  DateTime impressao;
  bool ryobi;
  bool sm2c;
  bool sm4c;
  bool flexo;
  DateTime corte;
  bool cvm1;
  bool cvm2;
  bool cva;
  DateTime laminacao;
  bool lam1;
  DateTime colagem;
  bool coa;
  bool com;
  DateTime acabamento;
  bool acm;

  OpsModel({
    this.id,
    this.orderpcp,
    this.reference,
    this.orcamento,
    this.cliente,
    this.servico,
    this.quant,
    this.valor,
    this.entrada,
    this.entrega,
    this.entregaprog,
    this.vendedor,
    this.produzido,
    this.entregue,
    this.cancelada = false,
    this.obs,
    this.op,
    this.impressao,
    this.ryobi = false,
    this.sm2c = false,
    this.sm4c = false,
    this.flexo = false,
    this.corte,
    this.cvm1 = false,
    this.cvm2 = false,
    this.cva = false,
    this.laminacao,
    this.lam1 = false,
    this.colagem,
    this.coa = false,
    this.com = false,
    this.acabamento,
    this.acm = false,
  });

  factory OpsModel.fromJson(Map doc) {
    return OpsModel(
      id: doc['id'],
      orderpcp: doc['orderpcp'],
      orcamento: doc['orcamento'],
      cliente: doc['cliente'],
      servico: doc['servico'],
      quant: doc['quant'],
      valor: doc['valor'],
      entrada: doc['entrada'] == null
          ? doc['entrada']
          : DateTime.parse(doc['entrada']),
      entrega: doc['entrega'] == null
          ? doc['entrega']
          : DateTime.parse(doc['entrega']),
      entregaprog: doc['entregaprog'] == null
          ? doc['entregaprog']
          : DateTime.parse(doc['entregaprog']),
      vendedor: doc['vendedor'],
      produzido: doc['produzido'] == null
          ? doc['produzido']
          : DateTime.parse(doc['produzido']),
      entregue: doc['entregue'] == null
          ? doc['entregue']
          : DateTime.parse(doc['entregue']),
      cancelada: doc['cancelada'],
      obs: doc['obs'],
      op: doc['op'],
      impressao: doc['impressao'] == null
          ? doc['impressao']
          : DateTime.parse(doc['impressao']),
      ryobi: doc['ryobi'],
      sm2c: doc['sm2c'],
      sm4c: doc['sm4c'],
      flexo: doc['flexo'],
      corte: doc['corte'] == null
          ? doc['corte']
          : DateTime.parse(doc['corte']),
      cvm1: doc['cvm1'],
      cvm2: doc['cvm2'],
      cva: doc['cva'],
      laminacao: doc['laminacao'] == null
          ? doc['laminacao']
          : DateTime.parse(doc['laminacao']),
      lam1: doc['lam1'],
      colagem: doc['colagem'] == null
          ? doc['colagem']
          : DateTime.parse(doc['colagem']),
      coa: doc['coa'],
      com: doc['com'],
      acabamento: doc['acabamento'] == null
          ? doc['acabamento']
          : DateTime.parse(doc['acabamento']),
      acm: doc['acm'],
    );
  }

//  OpsModel.fromJson(Map json) {
//    id = json['id'];
//    orcamento = json['orcamento'];
//    cliente = json['cliente'];
//    servico = json['servico'];
//    quant = json['quant'];
//    valor = json['valor'];
//    entrada = json['entrada'] == null
//        ? json['entrada']
//        : DateTime.fromMillisecondsSinceEpoch(
//      json['entrada'].seconds * 1000,
//    );
//    entrega = json['entrega'] == null
//        ? json['entrega']
//        : DateTime.fromMillisecondsSinceEpoch(
//      json['entrega'].seconds * 1000,
//    );
//    vendedor = json['vendedor'];
//    produzido = json['produzido'] == null
//        ? json['produzido']
//        : DateTime.fromMillisecondsSinceEpoch(
//      json['produzido'].seconds * 1000,
//    );
//    entregue = json['entregue'] == null
//        ? json['entregue']
//        : DateTime.fromMillisecondsSinceEpoch(
//      json['entregue'].seconds * 1000,
//    );
//    cancelada = json['cancelada'];
//    obs = json['obs'];
//    op = json['op'];
//    impressao = json['impressao'] == null
//        ? json['impressao']
//        : DateTime.fromMillisecondsSinceEpoch(
//      json['impressao'].seconds * 1000,
//    );
//    ryobi = json['ryobi'];
//    sm2c = json['sm2c'];
//    sm4c = json['sm4c'];
//    flexo = json['flexo'];
//    corte = json['corte'] == null
//        ? json['corte']
//        : DateTime.fromMillisecondsSinceEpoch(
//      json['corte'].seconds * 1000,
//    );
//    cvm1 = json['cvm1'];
//    cvm2 = json['cvm2'];
//    cva = json['cva'];
//    laminacao = json['laminacao'] == null
//        ? json['laminacao']
//        : DateTime.fromMillisecondsSinceEpoch(
//      json['laminacao'].seconds * 1000,
//    );
//    lam1 = json['lam1'];
//    colagem = json['colagem'] == null
//        ? json['colagem']
//        : DateTime.fromMillisecondsSinceEpoch(
//      json['colagem'].seconds * 1000,
//    );
//    coa = json['coa'];
//    com = json['com'];
//    acabamento = json['acabamento'] == null
//        ? json['acabamento']
//        : DateTime.fromMillisecondsSinceEpoch(
//      json['acabamento'].seconds * 1000,
//    );
//    acm = json['acm'];
//  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['reference'] = this.reference;
//    data['orcamento'] = this.orcamento;
//    data['cliente'] = this.cliente;
//    data['servico'] = this.servico;
//    data['quant'] = this.quant;
//    data['valor'] = this.valor;
//    data['entrada'] = this.entrada;
//    data['entrega'] = this.entrega;
//    data['vendedor'] = this.vendedor;
//    data['produzido'] = this.produzido;
//    data['entregue'] = this.entregue;
//    data['cancelada'] = this.cancelada;
//    data['obs'] = this.obs;
//    data['op'] = this.op;
//    return data;
//  }

  factory OpsModel.fromDocument(DocumentSnapshot doc) {
    return OpsModel(
      reference: doc.reference,
      orcamento: doc['orcamento'],
      cliente: doc['cliente'],
      servico: doc['servico'],
      quant: doc['quant'],
      valor: doc['valor'],
      entrada: doc['entrada'] == null
          ? doc['entrada']
          : DateTime.fromMillisecondsSinceEpoch(
              doc['entrada'].seconds * 1000,
            ),
      entrega: doc['entrega'] == null
          ? doc['entrega']
          : DateTime.fromMillisecondsSinceEpoch(
              doc['entrega'].seconds * 1000,
            ),
      vendedor: doc['vendedor'],
      produzido: doc['produzido'] == null
          ? doc['produzido']
          : DateTime.fromMillisecondsSinceEpoch(
              doc['produzido'].seconds * 1000,
            ),
      entregue: doc['entregue'] == null
          ? doc['entregue']
          : DateTime.fromMillisecondsSinceEpoch(
              doc['entregue'].seconds * 1000,
            ),
      cancelada: doc['cancelada'],
      obs: doc['obs'],
      op: doc['op'],
      impressao: doc['impressao'] == null
          ? doc['impressao']
          : DateTime.fromMillisecondsSinceEpoch(
              doc['impressao'].seconds * 1000,
            ),
      ryobi: doc['ryobi'],
      sm2c: doc['sm2c'],
      sm4c: doc['sm4c'],
      flexo: doc['flexo'],
      corte: doc['corte'] == null
          ? doc['corte']
          : DateTime.fromMillisecondsSinceEpoch(
              doc['corte'].seconds * 1000,
            ),
      cvm1: doc['cvm1'],
      cvm2: doc['cvm2'],
      cva: doc['cva'],
      laminacao: doc['laminacao'] == null
          ? doc['laminacao']
          : DateTime.fromMillisecondsSinceEpoch(
              doc['laminacao'].seconds * 1000,
            ),
      lam1: doc['lam1'],
      colagem: doc['colagem'] == null
          ? doc['colagem']
          : DateTime.fromMillisecondsSinceEpoch(
              doc['colagem'].seconds * 1000,
            ),
      coa: doc['coa'],
      com: doc['com'],
      acabamento: doc['acabamento'] == null
          ? doc['acabamento']
          : DateTime.fromMillisecondsSinceEpoch(
              doc['acabamento'].seconds * 1000,
            ),
      acm: doc['acm'],
    );
  }
}
