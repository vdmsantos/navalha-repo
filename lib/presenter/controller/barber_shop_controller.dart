
import 'package:flutter/material.dart';

class BarberShopController extends ChangeNotifier {
  int currentIndex = 0;


  // List<PessoaModel> ppl = [];
  // List<PessoaModel> getAllUsers() {
  //   ppl.add(PessoaModel(
  //       nome: "Vitor Daniel mendes dos Santos", nota: 8, price: 15.4));
  //   ppl.add(
  //       PessoaModel(nome: "Mariana Mendes dos Santos", nota: 10, price: 6.4));
  //   ppl.add(PessoaModel(
  //       nome: "Valenthine Nascimento Stammerjohan", nota: 3, price: 102.4));
  //   ppl.add(
  //       PessoaModel(nome: "Shirley Mendes dos Santos", nota: 9, price: 52.4));
  //   ppl.add(PessoaModel(nome: "Amauri Jesus dos Santos", nota: 11, price: 15));
  //   ppl.add(PessoaModel(
  //       nome: "Christian Lucas Mendes dos Santos", nota: 5, price: 1.4));
  //   ppl.add(PessoaModel(nome: "Joao Maria José", nota: 6, price: 5.4));
  //   ppl.add(PessoaModel(nome: "Rafaela mendes", nota: 7, price: 0.4));

  //   return ppl;
  // }

  void setBottomBarIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}