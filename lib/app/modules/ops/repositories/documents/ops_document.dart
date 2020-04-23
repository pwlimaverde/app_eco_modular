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
//const String opsQuery = """
//query{ops{op servico acabamento acm cancelada cliente coa colagem com corte cva cvm1 cvm2 entrada entrega entregue flexo id impressao lam1 laminacao obs orcamento produzido quant ryobi sm2c sm4c valor vendedor}}
//""";
