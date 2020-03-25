import 'package:mobx/mobx.dart';
import 'model/ops_model.dart';
import 'repositories/uploadcsv_interface.dart';
import 'dart:html' as html;
import 'dart:convert' as convert;
import 'package:intl/intl.dart' as intl;
part 'uploadcsv_controller.g.dart';

class UploadcsvController = _UploadcsvControllerBase with _$UploadcsvController;

abstract class _UploadcsvControllerBase with Store {

  final IUploadcsvRepository repository;

  _UploadcsvControllerBase(this.repository);

  @observable
  String msgError;
  @action
  ativMsgError(String msg){
    msgError = msg;
  }

  @observable
  bool upandoOps = false;
  @action
  ativUpandoOps(bool valor){
    upandoOps = valor;
  }

  @observable
  ObservableList<OpsModel> opsListUpload = ObservableList<OpsModel>();
  @action
  getOpsListUpload(List<OpsModel> listOpsUP){
    if(listOpsUP == null){
      ativUpandoOps(false);
      ativMsgError("Nenhuma OP nova localizada");
    }
    print("${listOpsUP[0].op}");
    opsListUpload = listOpsUP.asObservable();
    ativUpandoOps(false);
    ativMsgError(null);
  }

  uploadOps(context) {
    ativMsgError(null);


    try{
      html.InputElement uploadInput = html.FileUploadInputElement();
      uploadInput.click();

      uploadInput.onChange.listen(
            (e) {
          List<html.File> files = uploadInput.files;
          if (files.length > 0) {
            final html.File file = files[0];
            print("Upload file: ${file.name}");

            final reader = html.FileReader();
            reader.onLoadEnd.listen((e) async{
              Object result = reader.result;

              var now = DateTime.now();
//            var formatter = new DateFormat('dd-MM-yyyy');
              var formatAno = intl.DateFormat('yyyy');
              String ano = formatAno.format(now);

              String s = result;
              String base64 = s.substring(s.indexOf(",") + 1);
              String mimeType = s.substring(s.indexOf(":") + 1, s.indexOf(";"));
              print("mimeType: $mimeType");

              if(!file.name.contains(".csv")){
                ativUpandoOps(false);
                return print("não é um csv");
              }

              ativUpandoOps(true);

              dynamic bytes = convert.base64.decode(base64);
              String decoderByte = convert.utf8.decode(bytes);
              String decoderReple = decoderByte
                  .replaceAll('\n\r\n ', '')
                  .replaceAll('Série: P"', 'Série: P",\r\n')
                  .trim();
              List<String> decoderRow = decoderReple.split(',\r\n');
              List<OpsModel> listOps= [];

              for (String item in decoderRow) {
                OpsModel up = OpsModel();
                List<String> i2 = item
                    .replaceAll("\r\n", " | ")
                    .trim()
                    .replaceAll('$ano,', '$ano","')
                    .replaceFirst(',', ',"')
                    .trim()
                    .split(',"');
                up.orcamento = int.parse(i2[0].replaceAll("|", " ").trim());
                up.cliente = i2[1].replaceAll('"', '').trim();
                up.servico = i2[2].replaceAll('"', '').trim();
                up.quant = int.parse(i2[3]
                    .replaceAll('"', '')
                    .replaceAll(',00', '')
                    .replaceAll('.', '')
                    .trim());
                up.valor = double.parse(i2[4].substring(0, i2[4].indexOf('",')).replaceFirst('.', '').replaceAll(',', '.').trim());
                String entrada = i2[4]
                    .substring(i2[4].indexOf('",') + 2)
                    .replaceAll('"', '')
                    .trim();
                up.entrada = entrada;
                String voe = i2[5];
                String vendedor =
                voe.substring(0, voe.indexOf(',')).replaceAll('"', '').trim();
                up.vendedor = vendedor;
                String oe = voe.substring(voe.indexOf(',') + 1);
                String op = oe.substring(0, oe.indexOf(','));
                up.op = int.parse(op);
                String entrega = "${oe.substring(oe.indexOf(',') + 1)}-$ano";
                up.entrega = entrega.replaceAll('-', '/');
                listOps.add(up);
              }

              getOpsListUpload(await upload(listOps));

            });

            reader.readAsDataUrl(file);
          }
        },
      );
    }catch(e){
      ativUpandoOps(false);
      ativMsgError("Erro upload catch - $e");
    }
  }

  Future upload(List<OpsModel> model) => repository.upload(model);

}
