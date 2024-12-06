import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:veho_app/user_interface/requirement/logic/provider.dart';
import 'package:veho_app/user_interface/requirement/screens/add_requirement_screen.dart';

class ScreenRequirementType extends StatefulWidget {
  const ScreenRequirementType({super.key});

  @override
  State<ScreenRequirementType> createState() => _ScreenRequirementTypeState();
}

class _ScreenRequirementTypeState extends State<ScreenRequirementType> {
  late final RequirementProvider _provider;
  @override
  void initState() {
    _provider = context.read<RequirementProvider>();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'What would you prefer to have?',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequirementCard(
              path: 'assests/svg/carR.svg',
              type: 'Car',
              onTap: () {
                _provider.addRequirementModel.vehicleTypeId = 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ScreenAddRequirement()),
                );
              },
            ),
            RequirementCard(
              path: 'assests/svg/bike.svg',
              type: 'Bike',
              onTap: () {
                _provider.addRequirementModel.vehicleTypeId = 2;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ScreenAddRequirement()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class RequirementCard extends StatelessWidget {
  final String path;
  final String type;
  final VoidCallback onTap;

  const RequirementCard({
    super.key,
    required this.path,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width / 2.25,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                path,
                height: 27.0,
                width: 27.0,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                type,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff4A101D),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
