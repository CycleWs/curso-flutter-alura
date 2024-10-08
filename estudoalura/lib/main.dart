import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('Tarefas'),
        ),
        body: ListView(children: const [
          Task('Aprender Flutter','https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',3),
          Task('Meter os Skate','https://images.pexels.com/photos/161172/cycling-bike-trail-sport-161172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',4),
          Task('Grindar o tarkas','https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg',5),
        ]),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  //parametro necessário
  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Stack(
            children: [
              Container(
                color: Colors.blue,
                height: 140,
              ),
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.black26,
                          width: 72,
                          height: 100,
                          child: Image.network(widget.foto,
                          fit: BoxFit.cover,),
                        ),
                        // ignore: sized_box_for_whitespace
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 200,
                                child: Text(
                                  widget.nome,
                                  style: const TextStyle(fontSize: 24),
                                  overflow: TextOverflow
                                      .ellipsis, //impedir que o texto sobreponha o widget
                                )),
                                Row(
                                  children: [
                                    Icon(Icons.star,size: 15, color: Colors.blue,),
                                    Icon(Icons.star,size: 15, color: Colors.blue,),
                                    Icon(Icons.star,size: 15, color: Colors.blue,),
                                    Icon(Icons.star,size: 15, color: Colors.blue[100],),
                                    Icon(Icons.star,size: 15, color: Colors.blue[100],),
                                  ],
                                )
                          ],
                        ),
                        Container(
                          height: 52,
                          width: 52,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  nivel++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                padding: EdgeInsets.zero
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:[
                                  Icon(Icons.arrow_drop_up, color: Colors.white),
                                  Text('UP',style: TextStyle(fontSize: 12, color: Colors.white))
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(width: 200,child: LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel/10,
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Nivel: $nivel',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              )
            ],
          ),
        ));
  }
}
