import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../infra/model/user_model.dart';
import '../home/home_page.dart';

class BodyEditProfile extends StatelessWidget {
  BodyEditProfile({
    Key? key,
  }) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void setUserInfo() {
    UsuarioModel usuario = GetIt.I.get<UsuarioModel>();
    nameController.text = usuario.userName!;
    emailController.text = usuario.userEmail!;
    passwordController.text = usuario.userPassword!;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    setUserInfo();
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SizedBox(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const HomePage(
                                      scaffoldKeymed: null,
                                    )),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        "Editar Perfil",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(""),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 70,
                  backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
                  child: Image.asset("assets/images/profile.png"),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Alterar foto",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  width: 350,
                  child: Text(
                    "Nome:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(36, 36, 36, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: TextField(
                        controller: nameController,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  width: 350,
                  child: Text(
                    "E-mail:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(36, 36, 36, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: TextField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  width: 350,
                  child: Text(
                    "Celular:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(36, 36, 36, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  width: 350,
                  child: Text(
                    "Data de Nascimento:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(36, 36, 36, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  width: 350,
                  child: Text(
                    "Senha:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(36, 36, 36, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  width: 350,
                  child: Text(
                    "Confirmar:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(36, 36, 36, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 50, bottom: 50),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      width: 135,
                      height: 45,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(36, 36, 36, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => const HomePage(
                                        scaffoldKeymed: null,
                                      )),
                                ),
                              );
                            },
                            child: const Text(
                              "Confirmar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      right: -30,
                      child: CircleAvatar(
                        radius: 29,
                        backgroundColor: Color.fromRGBO(48, 48, 48, 1),
                        child: Icon(
                          Icons.check_circle_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
