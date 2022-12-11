import 'package:flutter/material.dart';
import 'package:evryday/screens/homepage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:evryday/common/cookie_request.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<ScreenState>(create: (_) => ScreenState()),
        ChangeNotifierProvider<BudgetModel>(create: (_) => BudgetModel()),
        Provider(create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        })
      ],
      child: MaterialApp(
        title: 'PBP Tugas Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class ScreenState with ChangeNotifier {
  int _currentScreen = 0;
  int get getCurrentScreen => _currentScreen;

  void setCurrentScreen(int screenIndex) {
    _currentScreen = screenIndex;
    notifyListeners();
  }
}

class BudgetModel with ChangeNotifier {
  final List<dynamic> _budgets = [];
  List<dynamic> get getBudgets => _budgets;

  void addBudget(Map budget) {
    _budgets.add(budget);
    notifyListeners();
  }
}
