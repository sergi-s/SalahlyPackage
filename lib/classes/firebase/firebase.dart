import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:salahlypackage/abstract_classes/authontication.dart';
import 'package:salahlypackage/abstract_classes/user.dart';
import 'package:salahlypackage/classes/models/client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:salahlypackage/main.dart';
import 'package:salahlypackage/utils/constants.dart';

DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("user");
final DatabaseReference dbRef = FirebaseDatabase.instance.ref();

class FirebaseCustom extends Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  // ignore: avoid_renaming_method_parameters
  Future<bool> login(UserType client) async {
    // TODO: Magdy
    try {
      String emm = ((client.email) != null ? client.email : "").toString();
      final user = await _firebaseAuth.signInWithEmailAndPassword(
          email: emm, password: client.password);
      if (user != null) {
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return false;
  }

  @override
  Future<bool> signup(UserType client) async {
    String emm = ((client.email) != null ? client.email : "").toString();
    final User? firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emm, password: client.password)
            .catchError((errMsg) {
      print(errMsg);
      return false;
    }))
        .user;

    if (firebaseUser != null) {
      //user created
      Map userDataMap = {
        "name": client.name,
        "email": client.email,
        "birthday": client.birthDay,
        "createdDate": client.createdDate,
        "sex": client.sex,
        "type": client.type,
        "avatar": client.avatar,
        "address": client.address,
        "phoneNumber": client.phoneNumber,
        "loc": client.loc
      };
      usersRef.child(firebaseUser.uid).set(userDataMap);
      return true;
    }
    return false;
  }

  final bool use_emulator = true;

  Future _connectToFirebaseEmulator() async {
    final _localHostString = localHostString;
    FirebaseDatabase.instance.useDatabaseEmulator(_localHostString, fbdbport);
    await FirebaseAuth.instance.useAuthEmulator(_localHostString, fbauthport);
    print("Connected to emulator");
  }

  Future connectToEmulator() async {
    if (use_emulator) {
      try {
        await _connectToFirebaseEmulator();
      } catch (Exception) {
        print(Exception);
      }
    } else
      print("Not using emulator");
  }
}
