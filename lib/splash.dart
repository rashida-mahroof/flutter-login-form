
import 'package:flutter/material.dart';
import 'package:flutter_application_2/login.dart';

class Splash
 extends StatefulWidget {
  const Splash
  ({ Key? key }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    gotoLogin();
    super.initState();
  }
 @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Center(child: Image.network('https://media-exp1.licdn.com/dms/image/C560BAQF43WOeqGiCrA/company-logo_200_200/0/1607696679447?e=2159024400&v=beta&t=LpZqdS18oLMoZpc1TWFpRVtBkLVsDdCtF7oQlagYZ_M'),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  Future<void> gotoLogin() async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
      return ScreenLogin();
        }
      ),
    );
  }
}
