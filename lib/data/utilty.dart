import 'package:finance_app/data/model/add_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

int totals = 0;

final box = Hive.box<AddData>('data');

int total() {
  var history2 = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(
      history2[i].inn == 'Income'
          ? int.parse(history2[i].amount)
          : int.parse(history2[i].amount) * -1,
    );
  }

  totals = a.reduce((value, element) => value + element);
  return totals;
}

int income() {
  var history2 = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(
      history2[i].inn == 'Income' ? int.parse(history2[i].amount) : 0,
    );
  }

  totals = a.reduce((value, element) => value + element);
  return totals;
}

int ecpenses() {
  var history2 = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(
      history2[i].inn == 'Income' ? 0 : int.parse(history2[i].amount) * -1,
    );
  }

  totals = a.reduce((value, element) => value + element);
  return totals;
}
