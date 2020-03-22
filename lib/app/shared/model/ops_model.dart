class OpsModel {
    int id;
    int orcamento;
    String cliente;
    String servico;
    String quant;
    String valor;
    String entrada;
    String vendedor;
    int op;

    OpsModel(
        {this.id,
            this.orcamento,
            this.cliente,
            this.servico,
            this.quant,
            this.valor,
            this.entrada,
            this.vendedor,
            this.op});

    OpsModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        orcamento = json['orcamento'];
        cliente = json['cliente'];
        servico = json['servico'];
        quant = json['quant'];
        valor = json['valor'];
        entrada = json['entrada'];
        vendedor = json['vendedor'];
        op = json['op'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['orcamento'] = this.orcamento;
        data['cliente'] = this.cliente;
        data['servico'] = this.servico;
        data['quant'] = this.quant;
        data['valor'] = this.valor;
        data['entrada'] = this.entrada;
        data['vendedor'] = this.vendedor;
        data['op'] = this.op;
        return data;
    }
}