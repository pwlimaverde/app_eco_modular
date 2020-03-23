import 'package:firebase/firestore.dart';

class OpsModel {
  final DocumentReference reference;
  int orcamento;
  String cliente;
  String servico;
  int quant;
  int valor;
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
      this.produzido,
      this.op});

//  OpsModel.fromJson(Map<String, dynamic> json) {
//    reference = json['reference'];
//    orcamento = json['orcamento'];
//    cliente = json['cliente'];
//    servico = json['servico'];
//    quant = json['quant'];
//    valor = json['valor'];
//    entrada = json['entrada'];
//    entrega = json['entrega'];
//    vendedor = json['vendedor'];
//    op = json['op'];
//  }

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
//    reference = map['reference'];
//    orcamento = map['orcamento'];
//    cliente = map['cliente'];
//    servico = map['servico'];
//    quant = map['quant'];
//    valor = map['valor'];
//    entrada = map['entrada'];
//    entrega = map['entrega'];
//    vendedor = map['vendedor'];
//    op = map['op'];
//  }

  factory OpsModel.fromDocument(DocumentSnapshot doc) {
    return OpsModel(
      reference: doc.ref,
      orcamento: doc.data()['orcamento'],
      cliente: doc.data()['cliente'],
      servico: doc.data()['servico'],
      quant: doc.data()['quant'],
      valor: doc.data()['valor'],
      entrada: doc.data()['entrada'],
      entrega: doc.data()['entrega'],
      vendedor: doc.data()['vendedor'],
      produzido: doc.data()['produzido'],
      op: doc.data()['op'],
    );
  }
}
