import 'package:finance_app/data/model/add_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final box = Hive.box<AddData>('data');
  DateTime date = DateTime.now();
  String? selectedItem;
  String? selectedItemi;
  final TextEditingController expalinC = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amountC = TextEditingController();
  FocusNode amount = FocusNode();
  final List<String> _item = <String>[
    'starbucks',
    'credit-card',
    'increase',
    //'Education',
  ];
  final List<String> _itemi = [
    'Income',
    'Expand',
  ];

  @override
  void initState() {
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            backgroundContainer(context),
            Positioned(
              top: 120,
              child: mainContainer(),
            )
          ],
        ),
      ),
    );
  }

  Container mainContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 550,
      width: 340,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          name(),
          const SizedBox(
            height: 30,
          ),
          explain(),
          const SizedBox(
            height: 30,
          ),
          amountbuild(),
          const SizedBox(
            height: 30,
          ),
          how(),
          const SizedBox(
            height: 30,
          ),
          dataTime(),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              var add = AddData(
                selectedItemi!,
                amountC.text,
                expalinC.text,
                selectedItem!,
                date,
              );
              box.add(add);
              Navigator.of(context).pop();
            },
            child: Container(
              width: 120,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff368983),
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Container dataTime() {
    return Container(
      width: 300,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: const Color(0xffc5c5c5),
        ),
      ),
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2024),
            lastDate: DateTime(2026),
          );

          if (newDate == null) return;
          setState(() {
            date = newDate;
          });
        },
        child: Text(
          'Data: ${date.year}-${date.month}-${date.day}',
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container how() {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: const Color(0xffc5c5c5),
        ),
      ),
      child: DropdownButton<String>(
        value: selectedItemi,
        items: _itemi
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Row(
                  children: [
                    // SizedBox(
                    //   width: 40,
                    //   child: Image.asset('assets/$e.png'),
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      e,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            )
            .toList(),
        selectedItemBuilder: (context) => _itemi
            .map(
              (e) => Row(
                children: [
                  // SizedBox(
                  //   width: 42,
                  //   child: Image.asset('assets/$e.png'),
                  // ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(e)
                ],
              ),
            )
            .toList(),
        hint: const Text(
          'How',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        dropdownColor: Colors.white,
        isExpanded: true,
        underline: Container(),
        onChanged: (value) {
          setState(
            () {
              selectedItemi = value;
            },
          );
        },
      ),
    );
  }

  Padding amountbuild() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        cursorColor: const Color(0xffc5c5c5),
        controller: amountC,
        focusNode: amount,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'amount',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffc5c5c5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffc5c5c5),
            ),
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        cursorColor: const Color(0xffc5c5c5),
        controller: expalinC,
        focusNode: ex,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'explain',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffc5c5c5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffc5c5c5),
            ),
          ),
        ),
      ),
    );
  }

  Container name() {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: const Color(0xffc5c5c5),
        ),
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        items: _item
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: Image.asset('assets/$e.png'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      e,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            )
            .toList(),
        selectedItemBuilder: (context) => _item
            .map(
              (e) => Row(
                children: [
                  SizedBox(
                    width: 42,
                    child: Image.asset('assets/$e.png'),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(e)
                ],
              ),
            )
            .toList(),
        hint: const Text(
          'Name',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        dropdownColor: Colors.white,
        isExpanded: true,
        underline: Container(),
        onChanged: (value) {
          setState(
            () {
              selectedItem = value;
            },
          );
        },
      ),
    );
  }

  Column backgroundContainer(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: const BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Adding',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
