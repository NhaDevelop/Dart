import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              height: 100,
              color: Colors.blue,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.green,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.pink,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 20, 
                  ), 
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100,
                      color: Colors.orange,
                    ),
                  ),
                    const SizedBox(
                    width: 20, 
                  ), 
                  Container(
                    height: 100,
                    color: Colors.orange,
                  ),
                    const SizedBox(
                    width: 20, 
                  ), 
                ],
              ),
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: Container(
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}