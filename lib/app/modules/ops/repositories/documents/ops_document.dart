const String opsAllQuery = """
query{
  ops(order_by: {op: desc}){
    op 
    servico  
    cancelada 
    cliente 
    obs 
    quant 
    vendedor
    entrada 
    produzido
    entrega
    entregue
  }
}
""";

const String opsProdQuery = """
query{
  ops(order_by: {entrega: asc, cliente: asc, op: asc}, where: {cancelada: {_eq: false}, produzido: {_is_null: true}, entregue: {_is_null: true}}){
    op 
    servico  
    cancelada 
    cliente 
    obs 
    quant 
    vendedor
    entrada 
    produzido
    entrega
    entregue
  }
}
""";

const String opsEntQuery = """
query{
  ops(order_by: {entrega: asc, cliente: asc, op: asc}, where: {cancelada: {_eq: false}, produzido: {_is_null: false}, entregue: {_is_null: true}}){
    op 
    servico  
    cancelada 
    cliente 
    obs 
    quant 
    vendedor
    entrada 
    produzido
    entrega
    entregue
  }
}
""";

const String opsCan = """
query (\$op: Int) {
  ops(where: {op: {_eq: \$op}}) {
    cancelada
  }
}
""";

const String opsCanMutation = """
mutation CanOps(\$op: Int, \$cancelada: Boolean) {
  update_ops(where: {op: {_eq: \$op}}, _set: {cancelada: \$cancelada}) {
    affected_rows
  }
}
""";

const String opsProdMutation = """
mutation CanOps(\$op: Int, \$produzido: date) {
  update_ops(where: {op: {_eq: \$op}}, _set: {produzido: \$produzido}) {
    affected_rows
  }
}
""";

const String opsEntMutation = """
mutation CanOps(\$op: Int, \$entregue: date) {
  update_ops(where: {op: {_eq: \$op}}, _set: {entregue: \$entregue}) {
    affected_rows
  }
}
""";


//const String opsQuery = """
//query{ops{op servico acabamento acm cancelada cliente coa colagem com corte cva cvm1 cvm2 entrada entrega entregue flexo id impressao lam1 laminacao obs orcamento produzido quant ryobi sm2c sm4c valor vendedor}}
//""";
