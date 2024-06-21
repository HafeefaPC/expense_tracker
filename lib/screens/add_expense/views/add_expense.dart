import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  List<String> myCategoriesIcons = [
    'entertainment',
    'home',
    'pet',
    'phone',
    'shopping',
    'travel'
  ];

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Add Expense",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                    controller: expenseController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        FontAwesomeIcons.dollarSign,
                        size: 16,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    )),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                  controller: categoryController,
                  textAlignVertical: TextAlignVertical.center,
                  readOnly: true,
                  onTap: () {},
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      FontAwesomeIcons.list,
                      size: 16,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                bool isExpended = false;
                                String iconSelected = '';
                                Color categoryColor = Colors.white;
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return AlertDialog(
                                    title: const Text(' Create a Category'),
                                    content: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width * 0,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                              // controller: dateController,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                filled: true,
                                                fillColor: Colors.white,
                                                hintText: 'Name',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide.none,
                                                ),
                                              )),
                                          const SizedBox(height: 16),
                                          TextFormField(
                                              // controller: dateController,
                                              onTap: () {
                                                setState(() {
                                                  isExpended = !isExpended;
                                                });
                                              },
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                filled: true,
                                                suffixIcon: const Icon(
                                                  CupertinoIcons.chevron_down,
                                                  size: 12,
                                                ),
                                                fillColor: Colors.white,
                                                hintText: 'Icon',
                                                border: OutlineInputBorder(
                                                  borderRadius: isExpended
                                                      ? const BorderRadius
                                                          .vertical(
                                                          top: Radius.circular(
                                                              12))
                                                      : BorderRadius.circular(
                                                          12),
                                                  borderSide: BorderSide.none,
                                                ),
                                              )),
                                          isExpended
                                              ? Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 200,
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              bottom: Radius
                                                                  .circular(
                                                                      12))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GridView.builder(
                                                        gridDelegate:
                                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    3,
                                                                mainAxisSpacing:
                                                                    5,
                                                                crossAxisSpacing:
                                                                    5),
                                                        itemCount:
                                                            myCategoriesIcons
                                                                .length,
                                                        itemBuilder:
                                                            (context, int i) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                iconSelected =
                                                                    myCategoriesIcons[
                                                                        i];
                                                              });
                                                            },
                                                            child: Container(
                                                              width: 50,
                                                              height: 50,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width: 3,
                                                                      color: iconSelected ==
                                                                              myCategoriesIcons[
                                                                                  i]
                                                                          ? Colors
                                                                              .green
                                                                          : Colors
                                                                              .grey),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/Images/${myCategoriesIcons[i]}.png'))),
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                )
                                              : Container(),
                                          const SizedBox(height: 16),
                                          TextFormField(
                                              // controller: dateController,
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx2) {
                                                      return AlertDialog(
                                                        content: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            ColorPicker(
                                                              pickerColor:
                                                                  categoryColor,
                                                              onColorChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  categoryColor =
                                                                      value;
                                                                });
                                                              },
                                                            ),
                                                            SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              height: 50,
                                                              child: TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          ctx2)
                                                                      .pop();
                                                                },
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .black,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                  ),
                                                                ),
                                                                child: const Text(
                                                                    'Save',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          22,
                                                                    )),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    });
                                              },
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                filled: true,
                                                fillColor: categoryColor,
                                                hintText: 'Color',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide.none,
                                                ),
                                              )),
                                          const SizedBox(height: 16),
                                          SizedBox(
                                            width: double.infinity,
                                            height: kToolbarHeight,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context  ).pop();
                                              },
                                              style: TextButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                              child: const Text('Save',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              });
                        },
                        icon: const Icon(
                          FontAwesomeIcons.plus,
                          size: 16,
                          color: Colors.grey,
                        )),
                    hintText: 'Category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  )),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                  controller: dateController,
                  textAlignVertical: TextAlignVertical.center,
                  readOnly: true,
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate:
                            DateTime.now().add(const Duration(days: 365)));

                    if (newDate != null) {
                      dateController.text =
                          DateFormat('dd/MM/yyyy').format(newDate);
                      selectedDate = newDate;
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      FontAwesomeIcons.clock,
                      size: 16,
                      color: Colors.grey,
                    ),
                    hintText: 'Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  )),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
