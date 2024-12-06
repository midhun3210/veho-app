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
        return ListView.builder(
          itemCount: value.requirementsList?.length ?? 0,
          itemBuilder: (context, index) => RequirementCard(
            requirementModel: value.requirementsList![index],
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
      color: Colors.white,
      child: Column(
        children: [
          Text(
            "${requirementModel.vehicleVariant}",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Requirement List',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Requirement List',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Requirement List',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Requirement List',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Requirement List',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Requirement List',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Requirement List',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Requirement List',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Switch(
                  activeColor: const Color(0xff4A101D),
                  value: false,
                  onChanged: (value) {}),
            ],
          ),
        ],
      ),
    );
  }
}
