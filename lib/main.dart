import 'package:flutter/material.dart';

// EXPANDED TODO
class Todo {
  final String title;
  final String desc;

  const Todo(this.title, this.desc);
}
List<Todo> todoList = [
  Todo('TODO 001', 'Wake up and say morning prayers.'),
  Todo('TODO 002', 'Take a bath, use shampoo, conditioner and shower soap.'),
  Todo('TODO 003', 'Open VLC player and watch flvtter.')
];

void main() => runApp(MaterialApp(
  theme: ThemeData(
    // brightness: Brightness.dark,
    primaryColor: Colors.green
  ),  
  // title: 'To Do List V1', // does not show
  // home: MyTodoListApp(),
  home: TodosScreen(todos: todoList)
));

class TodosScreen extends StatefulWidget {
  final List<Todo> todos;
  const TodosScreen({ Key? key, required this.todos }) : super(key: key);

  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos Screen'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoList[index].title),
            subtitle: Text(todoList[index].desc),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todoList[index]),
                )
              );
            }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Todo? newTodo = await showDialog<Todo>(
            context: context,
            builder: (BuildContext context) {
              String? title;
              String? desc;

              return AlertDialog(
                title: const Text('Create New Task'),
                content: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (value) => title = value,
                      decoration: const InputDecoration(
                        labelText: 'Title'
                      )
                    ),
                    TextField(
                      onChanged: (value) => desc = value,
                      decoration: const InputDecoration(
                        labelText: 'Description'
                      )
                    ),                    
                  ]
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text('Save'),
                    onPressed: () {
                      if (title != null && desc != null) {
                        Navigator.pop(
                          context,
                          Todo(title!, desc!)
                        );
                      }
                    },
                  )
                ]
              );
            }
          );

          if (newTodo != null) {
            setState(() {
              todoList.add(newTodo);
            });
          }
        },

        child: const Icon(Icons.add)
      ),

    ); 
  }
}
class DetailScreen extends StatelessWidget {
  final Todo todo;
  const DetailScreen({ Key? key, required this.todo }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title)
      ),
      body: Center(
        child: Text(todo.desc)
      )
    );
  }
}






// RETURN DATA TO PREV SCREEN
// void main() {
//   runApp(ReturnDataPage());
// }
// class ReturnDataPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '',
//       home: HomeScreen()
//     );
//   }
// }
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
// class _HomeScreenState extends State<HomeScreen> {
//   String _selection = 'None';
//   _startSelectionScreen() async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => SelectionScreen()
//       )
//     );

//     setState(() {
//       _selection = result ?? 'None';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Selection WAS: $_selection'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _startSelectionScreen,
//               child: Text('Select Something'))
//           ]
//         )
//       )
//     );
//   }
// }
// class SelectionScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Selection Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: Text('Red Button'),
//               onPressed: () {
//                 Navigator.pop(context, 'Red Button');
//               },
//             ),
//             ElevatedButton(
//               child: Text('Blue Button'),
//               onPressed: () {
//                 Navigator.pop(context, 'Blue Button');
//               },
//             ),            
//           ]
//         )
//       ) 
//     );
//   }
// }





// // TO-DO N A V I G A T T T

// void main() => runApp(MaterialApp(
//   theme: ThemeData(
//     // brightness: Brightness.dark,
//     primaryColor: Colors.green
//   ),  
//   // title: 'To Do List V1', // does not show
//   // home: MyTodoListApp(),
//   home: TodosScreen(todos: todoList)
// ));

// class TodosScreen extends StatelessWidget {
//   final List<Todo> todos;
//   const TodosScreen({ Key? key, required this.todos }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Todos Screen'),
//       ),
//       body: ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(todos[index].title),
//             subtitle: Text(todos[index].desc),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetailScreen(todo: todos[index]),
//                 )
//               );
//             }
//           );
//         }
//       )
//     ); 
//   }
// }
// class DetailScreen extends StatelessWidget {
//   final Todo todo;
//   const DetailScreen({ Key? key, required this.todo }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(todo.title)
//       ),
//       body: Center(
//         child: Text(todo.desc)
//       )
//     );
//   }
// }







