import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/users_provider.dart';

import '../../models/user.dart';

import '../cards/white_card.dart';
import 'package:flutter_twitter_web/ui/labels/custom_labels.dart';

class UserView extends StatefulWidget {
  final String uid;

  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    usersProvider.getUserById(widget.uid).then((userDB) => setState(() {
          user = userDB;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('UserView', style: CustomLabels.h1),
          SizedBox(height: 10),
          if (user == null)
            WhiteCard(
                child: Container(
              height: 300,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )),
          _UserViewBody()
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: {0: FixedColumnWidth(250)},
        children: [
          TableRow(children: [
            _AvatarContainer(),
            Container(
              height: 200,
              color: Colors.green,
            )
          ])
        ],
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
        child: Container(
      width: double.infinity,
      child: Column(
        children: [
          Text('Profile', style: CustomLabels.h2),
          SizedBox(height: 20),
          Container(
            width: 150,
            height: 160,
            child: Stack(
              children: [
                ClipOval(child: Image(image: AssetImage('no-image.jpg'))),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 5)),
                    child: FloatingActionButton(
                      backgroundColor: Colors.indigo,
                      elevation: 0,
                      child: Icon(Icons.camera_alt_outlined, size: 20),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Nombre de usuario',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }
}
