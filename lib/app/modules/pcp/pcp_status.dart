enum PcpStatus {
  loading,
  success,
  error,
  none
}

extension OpsStatusExt on PcpStatus{
  static var _valor;
  get valorGet => _valor;
  set valorSet(valor) => _valor = valor;
}