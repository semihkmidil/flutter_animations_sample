abstract class INavigationService{
  void pushNamed({String routeName, Object arguments});
  void pushReplacementNamed({String routeName, Object arguments});
  void pushAndRemoveUntil({String routeName});
  void pop();
}