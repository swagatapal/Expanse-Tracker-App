import 'dart:math';

import 'package:expanse_tracker/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow[700],
                          ),
                        ),
                        Icon(Icons.person, color: Colors.yellow[900]),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wellcome !!",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        Text(
                          "John Doe",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.tertiary,
                    ],
                    transform: const GradientRotation(
                        pi / 4), // directtion change of gradient color
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.grey.shade300,
                      offset: const Offset(5, 5),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Total Balance",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    '\$ 4800.00',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white30,
                              ),
                              child: const Center(
                                  child: Icon(Icons.arrow_downward,
                                      size: 12, color: Colors.greenAccent)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Income",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '\$ 4800.00',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white30,
                              ),
                              child: const Center(
                                  child: Icon(Icons.arrow_upward,
                                      size: 14, color: Colors.red)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Expenses",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '\$ 4800.00',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transaction",
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "View All..",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.outline,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: transactionsData.length,
                  itemBuilder: (context, int i) {
                    return TransactionContainer(
                      icon:transactionsData[i]['icon'] ,
                      color: transactionsData[i]['color'],
                      name: transactionsData[i]['name'],
                      totalAmount: transactionsData[i]['totalAmount'],
                      date: transactionsData[i]['date'],

                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class TransactionContainer extends StatelessWidget {

  final Widget? icon;
  final Color? color;
  final String ? name;
  final String ? totalAmount;
  final String ? date;

  const TransactionContainer({super.key, this.icon, this.color, this.name, this.totalAmount, this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children:[
                      Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        // color: Colors.yellow[700],
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Icon(Icons.food_bank, color: Colors.white,)
                    icon ?? Container(),
                    ]
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    // "Food",
                    name??"",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    // "-\$ 45.00",
                    totalAmount??"",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    // "Today",
                    date??"",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.outline,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
