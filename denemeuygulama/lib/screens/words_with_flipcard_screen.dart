import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
class FlipCardView extends StatefulWidget {
  const FlipCardView({super.key});

  @override
  State<FlipCardView> createState() => _FlipCardViewState();
}

class _FlipCardViewState extends State<FlipCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            FlipCardWidget()
          ],
        ),),
      ),



    );
  }
}

class FlipCardWidget extends StatelessWidget {
  const FlipCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, height: 500,
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.red
              ),
            ),
            Text("ön", style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),)
          ],
        ),
        back: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.lightGreenAccent
              ),
            ),
            Text("arka", style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),)
          ],
        ),


      ),
    );
  }
}
