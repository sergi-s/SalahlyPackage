import 'package:salahlypackage/abstract_classes/user.dart';
import 'package:salahlypackage/classes/models/location.dart';

class Client extends UserType {
  int subscription;

  Client({
    required String? name,
    required String? email,
    String? id,
    String? birthDay,
    String? createdDate,
    AccountState? userState,
    Sex? sex,
    Type? type,
    String? avatar,
    String? address,
    String? phoneNumber,
    CustomLocation? loc,
    required this.subscription,
  }) : super(
            name: name,
            email: email,
            id: id,
            birthDay: birthDay,
            createdDate: createdDate,
            state: userState,
            sex: sex,
            type: type,
            avatar: avatar,
            loc: loc,
            phoneNumber: phoneNumber);

  @override
  set setPassword(String value) {
    super.setPassword = value;
  }

  @override
  bool isValid() {
    return (super.isValid() && subscriptionValidate(subscription));
  }

  // Validation
  bool subscriptionValidate(int subscription) {
    return subscription > 0;
  }
}
