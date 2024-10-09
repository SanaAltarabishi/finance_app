import 'package:finance_app/data/first.dart';

List<Money> geterTop() {
  Money snapFood = Money();
  snapFood.time = 'jan 30,2024';
  snapFood.image = 'assets/starbucks.png';
  snapFood.buy = true;
  snapFood.fee = '\$ 100';
  snapFood.name = 'Snap food';
  Money snap = Money();
  snap.time = 'today';
  snap.image = 'assets/credit-card.png';
  snap.buy = true;
  snap.fee = '- \$ 60';
  snap.name = 'Transfer';
  return [
    snapFood,
    snap,
  ];
}
