import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:veho_app/user_interface/home/logic/provider.dart';
import 'package:veho_app/user_interface/requirement/screens/requiremnts_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final HomeProvider provider;
  @override
  void initState() {
    provider = context.read<HomeProvider>();
    Future(() => provider.getTotalVehicle());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Dashboard"),
        actions: [Icon(Icons.notifications)],
      ),
      body: Consumer<HomeProvider>(builder: (context, value, child) {
        return provider.totalVehicle == null
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : GridView.count(
                crossAxisCount: 2,
                children: [
                  InkWell(
                    onTap: () {},
                    child: _buildDataCard(
                        "Total Vehicle",
                        provider.totalVehicle?.length ?? 0,
                        CircularContainer(
                          color: const Color(0xff36B3CE),
                          size: 70,
                          icon: SvgPicture.asset(
                            'assests/svg/car.svg',
                            height: 40.0,
                            width: 40.0,
                          ),
                        )),
                  ),
                  _buildDataCard(
                      "Total Bookings",
                      50,
                      CircularContainer(
                        color: const Color(0xff36CE85),
                        size: 70,
                        icon: SvgPicture.asset(
                          'assests/svg/booking.svg',
                          height: 35.0,
                          width: 35.0,
                        ),
                      )),
                  _buildDataCard(
                      "C2B Concept",
                      25,
                      CircularContainer(
                        color: const Color(0xffCE3636),
                        size: 70,
                        icon: SvgPicture.asset(
                          'assests/svg/concept.svg',
                          height: 40.0,
                          width: 40.0,
                        ),
                      )),
                  _buildDataCard(
                      "Vehicle for Sale",
                      35,
                      CircularContainer(
                        color: const Color(0xff3645CE),
                        size: 70,
                        icon: SvgPicture.asset(
                          'assests/svg/sale.svg',
                          height: 35.0,
                          width: 35.0,
                        ),
                      )),
                ],
              );
      }),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            onTap: (v) {
              if (v == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenRequirements()),
                );
              }
              ;
            },
            selectedItemColor: const Color(0xff4A101D),
            unselectedItemColor: const Color(0xff4A101D),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: const Color(0xff4A101D),
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message, color: const Color(0xff4A101D)),
                  label: "Message"),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(), // Placeholder for the center button
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.description, color: const Color(0xff4A101D)),
                  label: "Requirement"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: const Color(0xff4A101D)),
                  label: "Profile"),
            ],
          ),
          Positioned(
            top: -30,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    CircularContainer(
                      color: const Color(0xff4A101D),
                      size: 70,
                      icon: SvgPicture.asset(
                        'assests/svg/sell.svg',
                        height: 25.0,
                        width: 25.0,
                      ),
                    ),
                    const Text(
                      'Sell',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xff4A101D),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildDataCard(String title, int value, Widget icon) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 10),
          Text(value.toString(),
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }
}

class CircularContainer extends StatelessWidget {
  final Color color;
  final double size;
  final Widget icon;

  const CircularContainer(
      {Key? key, required this.color, required this.size, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(child: icon),
    );
  }
}
