import 'package:flutter/material.dart';
import '../../../app_module.dart';
import '../../global/loginbutton/loginbutton_controller.dart';
import 'login_controller.dart';
import 'login_module.dart';
import 'utilitario/estilos.dart';
import 'widgets/button/button_controller.dart';
import 'widgets/button/button_widget.dart';
import 'widgets/field/field_widget.dart';


class LoginPage extends StatefulWidget {

  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  final controllerL = LoginModule.to.get<LoginController>();
  final controllerB = LoginModule.to.get<ButtonController>();
  final store = AppModule.to.get<LoginbuttonController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<String> user = store.storage.read(key: "username");
    user.then((String user){
      setState(() {
        controllerL.crtlLogin.text = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(40),
            child: Container(
              width: 350,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://cdn3.iconfinder.com/data/icons/rcons-user-action/32/boy-512.png"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: controllerL.formKey,
                    child: Column(children: <Widget>[
                      FieldWidget(
                        "Login",
                        "Digit o Login",
                        style: style,
                        controller: controllerL.crtlLogin,
                        validator: controllerL.validaLogin,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        focusNode: controllerL.focusLogin,
                        nextFocus: controllerL.focusSenha,
                      ),
                      Container(
                        height: 20,
                      ),
                      FieldWidget(
                        "Senha",
                        "Digit a Senha",
                        style: style,
                        senha: true,
                        controller: controllerL.crtlSenha,
                        validator: controllerL.validaSenha,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.go,
                        focusNode: controllerL.focusSenha,
                        nextFocus: controllerL.focusConfirma,
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                    "Login",
                    style: style,
                    onPressed: () => controllerB.clicButton(context),
                    focusNode: controllerL.focusConfirma,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}