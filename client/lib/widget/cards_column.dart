import 'package:flutter/material.dart';
import 'package:client/services/decorations.dart';
import 'product_card.dart';

class CardsColumn extends StatefulWidget {
  const CardsColumn({Key? key, required this.type}) : super(key: key);
  final String type;

  @override
  _CardsColumnState createState() => _CardsColumnState();
}

class _CardsColumnState extends State<CardsColumn> {
  @override
  Widget build(BuildContext context) {
    final _controller = ScrollController();

    List<Widget> cards = List.generate(
        20,
        (i) => ProductCard(
            img: Icons.ac_unit,
            info: 'info',
            product: widget.type + " $i",
            price: 'price'));

    return Expanded(
      child: Ink(
        color: const Color(0xFFFAFAFA),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  _controller.animateTo(
                    _controller.position.minScrollExtent,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                onLongPress: () {
                  _controller.animateTo(
                    _controller.position.maxScrollExtent,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                child: Ink(
                  decoration: kBoxDecorationStyle,
                  child: Center(
                    child: Text(
                      widget.type,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Expanded(
              flex: 11,
              child: ListView(
                controller: _controller,
                children: cards,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
