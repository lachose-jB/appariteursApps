import 'package:flutter/material.dart';
import 'package:appariteurs/yumData/userDefault.dart';

class Body extends StatelessWidget {
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    UserActif userActif = UserActif.initUserActif();

    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  "Nombres d'heures de prestation",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/mission.png",
                      height: 50, // 40%
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0), // Bord arrondi
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.redAccent, // Couleur de l'ombre
                            offset: Offset(0, 2), // Décalage horizontal et vertical de l'ombre
                            blurRadius: 6.0, // Flou de l'ombre
                            spreadRadius: 0.0, // Écart de l'ombre
                          ),
                        ],
                      ),
                      child: const Column(
                        children: [
                          Text(
                            "42:00:00", // Chiffre à droite
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "Cette semaine", // Chiffre à droite
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/mission.png",
                      height: 50, // 40%
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0), // Bord arrondi
                        boxShadow: const [
                          BoxShadow(
                          color: Colors.blue, // Couleur de l'ombre
                          offset: Offset(0, 2), // Décalage horizontal et vertical de l'ombre
                          blurRadius: 6.0, // Flou de l'ombre
                          spreadRadius: 0.0, // Écart de l'ombre
                          ),
                        ],
                      ),
                      child: const Column(
                        children: [
                          Text(
                            "42:00:00", // Chiffre à droite
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "     Ce Mois     ", // Chiffre à droite
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/mission.png",
                      height: 50, // 40%
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0), // Bord arrondi
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.green, // Couleur de l'ombre
                            offset: Offset(0, 2), // Décalage horizontal et vertical de l'ombre
                            blurRadius: 6.0, // Flou de l'ombre
                            spreadRadius: 0.0, // Écart de l'ombre
                          ),
                        ],
                      ),
                      child: const Column(
                        children: [
                          Text(
                            "42:00:00", // Chiffre à droite
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            " Cette année ", // Chiffre à droite
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  "Planning de la semaine",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
              // Autres éléments à ajouter à votre SingleChildScrollView
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildBlock(String number, String text, Color color) {
  return Column(
    children: [
      Container(
        width: 80.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      const SizedBox(height: 8.0),
      Text(text),
    ],
  );
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.centreName,
    required this.centreLogo,
    required this.centreAddress,
    required this.planningDate,
    required Null Function() press,
  }) : super(key: key);

  final String centreName;
  final Image centreLogo;
  final String planningDate;
  final String centreAddress;

  get press => null;

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // Élément 1

        ],
      ),
    );
  }
}

class ContainerItem extends StatelessWidget {
  final IconData icon;
  final String primaryText;
  final String secondaryText;

  ContainerItem({required this.icon, required this.primaryText, required this.secondaryText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Icon(icon),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                primaryText,
                style: const TextStyle(fontSize: 16.0),
              ),
              Text(
                secondaryText,
                style: const TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
