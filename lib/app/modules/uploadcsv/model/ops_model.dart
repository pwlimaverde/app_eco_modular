import 'package:cloud_firestore/cloud_firestore.dart';

class OpsModel {
  DocumentReference reference;
  int orcamento;
  String cliente;
  String servico;
  int quant;
  double valor;
  String entrada;
  String entrega;
  String vendedor;
  bool produzido;
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
      this.produzido = false,
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
    data['op'] = this.op;
    return data;
  }

//  OpsModel.fromMap(Map<String, dynamic> map) {
//    orcamento = map['orcamento'];
//    cliente = map['cliente'];
//    servico = map['servico'];
//    quant = map['quant'];
//    valor = map['valor'];
//    entrada = map['entrada'];
//    entrega = map['entrega'];
//    vendedor = map['vendedor'];
//    produzido = map['produzido'];
//    op = map['op'];
//  }

  factory OpsModel.fromDocument(DocumentSnapshot doc) {
    return OpsModel(
      reference: doc.reference,
      orcamento: doc['orcamento'],
      cliente: doc['cliente'],
      servico: doc['servico'],
      quant: doc['quant'],
      valor: doc['valor'],
      entrada: doc['entrada'],
      entrega: doc['entrega'],
      vendedor: doc['vendedor'],
      produzido: doc['produzido'],
      op: doc['op'],
    );
  }
}
