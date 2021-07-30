import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {

  final AnimationController controller;

  /*
   * Inicializando button squeeze
   *
   * Interval utilizado para dizer em qual tempo inicia e termina a animação
   * seu valor é em porcentagem.
   */
  StaggerAnimation({this.controller}) : buttonSqueeze = Tween(
    begin: 320.0,
    end: 60.0,
  ).animate(
    CurvedAnimation(parent: controller, curve: Interval(0.0, 0.150))
  );

  /*
   * Animação double para animar largura do botão
   */
  final Animation<double> buttonSqueeze;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 50,
      ),
      child: InkWell(
        onTap: () {
          controller.forward();
        },
        child: Container(
          width: buttonSqueeze.value,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromRGBO(247, 64, 186, 1.0),
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: _buildInside(context),
          ),
        ),
      );
  }


  /*
  * Método que controla o conteúdo dentro do botão de signIn.
  */
  Widget _buildInside(BuildContext context){
      if(buttonSqueeze.value > 75){
        return Text(
            "Sign In",
            style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3
          ),
        );
      }else{
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white
          ),
          strokeWidth: 1.0,
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }
}