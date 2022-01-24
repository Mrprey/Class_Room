import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:redux/redux.dart' as redux;
import 'package:todo_app/AppState.dart';
import 'package:todo_app/Middleware/middleware_to_do.dart';
import 'package:todo_app/Redux/reducers/AppReducer.dart';
import 'package:todo_app/View/HomePage.dart';

import 'Redux/actions/actions.dart';

void main() async{
  final store = redux.Store<AppState>(
    appReducers,
    initialState: new AppState(toDoList: []),
    middleware: [MiddlewareToDo()],
  );

  await initHiveForFlutter();

  store.dispatch(LoadToDoAction());

  runApp(
    StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: Home(),
      ),
    ),
  );
}