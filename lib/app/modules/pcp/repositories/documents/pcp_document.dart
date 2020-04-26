const String opsRyobiQuery = """
query{
  ops(order_by: {orderpcp: asc, entrega: asc, cliente: asc, op: asc}, where: {cancelada: {_eq: false}, produzido: {_is_null: true}, entregue: {_is_null: true}, ryobi: {_eq: true}}){
    op 
    orderpcp
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
    entregaprog
    impressao
    ryobi
    sm2c
    sm4c
    flexo
  }
}
""";

const String opsSm2cQuery = """
query{
  ops(order_by: {orderpcp: asc, entrega: asc, cliente: asc, op: asc}, where: {cancelada: {_eq: false}, produzido: {_is_null: true}, entregue: {_is_null: true}, sm2c: {_eq: true}}){
    op 
    orderpcp
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
    entregaprog
    impressao
    ryobi
    sm2c
    sm4c
    flexo
  }
}
""";

const String opsSm4cQuery = """
query{
  ops(order_by: {orderpcp: asc, entrega: asc, cliente: asc, op: asc}, where: {cancelada: {_eq: false}, produzido: {_is_null: true}, entregue: {_is_null: true}, sm4c: {_eq: true}}){
    op 
    orderpcp
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
    entregaprog
    impressao
    ryobi
    sm2c
    sm4c
    flexo
  }
}
""";

const String opsFlexoQuery = """
query{
  ops(order_by: {orderpcp: asc, entrega: asc, cliente: asc, op: asc}, where: {cancelada: {_eq: false}, produzido: {_is_null: true}, entregue: {_is_null: true}, flexo: {_eq: true}}){
    op 
    orderpcp
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
    entregaprog
    impressao
    ryobi
    sm2c
    sm4c
    flexo
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

const String opsImpMutation = """
mutation ProdOps(\$op: Int, \$impressao: date, \$ryobi: Boolean, \$sm2c: Boolean, \$sm4c: Boolean, \$flexo: Boolean) {
  update_ops(where: {op: {_eq: \$op}}, _set: {impressao: \$impressao, ryobi: \$ryobi, sm2c: \$sm2c, sm4c: \$sm4c, flexo: \$flexo}) {
    affected_rows
  }
}
""";

const String opsOrderMutation = """
mutation Order(\$op: Int, \$orderpcp: Int) {
  update_ops(where: {op: {_eq: \$op}}, _set: {orderpcp: \$orderpcp}) {
    affected_rows
  }
}
""";

const String opsInfoMutation = """
mutation InfoOps(\$op: Int, \$orderpcp: Int, \$entrega: date, \$entregaprog: date, \$obs: String, \$ryobi: Boolean, \$sm2c: Boolean, \$sm4c: Boolean, \$flexo: Boolean, \$impressao: date) {
  update_ops(where: {op: {_eq: \$op}}, _set: {entrega: \$entrega, entregaprog: \$entregaprog, obs: \$obs, ryobi: \$ryobi, sm2c: \$sm2c, sm4c: \$sm4c, flexo: \$flexo, impressao: \$impressao, orderpcp: \$orderpcp}) {
    affected_rows
  }
}
""";

//const String opsQuery = """
//query{ops{op servico acabamento acm cancelada cliente coa colagem com corte cva cvm1 cvm2 entrada entrega entregue flexo id impressao lam1 laminacao obs orcamento produzido quant ryobi sm2c sm4c valor vendedor}}
//""";
