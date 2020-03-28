import 'package:cloud_firestore/cloud_firestore.dart';

class OpsModel {
  DocumentReference reference;
  int orcamento;
  String cliente;
  String servico;
  int quant;
  double valor;
  DateTime entrada;
  DateTime entrega;
  String vendedor;
  DateTime produzido;
  DateTime entregue;
  bool cancelada;
  String obs;
  int op;

  OpsModel(
      {this.reference,
        this.orcamento,
        this.cliente,
        this.servico,
        this.quant,
        this.valor,
        this.entrada,
        this.entrega,
        this.vendedor,
        this.produzido,
        this.entregue,
        this.cancelada = false,
        this.obs,
        this.op});

  OpsModel.fromJson(Map<String, dynamic> json) {
    orcamento = json['orcamento'];
    cliente = json['cliente'];
    servico = json['servico'];
    quant = json['quant'];
    valor = json['valor'];
    entrada = json['entrada'];
    entrega = json['entrega'];
    vendedor = json['vendedor'];
    produzido = json['produzido'];
    entregue = json['entregue'];
    cancelada = json['cancelada'];
    obs = json['obs'];
    op = json['op'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference'] = this.reference;
    data['orcamento'] = this.orcamento;
    data['cliente'] = this.cliente;
    data['servico'] = this.servico;
    data['quant'] = this.quant;
    data['valor'] = this.valor;
    data['entrada'] = this.entrada;
    data['entrega'] = this.entrega;
    data['vendedor'] = this.vendedor;
    data['produzido'] = this.produzido;
    data['entregue'] = this.entregue;
    data['cancelada'] = this.cancelada;
    data['obs'] = this.obs;
    data['op'] = this.op;
    return data;
  }

  factory OpsModel.fromDocument(DocumentSnapshot doc) {
    return OpsModel(
      reference: doc.reference,
      orcamento: doc['orcamento'],
      cliente: doc['cliente'],
      servico: doc['servico'],
      quant: doc['quant'],
      valor: doc['valor'],
      entrada: DateTime.fromMillisecondsSinceEpoch(doc['entrada'].seconds * 1000),
      entrega: DateTime.fromMillisecondsSinceEpoch(doc['entrega'].seconds * 1000),
      vendedor: doc['vendedor'],
      produzido: doc['produzido'],
      entregue: doc['entregue'],
      cancelada: doc['cancelada'],
      obs: doc['obs'],
      op: doc['op'],
    );
  }
}