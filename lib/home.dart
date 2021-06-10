import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/home_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ChangeNotifierProvider(
            create: (context) => HomeProvider(),
            child: HomeBody()
          ),
        ),
      )
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    HomeProvider provider = Provider.of<HomeProvider>(context, listen: false);
    provider.requestUserData();

    return Container(
      child: StackBody()
    );
  }
}

class StackBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        /**
         * Determine which widget that should be displayed by looking
         * at the state
         */
        if(provider.loading) return Loading();
        if(provider.message != "") return MessageText();
        return UserList();
      }
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator()
    );
  }

}

class MessageText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context, listen: false);

    return Center(
      child: Text(provider.message)
    );
  }

}

class UserList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    HomeProvider provider = Provider.of<HomeProvider>(context, listen: false);

    return ListView.builder(
      itemCount: provider.userList.length,
      itemBuilder: (context, idx) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(provider.userList[idx]),
                duration: Duration(seconds: 1),
              )
            );
          },
          child: Card(
            margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
            child: Container(
              padding: EdgeInsets.all(24.0),
              child: Text(provider.userList[idx])
            ),
          ),
        );
      }
    );
  }
}