// class MyTodoListApp extends StatefulWidget {
//   @override
//   _MyTodoListAppState createState() => _MyTodoListAppState();
// }
// class _MyTodoListAppState extends State<MyTodoListApp> {
//   List<String> todos = ['task1', 'task2', 'task3'];
//   // dialog box popup
//   // text input add to the _todos
//   void _addTodo() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String newTodo = '';

//         return AlertDialog(
//           title: Text('Enter a task below:'),
//           content: TextField(
//             onChanged: (value) {
//               newTodo = value;
//             },
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               }
//             ),
//             TextButton(
//               child: Text('Svbmit'),
//               onPressed: () {
//                 setState(() {
//                   todos.add(newTodo);
//                 });
//                 Navigator.of(context).pop();
//               }
//             ),

//           ]
//         );
//       }
//     );
//   }
//   // listview.builder --> ListTiles _todos
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('To Do List'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             const SizedBox(
//               height: 60.0,
//               child: const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue
//               ),
//               child: Text('Drawer Headah')
//             ),
//             ),
//             ListTile(
//               title: const Text('Nav Pvsh'),
//               onTap: () {
//                 Navigator.push(context,
//                   MaterialPageRoute(
//                     builder: (context) => NavPvshPage()
//                   )
//                 );
//               }
//             ),
//             ListTile(
//               title: const Text('Menu 1'),
//               onTap: () {
//                 Navigator.pop(context);
//               }
//             ),
//             ListTile(
//               title: const Text('Menu 2'),
//               onTap: () {
//                 Navigator.of(context).pop();
//               }
//             ),
//           ]
//         )
//       ),
//       body: ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (context, index) {
//           final todo = todos[index];

//           return ListTile(
//             title: Text(todo,
//               style: TextStyle(
//                 decoration: todo.startsWith('-')
//                 ? TextDecoration.lineThrough
//                 : TextDecoration.none
//               )
//             ),
//             onTap: () {
//               setState(() {
//                 // todos.removeAt(index);
//                 todos[index] = todo.startsWith('-')
//                 ? todo.substring(2)
//                 : '- $todo'; 
//               });
//             }
//           );
//         }
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addTodo,
//         child: Icon(Icons.add),          
//       )
//     );
//   }
// }
// class NavPvshPage extends StatelessWidget {
//   const NavPvshPage({ super.key });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nav Pvsh'),
//       ),
//       body: const Center(
//         child: Text('N A V  P V S H')
//       )
//     );
//   }
// }


// TO-DO LIST
// void main() => runApp(MaterialApp(
//   theme: ThemeData(
//     // brightness: Brightness.dark,
//     primaryColor: Colors.green
//   ),  
//   title: 'To Do List V1',
//   home: MyTodoListApp(),  
// ));
// class MyTodoListApp extends StatefulWidget {
//   @override
//   _MyTodoListAppState createState() => _MyTodoListAppState();
// }
// class _MyTodoListAppState extends State<MyTodoListApp> {
//   List<String> todos = ['task1', 'task2', 'task3'];
//   // dialog box popup
//   // text input add to the _todos
//   void _addTodo() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String newTodo = '';

//         return AlertDialog(
//           title: Text('Enter a task below:'),
//           content: TextField(
//             onChanged: (value) {
//               newTodo = value;
//             },
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               }
//             ),
//             TextButton(
//               child: Text('Svbmit'),
//               onPressed: () {
//                 setState(() {
//                   todos.add(newTodo);
//                 });
//                 Navigator.of(context).pop();
//               }
//             ),

//           ]
//         );
//       }
//     );
//   }
//   // listview.builder --> ListTiles _todos
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('To Do List'),
//       ),
//       body: ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (context, index) {
//           final todo = todos[index];

//           return ListTile(
//             title: Text(todo,
//               style: TextStyle(
//                 decoration: todo.startsWith('-')
//                 ? TextDecoration.lineThrough
//                 : TextDecoration.none
//               )
//             ),
//             onTap: () {
//               setState(() {
//                 // todos.removeAt(index);
//                 todos[index] = todo.startsWith('-')
//                 ? todo.substring(2)
//                 : '- $todo'; 
//               });
//             }
//           );
//         }
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addTodo,
//         child: Icon(Icons.add),          
//       )
//     );
//   }
// }



// LISTVIEW
// void main() => runApp(MyListView());
// class MyListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final items = ['item1', 'item2', 'item3'];

//     return MaterialApp(
//       title: 'ListView App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('ListView Ex App'),
//         ),
//         // body: ListView(
//         //   children: [
//         //     ListTile(
//         //       leading: Icon(Icons.person),
//         //       title: Text('Threat Actor 1'),
//         //       subtitle: Text('ff@asdf.com'),
//         //       trailing: Icon(Icons.arrow_forward),
//         //       onTap: () => print('L I S T T I L E  W A S  T A P P D'),
//         //     ),
//         //   ]
//         // )
//         body: ListView.builder(
//           itemCount: items.length,
//           // optional
//           prototypeItem: ListTile(
//             title: Text(items.first)
//           ),
//           itemBuilder: (context, index) {
//             // item = items[0]
//             final item = items[index];

//             return ListTile(
//               title: Text(item),
//               onTap: () {
//                 print('YOU TAPPD $item');
//               },
//             );
//           }
//         )
//       )
//     );
//   }
// }





// void main() {
//   runApp(MaterialApp(
//     // theme: ThemeData(
//     //   brightness: Brightness.dark,
//     //   primaryColor: Colors.blueGrey
//     // ),
//     // home: const Text('Some Textr')
    
//     // home: MyApp()
//     home: Scaffold(
//       body: Center(
//         child: UserButton()        
//       )
//     ),
//   ));
// }





// void main() => runApp(MyDialog());
// class MyDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Dialog Demo',
//       home: MyDialogPage()
//     );
//   }
// }
// class MyDialogPage extends StatefulWidget {
//   const MyDialogPage({ super.key });
//   @override
//   _MyDialogPageState createState() => _MyDialogPageState();
// }
// class _MyDialogPageState extends State<MyDialogPage> {
//   // initial var
//   String _inputText = '';

//   // void show input
//   // alert dialog call
//   void _showInputDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         TextEditingController controller = TextEditingController();
//         return AlertDialog(
//           title: const Text('Enter some'),
//           content: TextField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: 'Enter some text'
//             )
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('Save'),
//               onPressed: () {
//                 setState(() {
//                   _inputText = controller.text;
//                 });
//                 Navigator.of(context).pop();
//               }
//             )
//           ]
//         );
//       }
//     );
//   }

//   // scaffold
//   // appbar, body (updated state text) -- icon
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dialog App'),
//       ),
//       body: Center(
//         child: Text(_inputText.isEmpty ? 'Tap icon to enter' : "[T]: $_inputText"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showInputDialog,
//         child: Icon(Icons.edit)
//       ),
//     );
//   }

// }



// class UserButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap:() {
//         print('User tappdr buttn');
//       },
//       child: Container(
//         height: 60,
//         padding: const EdgeInsets.all(8),
//         margin: const EdgeInsets.symmetric(horizontal: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: Colors.red[600]
//         ),
//         child: Center(
//           child: Text('CLICK HEER')
//         )
//       ),
//     );
//   }
// }
// class MyApp extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('SW AppBar Titler')),
//       body: Center(
//         child: Text('SW Body Center Childr')
//       )
//     );
//   }
// }



