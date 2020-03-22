
import 'package:eco_web_mobx/app/shared/global/loginbutton/loginbutton_controller.dart';
import 'package:flutter/material.dart';
import '../../../../../app_module.dart';

class UseraccountWidget extends StatefulWidget {

  String accountName;
  String accountEmail;
  String urlImage;

  UseraccountWidget(this.accountName, this.accountEmail, this.urlImage);

  @override
  _UseraccountWidgetState createState() => _UseraccountWidgetState();
}

class _UseraccountWidgetState extends State<UseraccountWidget> {
  final store = AppModule.to.get<LoginbuttonController>();
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text("${widget.accountName}"),
      accountEmail: Text("${widget.accountEmail}"),
      otherAccountsPictures: <Widget>[
        IconButton(icon: Icon(Icons.exit_to_app), onPressed: _iconLogout(),),
      ],
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage("${widget.urlImage}"),
      ),

    );
  }
  _iconLogout(){
      if(store.logado != "sem login"){
        return (){
          Navigator.pop(context);
          store.logout();
        };
      }
      return null;
    }
}


