import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  String getPrefix() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw Exception('Usuário não autenticado');
    return 'users/$uid';
  }

  CollectionReference veiculosCol() => db.collection('${getPrefix()}/veiculos');
  CollectionReference abastecimentosCol() => db.collection('${getPrefix()}/abastecimentos');

  // Veiculos
  Future<DocumentReference> addVeiculo(Map<String, dynamic> data) => veiculosCol().add(data);
  Future<void> updateVeiculo(String id, Map<String, dynamic> data) => veiculosCol().doc(id).update(data);
  Future<void> deleteVeiculo(String id) => veiculosCol().doc(id).delete();
  Stream<QuerySnapshot> streamVeiculos() => veiculosCol().snapshots();

  // Abastecimentos
  Future<DocumentReference> addAbastecimento(Map<String, dynamic> data) => abastecimentosCol().add(data);
  Future<void> deleteAbastecimento(String id) => abastecimentosCol().doc(id).delete();
  Stream<QuerySnapshot> streamAbastecimentos() => abastecimentosCol().snapshots();

  // Query abastecimentos por veiculo
  Stream<QuerySnapshot> streamAbastecimentosByVeiculo(String veiculoId) =>
      abastecimentosCol().where('veiculoId', isEqualTo: veiculoId).orderBy('data', descending: true).snapshots();
}