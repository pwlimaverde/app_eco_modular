import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'opslist_widget.dart';

part 'opslist_controller.g.dart';

class OpslistController = _OpslistControllerBase with _$OpslistController;

abstract class _OpslistControllerBase with Store {
  @observable
  int loadOpCheck;

  @action
  setOpCheck(OpsModel op) {
    loadOpCheck = op.op;
  }

  @action
  setOpCheckCan() async {
    loadOpCheck =
        await Future<bool>.delayed(Duration(seconds: 1)).then((value) => null);
  }

  @observable
  int loadOpCan;

  @action
  setOpCan(OpsModel op) {
    loadOpCan = op.op;
  }

  @action
  setOpCanCan() async {
    loadOpCan =
        await Future<bool>.delayed(Duration(seconds: 1)).then((value) => null);
  }

  getAtraso(OpsModel model) {
    var now = DateTime.now();
    String dayProd;
    String dayExped;
    String dayEnt;
    int dif = int.parse(now.difference(model.entrega).inDays.toString());
    if (model.cancelada) {
      return "";
    }
    if (model.entregue != null) {
      int difEnt = int.parse(now.difference(model.entregue).inDays.toString());
      if (difEnt == 0) {
        dayEnt = "- Entregue hoje";
      } else {
        dayEnt = "- Entregue a ${dayEnt} dia(s)";
      }
      return dayEnt;
    }
    if (model.produzido != null) {
      int difExped =
          int.parse(now.difference(model.produzido).inDays.toString());
      if (difExped == 0) {
        dayExped = "- Entrou hoje em expedição";
      } else {
        dayExped = "- Entrou em expedição a ${difExped} dia(s)";
      }
      return dayExped;
    }
    if (dif > 0) {
      dayProd = "- Atrasado à ${dif.toString()} dias";
    } else if (dif == 0) {
      dayProd = "- Entrega hoje";
    } else if (dif == -1) {
      dayProd = "- Entrega amanhã";
    } else {
      dayProd = "- Faltam ${-dif} dia(s) para entrega";
    }
    return dayProd;
  }

  getCorCard(OpsModel model) {
    var now = DateTime.now();
    int dif = int.parse(now.difference(model.entrega).inDays.toString());
    if (model.cancelada == true) {
      return Colors.grey[100];
    } else if (model.entregue != null) {
      return Colors.grey[100];
    } else if (model.produzido != null) {
      return Colors.grey[100];
    } else if (dif > 0) {
      return Colors.redAccent[100];
    } else if (dif == 0) {
      return Colors.orangeAccent[100];
    } else if (dif == -1) {
      return Colors.yellowAccent[100];
    }
    return Colors.grey[100];
  }

  opslistWidget(
    showMenu,
    filtro,
    check,
    can,
  ) {
    return OpslistWidget(
      showMenu: showMenu,
      filtro: filtro,
      check: (OpsModel o) {
        setOpCheck(o);
        check(o);
        setOpCheckCan();
      },
      can: (OpsModel o) {
        setOpCan(o);
        can(o);
        setOpCanCan();
      },
    );
  }
}
