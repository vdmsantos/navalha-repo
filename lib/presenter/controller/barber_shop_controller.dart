import 'package:flutter/material.dart';
import 'package:projeto_1/infra/model/barbershop_model.dart';

class BarberShopController extends ChangeNotifier {
  int currentIndex = 0;

  List<BarbershopModel> barberShopList = [];
  List<BarbershopModel> getAllUsers() {
    barberShopList.add(BarbershopModel(
        name: "Outsider Barber",
        beardPrice: 16,
        hairPrice: 20,
        star: 5,
        distancia: 4.5));
    barberShopList.add(BarbershopModel(
        name: "Packers Barbearia",
        beardPrice: 25,
        hairPrice: 20,
        star: 4,
        distancia: 10.6));
    barberShopList.add(BarbershopModel(
        name: "Black dog barbershop",
        beardPrice: 30,
        hairPrice: 20,
        star: 3,
        distancia: 16.6));
    barberShopList.add(BarbershopModel(
        name: "El Chape Barbearia",
        beardPrice: 35,
        hairPrice: 30,
        star: 2,
        distancia: 24.6));
    barberShopList.add(BarbershopModel(
        name: "Outside",
        beardPrice: 16,
        hairPrice: 20,
        star: 5,
        distancia: 4.5));
    barberShopList.add(BarbershopModel(
        name: "Royal Barbershop",
        beardPrice: 40,
        hairPrice: 30,
        star: 1,
        distancia: 30.6));

    notifyListeners();
    return barberShopList;
  }
}
