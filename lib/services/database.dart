import 'package:telemrt/models/mrt.dart';
import 'package:telemrt/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference mrtCollection = Firestore.instance.collection('mrt');

  Future updateUserData(String name, String contacts, int preorder, String contact_details) async {
    return await mrtCollection.document(uid).setData({
      'name': name,
      'contacts': contacts,
      'preorder': preorder,
      'contact_details': contact_details
    });
  }

  //brew list from snapshot
  List<Mrt> _mrtListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Mrt(
          name: doc.data['name'] ?? '',
          contacts: doc.data['contacts'] ?? '',
          preorder: doc.data['preorder'] ?? 10,
          contact_details: doc.data['contact_details'] ?? ''
      );
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        contacts: snapshot.data['name'],
        preorder: snapshot.data['preorder'],
        contact_details: snapshot.data['contact_details']
    );
  }

  //get btds stream
  Stream<List<Mrt>> get mrts {
    return mrtCollection.snapshots()
        .map(_mrtListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData{
    return mrtCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

}