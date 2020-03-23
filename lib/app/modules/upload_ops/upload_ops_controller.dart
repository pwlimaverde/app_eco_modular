import 'dart:html' as html;
import 'package:eco_web_mobx/app/modules/upload_ops/repositories/upload_ops_interface.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:mobx/mobx.dart';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:intl/intl.dart';

part 'upload_ops_controller.g.dart';

class UploadOpsController = _UploadOpsControllerBase with _$UploadOpsController;

abstract class _UploadOpsControllerBase with Store {

  final IUploadOpsRepository repository;
  _UploadOpsControllerBase(IUploadOpsRepository this.repository){
    getOpsList();
  }

  @observable
  ObservableStream<List<OpsModel>> opsList;

  @action
  getOpsList(){
    opsList = repository.getOps().asObservable();
  }



  uploadOps(context) {
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen(
      (e) {
        List<html.File> files = uploadInput.files;
        if (files.length > 0) {
          final html.File file = files[0];
          print("Upload file: ${file.name}");

          final reader = html.FileReader();
          reader.onLoadEnd.listen((e) {
            Object result = reader.result;

            var now = new DateTime.now();
//            var formatter = new DateFormat('dd-MM-yyyy');
            var formatAno = new DateFormat('yyyy');
            String ano = formatAno.format(now);

            String s = result;
            String base64 = s.substring(s.indexOf(",") + 1);
            String mimeType = s.substring(s.indexOf(":") + 1, s.indexOf(";"));
            print("mimeType: $mimeType");

            dynamic bytes = convert.base64.decode(base64);
            String decoderByte = utf8.decode(bytes);
            String decoderReple = decoderByte
                .replaceAll('\n\r\n ', '')
                .replaceAll('Série: P"', 'Série: P",\r\n')
                .trim();
            List<String> decoderRow = decoderReple.split(',\r\n');

            List<Map<String, String>> decoderFinal = [];

            for (String item in decoderRow) {
              Map<String, String> row = Map();
              List<String> i2 = item
                  .replaceAll("\r\n", " | ")
                  .trim()
                  .replaceAll('$ano,', '$ano","')
                  .replaceFirst(',', ',"')
                  .trim()
                  .split(',"');
              row["oc"] = i2[0].replaceAll("|", " ").trim();
              row["cliente"] = i2[1].replaceAll('"', '').trim();
              row["servico"] = i2[2].replaceAll('"', '').trim();
              row["quant"] = i2[3]
                  .replaceAll('"', '')
                  .replaceAll(',00', '')
                  .replaceAll('.', '')
                  .trim();
              String valor = i2[4].substring(0, i2[4].indexOf('",'));
              row["valor"] = valor;
              String entrada = i2[4]
                  .substring(i2[4].indexOf('",') + 2)
                  .replaceAll('"', '')
                  .trim();
              row["entrada"] = entrada;
              String voe = i2[5];
              String vendedor =
                  voe.substring(0, voe.indexOf(',')).replaceAll('"', '').trim();
              row["vendedor"] = vendedor;
              String oe = voe.substring(voe.indexOf(',') + 1);
              String op = oe.substring(0, oe.indexOf(','));
              row["op"] = op;
              String entrega = "${oe.substring(oe.indexOf(',') + 1)}-$ano";
              row["entrega"] = entrega.replaceAll('-', '/');
              decoderFinal.add(row);
            }

            print(decoderFinal[1]);

//            biblioteca exel
//            var decoder = Excel.decodeBytes(bytes, update: true);
//
//            for (var table in decoder.tables.keys) {
//              print(decoder.tables[table].rows[2][2]);
//              for (var row in decoder.tables[table].rows) {
//                print("$row");
//              }
//            }
          });

          reader.readAsDataUrl(file);
        }
      },
    );
  }


}
