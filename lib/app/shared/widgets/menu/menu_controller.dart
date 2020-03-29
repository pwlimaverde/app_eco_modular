import 'package:mobx/mobx.dart';

import 'menu_widget.dart';

part 'menu_controller.g.dart';

class MenuController = _MenuControllerBase with _$MenuController;

abstract class _MenuControllerBase with Store {

  final prefsMenu;
  _MenuControllerBase(this.prefsMenu){
    getPage();
  }

  getPage()async{
    page = await prefsMenu.getInt("page");
  }

  @observable
  int page;


  @action
  setPage(int valor){
    page = valor;
  }


  observerMenuWidget(){
    return MenuWidget(
      page: page,
      onTap: (int valor) async{
        setPage(valor);
        await prefsMenu.setInt("page", valor);
      },
    );
  }
}
