
import 'package:eco_web_mobx/app/modules/ops/ops_controller.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:eco_web_mobx/app/shared/utilitario/auxiliares.dart';
import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:eco_web_mobx/app/shared/widgets/header/header_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/menu/menu_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/opslist/opslist_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/right/right_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../app_controller.dart';
import 'repositories/uploadcsv_interface.dart';
import 'dart:html' as html;
import 'dart:convert' as convert;
import 'package:intl/intl.dart' as intl;
import 'uploadcsv_status.dart';
import 'widgets/bodyuploadcsv/bodyuploadcsv_widget.dart';

part 'uploadcsv_controller.g.dart';

class UploadcsvController = _UploadcsvControllerBase with _$UploadcsvController;

abstract class _UploadcsvControllerBase with Store {
  final IUploadcsvRepository repository;

  _UploadcsvControllerBase(this.repository) {
    uploadOps();
  }

  final controllerGeral = Modular.get<AppController>();
  final controllerHeader = Modular.get<HeaderController>();
  final controllerMenu = Modular.get<MenuController>();
  final controllerRight = Modular.get<RightController>();
  final controllerOpsList = Modular.get<OpslistController>();

  get sizeW => controllerGeral.size.width;

  get sizeH => controllerGeral.size.height;

  get showMenu => controllerGeral.showMenu;

  get header => controllerHeader.header(sizeW, hederHeight);

  get menu => controllerMenu.menuWidget(1);

  get right => controllerRight.rightWidget(
        widget: BodyuploadcsvWidget(
          showMenu: showMenu,
          menuWidth: menuWidth,
          sizeW: sizeW,
          sizeH: sizeH,
        ),
        menuWidth: menuWidth,
        showMenu: showMenu,
        sizeW: sizeW,
      );

  @observable
  UploadcsvStatus status = UploadcsvStatus.none;

  @action
  setStatus(UploadcsvStatus statusUP) {
    status = statusUP;
  }

  uploadOps() {
    setStatus(UploadcsvStatus.loading);
    try {
      html.InputElement uploadInput = html.FileUploadInputElement();
      uploadInput.click();

      uploadInput.onChange.listen(
        (e) {
          List<html.File> files = uploadInput.files;
          if (files.length > 0) {
            final html.File file = files[0];
            print("Upload file: ${file.name}");

            final reader = html.FileReader();
            reader.onLoadEnd.listen((e) async {
              Object result = reader.result;

              var now = DateTime.now();
//            var formatter = new DateFormat('dd-MM-yyyy');
              var formatAno = intl.DateFormat('yyyy');
              String ano = formatAno.format(now);

              String s = result;
              String base64 = s.substring(s.indexOf(",") + 1);
              String mimeType = s.substring(s.indexOf(":") + 1, s.indexOf(";"));
              print("mimeType: $mimeType");

              if (!file.name.contains(".csv")) {
                setStatus(
                  UploadcsvStatus.error..valorSet = "O arquivo não é *.csv",
                );
              }

              dynamic bytes = convert.base64.decode(base64);
              String decoderByte = convert.utf8.decode(bytes);
              String decoderSplitMap = decoderByte.splitMapJoin(
                  (RegExp(r'\d{5},\D')),
                  onMatch: (m) => '${m.group(0)}',
                  onNonMatch: (n) => "$n--->---");
              List<String> decoderRow =
                  decoderSplitMap.split(RegExp(r'--->---'));
              decoderRow.removeAt(0);

              List<OpsModel> listOps = [];

              for (String item in decoderRow) {
                if (item.isNotEmpty) {
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
                  up.valor = double.parse(i2[4]
                      .substring(0, i2[4].indexOf('",'))
                      .replaceFirst('.', '')
                      .replaceAll(',', '.')
                      .trim());
                  String entrada = i2[4]
                      .substring(i2[4].indexOf('",') + 2)
                      .replaceAll('"', '')
                      .trim();
                  DateTime entradaFD = DateTime.parse(
                    "${entrada.substring(6, 10)}-${entrada.substring(3, 5)}-${entrada.substring(0, 2)}",
                  );
                  up.entrada = entradaFD;
                  String voe = i2[5];
                  String vendedor = voe
                      .substring(0, voe.indexOf(','))
                      .replaceAll('"', '')
                      .trim();
                  up.vendedor = vendedor;
                  String oe = voe.substring(voe.indexOf(',') + 1);
                  String op = oe.substring(0, oe.indexOf(','));
                  up.op = int.parse(op);
                  String entrega = "${oe.substring(oe.indexOf(',') + 1)}";
                  String entregaOk = "${entrega.substring(0, 6)}-$ano";
                  DateTime entregaFD = DateTime.parse(
                    "${entregaOk.substring(7, 11)}-${convertMes("${entregaOk.substring(3, 6)}")}-${entregaOk.substring(0, 2)}",
                  );
                  up.entrega = entregaFD;
                  listOps.add(up);
                }
              }
              List<OpsModel> listOk = await upload(listOps);
              if (listOk == null) {
                setStatus(
                  UploadcsvStatus.error..valorSet = "Nenhuma OP nova carregada",
                );
              } else {
                setStatus(
                  UploadcsvStatus.success..valorSet = listOk,
                );
              }
            });

            reader.readAsDataUrl(file);
          }
        },
      );
    } catch (e) {
      setStatus(
        UploadcsvStatus.error..valorSet = e,
      );
    }
  }

  Future upload(List<OpsModel> model) => repository.upload(model);
  Future upProd(OpsModel model) => repository.upProd(model);
  Future canProd(OpsModel model) => repository.canProd(model);
}
