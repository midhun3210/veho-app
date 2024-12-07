import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veho_app/user_interface/requirement/logic/provider.dart';
import 'package:veho_app/user_interface/requirement/models/model.dart';
import 'package:veho_app/user_interface/requirement/screens/requirement_type_screen.dart';
import 'package:veho_app/utils/widgets/button.dart';

class ScreenRequirements extends StatefulWidget {
  const ScreenRequirements({super.key});

  @override
  State<ScreenRequirements> createState() => _ScreenRequirementsState();
}

class _ScreenRequirementsState extends State<ScreenRequirements> {
  late final RequirementProvider provider;
  @override
  void initState() {
    provider = context.read<RequirementProvider>();
    Future(() => provider.getVendorRequirements());
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
          'Requirement List',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Consumer<RequirementProvider>(builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: value.requirementsList?.length ?? 0,
            itemBuilder: (context, index) => RequirementCard(
              requirementModel: value.requirementsList![index],
            ),
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          backgroundColor: const Color(0xff4A101D),
          buttonText: '+ Create A Requirement',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScreenRequirementType()),
            );
          },
        ),
      ),
    );
  }
}

class RequirementCard extends StatelessWidget {
  final RequirementModel requirementModel;
  const RequirementCard({required this.requirementModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.7,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${requirementModel.vehicleVariant?.name ?? ''} (${requirementModel.year ?? ''})",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Transmission',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 181, 181, 181),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  requirementModel.transmission?.name ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Fuel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 181, 181, 181),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  requirementModel.fuelType?.name ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Color',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 181, 181, 181),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  requirementModel.vehicleColor?.name ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Active',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                CupertinoSwitch(
                    activeColor: const Color(0xff4A101D),
                    value: requirementModel.status == "active",
                    onChanged: (value) {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
