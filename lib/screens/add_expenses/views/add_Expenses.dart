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
  DateTime selectDate = DateTime.now();
  List<String> myCategoriesIcons = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel'
  ];



  @override
  void initState() {
    dateController.text =
        DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
                "Add Expenses",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
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
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                readOnly: true,
                controller: categoryController,
                onTap: () {},
                textAlignVertical: TextAlignVertical.center,
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
                              bool isExpanded = false;
                              String iconSelected = '';
                               Color categoryColor = Colors.white;
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return AlertDialog(
                                  title: const Text("Create a category"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormField(
                                        // readOnly: true,
                                        // controller: dateController,

                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        onTap: () async {},
                                        decoration: InputDecoration(
                                          filled: true,
                                          isDense: true,
                                          fillColor: Colors.white,
                                          prefixIcon: const Icon(
                                            FontAwesomeIcons.list,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          hintText: "Name",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide.none),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        readOnly: true,
                                        // controller: dateController,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        onTap: () async {
                                          setState(() {
                                            isExpanded = !isExpanded;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor: Colors.white,
                                          prefixIcon: const Icon(
                                            FontAwesomeIcons.icons,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          suffixIcon: const Icon(
                                            Icons.arrow_drop_down_sharp,
                                            size: 40,
                                          ),
                                          hintText: "Icon",
                                          border: OutlineInputBorder(
                                              borderRadius: isExpanded
                                                  ? BorderRadius.vertical(
                                                      top: Radius.circular(12),
                                                    )
                                                  : BorderRadius.circular(12),
                                              borderSide: BorderSide.none),
                                        ),
                                      ),
                                      isExpanded
                                          ? Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 200,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12),
                                                  )),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: GridView.builder(
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 3,
                                                        mainAxisSpacing: 5,
                                                        crossAxisSpacing: 5),
                                                    itemCount:
                                                        myCategoriesIcons.length,
                                                    itemBuilder:
                                                        (context, int i) {
                                                      return GestureDetector(
                                                        onTap: (){
                                                          setState((){
                                                            iconSelected = myCategoriesIcons[i];
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 50,
                                                          width: 50,
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: iconSelected == myCategoriesIcons[i] ? Colors.green : Colors.grey,
                                                              width: iconSelected == myCategoriesIcons[i] ? 3 : 1,
                                                            ),
                                                              borderRadius: BorderRadius.circular(12),
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/${myCategoriesIcons[i]}.png'))),
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            )
                                          : Container(),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        readOnly: true,
                                        // controller: dateController,

                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        onTap: () async {
                                          showDialog(
                                              context: context,
                                              builder: (ctx2){
                                                return AlertDialog(
                                                      content:Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          ColorPicker(
                                                            pickerColor: Colors.blue,
                                                            onColorChanged: (value){
                                                              setState((){
                                                                categoryColor = value;
                                                              });

                                                            },
                                                          ),
                                                          SizedBox(
                                                            height: 50,
                                                            width: double.infinity,
                                                            child: TextButton(
                                                              onPressed: () {
                                                                // print(categoryColor);
                                                                Navigator.pop(ctx2);
                                                              },
                                                              style: TextButton.styleFrom(
                                                                  backgroundColor: Colors.black,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(12))),
                                                              child: const Text("save",
                                                                  style: TextStyle(fontSize: 22, color: Colors.white)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),

                                                    );
                                              }
                                              );

                                        },
                                        decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor:  categoryColor ,
                                          prefixIcon: const Icon(
                                            FontAwesomeIcons.faceAngry,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          hintText: "Color",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide.none),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),

                                      SizedBox(
                                        width: double.infinity,
                                        height: kToolbarHeight,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: TextButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12))),
                                          child: const Text("save",
                                              style: TextStyle(fontSize: 22, color: Colors.white)),
                                        ),
                                      ),
                                    ],
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
                  hintText: "Category",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                readOnly: true,
                controller: dateController,
                textAlignVertical: TextAlignVertical.center,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: selectDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)));
                  if (newDate != null) {
                    setState(() {
                      dateController.text =
                          DateFormat('dd/MM/yyyy').format(newDate).toString();
                      selectDate = newDate;
                    });
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
                  hintText: "Date",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
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
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text("save",
                      style: TextStyle(fontSize: 22, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
