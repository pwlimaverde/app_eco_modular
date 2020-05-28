enum OpsStatus {
  loading,
  success,
  error,
  none
}

extension OpsStatusExt on OpsStatus{
  static var _valor;
  get valorGet => _valor;
  set valorSet(valor) => _valor = valor;
}