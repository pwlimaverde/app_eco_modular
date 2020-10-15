const String opsEstoqueQuery = """
query{
  ops(order_by: {entrega: asc, cliente: asc, op: asc}, where: {cancelada: {_eq: false}, produzido: {_is_null: true}, entregue: {_is_null: true}, designer: {_is_null: false}, artefinal: {_is_null: false}, estoque: {_is_null: true},}){
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
    entregaprog
    impressao
    ryobi
    sm2c
    sm4c
    flexo
    designer
    artefinal
    estoque
  }
}
""";

const String opsDesignerQuery = """
query{
  ops(order_by: {entrega: asc, cliente: asc, op: asc}, where: {cancelada: {_eq: false}, produzido: {_is_null: true}, entregue: {_is_null: true}, designer: {_is_null: true},}){
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
    entregaprog
    impressao
    ryobi
    sm2c
    sm4c
    flexo
    designer
    artefinal
    estoque
  }
}
""";

const String opsArteFinalQuery = """
query{
  ops(order_by: {entrega: asc, cliente: asc, op: asc}, where: {cancelada: {_eq: false}, produzido: {_is_null: true}, entregue: {_is_null: true}, artefinal: {_is_null: true}}){
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
    entregaprog
    impressao
    ryobi
    sm2c
    sm4c
    flexo
    designer
    artefinal
    estoque
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

const String opsDesignerMutation = """
mutation ProdOps(\$op: Int, \$designer: date) {
  update_ops(where: {op: {_eq: \$op}}, _set: {designer: \$designer}) {
    affected_rows
  }
}
""";

const String opsArteFinalMutation = """
mutation ProdOps(\$op: Int, \$artefinal: date) {
  update_ops(where: {op: {_eq: \$op}}, _set: {artefinal: \$artefinal}) {
    affected_rows
  }
}
""";

const String opsEstoqueFinalMutation = """
mutation ProdOps(\$op: Int, \$estoque: date) {
  update_ops(where: {op: {_eq: \$op}}, _set: {estoque: \$estoque}) {
    affected_rows
  }
}
""";

const String opsInfoMutation = """
mutation InfoOps(\$op: Int, \$entrega: date, \$entregaprog: date, \$obs: String, \$ryobi: Boolean, \$sm2c: Boolean, \$sm4c: Boolean, \$flexo: Boolean, \$impressao: date) {
  update_ops(where: {op: {_eq: \$op}}, _set: {entrega: \$entrega, entregaprog: \$entregaprog, obs: \$obs, ryobi: \$ryobi, sm2c: \$sm2c, sm4c: \$sm4c, flexo: \$flexo, impressao: \$impressao}) {
    affected_rows
  }
}
""";

//const String opsQuery = """
//query{ops{op servico acabamento acm cancelada cliente coa colagem com corte cva cvm1 cvm2 entrada entrega entregue flexo id impressao lam1 laminacao obs orcamento produzido quant ryobi sm2c sm4c valor vendedor}}
//""";
