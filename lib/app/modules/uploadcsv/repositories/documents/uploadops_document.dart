const String uploadOpsMutation = """
mutation InsertOps(\$cliente: String, \$op: Int, \$orcamento: Int, \$quant: Int, \$servico: String, \$valor: float8, \$vendedor: String, \$entrega: date, \$entrada: date) {
  insert_ops(objects: {cliente: \$cliente, op: \$op, orcamento: \$orcamento, quant: \$quant, servico: \$servico, valor: \$valor, vendedor: \$vendedor, entrega: \$entrega, entrada: \$entrada}) {
    returning {
      id
    }
  }
}
""";

const String opsDup = """
query (\$op: Int) {
  ops(where: {op: {_eq: \$op}}) {
    id
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

//mutation InsertOps(\$cliente: String, \$op: Int, \$orcamento: Int, \$quant: Int, \$servico: String, \$valor: float8, \$vendedor: String) {
//insert_ops(objects: {cliente: \$cliente, op: \$op, orcamento: \$orcamento, quant: \$quant, servico: \$servico, valor: \$valor, vendedor: \$vendedor}, on_conflict: {constraint: ops_pkey, update_columns: cancelada}){
//returning {
//id
//}
//}
