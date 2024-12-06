import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veho_app/user_interface/requirement/logic/provider.dart';
import 'package:veho_app/utils/widgets/button.dart';
import 'package:veho_app/utils/widgets/dropdown.dart';

class ScreenAddRequirement extends StatefulWidget {
  const ScreenAddRequirement({super.key});

  @override
  State<ScreenAddRequirement> createState() => _ScreenAddRequirementState();
}

class _ScreenAddRequirementState extends State<ScreenAddRequirement> {
  ValueNotifier<bool> _brandNotifier = ValueNotifier<bool>(false);
  final _formKey = GlobalKey<FormState>();

  late final RequirementProvider provider;
  @override
  void initState() {
    provider = context.read<RequirementProvider>();
    Future(() => provider.getBrandData());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Vehicle requirment',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Consumer<RequirementProvider>(builder: (context, value, child) {
        return value.brandModel == null
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomDropDown(
                        text: 'Brand',
                        label: 'Select Brand',
                        items: value.brandModel?.brands
                                ?.map((e) => e.name ?? '')
                                .toList() ??
                            [],
                        onChanged: (String? v) {
                          value.addRequirementModel.brandId = value
                              .brandModel?.brands
                              ?.firstWhere((e) => e.name == v)
                              .id;
                        },
                      ),
                      ValueListenableBuilder(
                          valueListenable: _brandNotifier,
                          builder: (context, value, child) {
                            return CustomDropDown(
                              text: 'Model',
                              label: 'Select Model',
                              items: [],
                              onChanged: (String? value) {},
                            );
                          }),
                      ValueListenableBuilder(
                          valueListenable: _brandNotifier,
                          builder: (context, value, child) {
                            return CustomDropDown(
                              text: 'Variant',
                              label: 'Select Variant',
                              items: [],
                              onChanged: (String? value) {},
                            );
                          }),
                      ValueListenableBuilder(
                          valueListenable: _brandNotifier,
                          builder: (context, value, child) {
                            return CustomDropDown(
                              text: 'Year',
                              label: 'Select Year',
                              items: [],
                              onChanged: (String? value) {},
                            );
                          }),
                      TransmissionSelector(),
                      ValueListenableBuilder(
                          valueListenable: _brandNotifier,
                          builder: (context, value, child) {
                            return CustomDropDown(
                              text: 'Fuel ',
                              label: 'Select fuel type',
                              items: [],
                              onChanged: (String? value) {},
                            );
                          }),
                      ValueListenableBuilder(
                          valueListenable: _brandNotifier,
                          builder: (context, value, child) {
                            return CustomDropDown(
                              text: 'Color',
                              label: 'Select Color',
                              items: [],
                              onChanged: (String? value) {},
                            );
                          }),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          backgroundColor: const Color(0xff4A101D),
          buttonText: 'Submit',
          onPressed: () {
            if (_formKey.currentState != null &&
                _formKey.currentState!.validate()) {}
          },
        ),
      ),
    );
  }
}

class TransmissionSelector extends StatefulWidget {
  @override
  _TransmissionSelectorState createState() => _TransmissionSelectorState();
}

class _TransmissionSelectorState extends State<TransmissionSelector> {
  bool isAutomatic = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                'Transmisson',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                ' *',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAutomatic = true;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: isAutomatic
                            ? const Color(0xff4A101D)
                            : Colors.white),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Text(
                    'Automatic',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isAutomatic
                          ? const Color(0xff4A101D)
                          : const Color.fromARGB(255, 233, 233, 233),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAutomatic = false;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: !isAutomatic
                            ? const Color(0xff4A101D)
                            : Colors.white),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Text(
                    'Manual',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: !isAutomatic
                          ? const Color(0xff4A101D)
                          : const Color.fromARGB(255, 233, 233, 233),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
