import 'package:finance_app/data/first.dart';

List<Money> geter() {
  Money upwork = Money();
  upwork.name = 'upwork';
  upwork.fee = '\$650';
  upwork.time = 'today';
  upwork.image = 'assets/increase.png';
  upwork.buy = false;
  Money starbucks = Money();
  starbucks.buy = true;
  starbucks.fee = '\$ 15';
  starbucks.image = 'assets/starbucks.png';
  starbucks.name = 'starbucks';
  starbucks.time = 'today';
  Money transfer = Money();
  transfer.buy = true;
  transfer.fee = '\$ 100';
  transfer.image = 'assets/credit-card.png';
  transfer.name = 'transfer for sam';
  transfer.time = 'jan 30,2025';

  return [
    upwork,
    starbucks,
    transfer,
    upwork,
    starbucks,
    transfer,
  ];
}
