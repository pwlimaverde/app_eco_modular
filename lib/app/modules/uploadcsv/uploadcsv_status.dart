enum UploadcsvStatus {
  loading,
  success,
  error,
  none
}

extension UploadcsvStatusExt on UploadcsvStatus{
  static var _valor;
  get valorGet => _valor;
  set valorSet(valor) => _valor = valor;
}