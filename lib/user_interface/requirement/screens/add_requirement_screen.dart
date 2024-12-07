import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veho_app/user_interface/requirement/logic/provider.dart';
import 'package:veho_app/utils/widgets/button.dart';
import 'package:veho_app/utils/widgets/dropdown.dart';
import 'package:veho_app/utils/widgets/shimmer.dart';

class ScreenAddRequirement extends StatefulWidget {
  const ScreenAddRequirement({super.key});

  @override
  State<ScreenAddRequirement> createState() => _ScreenAddRequirementState();
}

class _ScreenAddRequirementState extends State<ScreenAddRequirement> {
  final ValueNotifier<bool> _modelNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _variantNotifier = ValueNotifier<bool>(false);
  final _formKey = GlobalKey<FormState>();

  late final RequirementProvider provider;
  @override
  void initState() {
    provider = context.read<RequirementProvider>();
    provider.addRequirementModel.transmissionId = 1;
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
                        onChanged: (String? v) async {
                          value.addRequirementModel.brandId = value
                              .brandModel?.brands
                              ?.firstWhere((e) => e.name == v)
                              .id;
                          _modelNotifier.value = true;
                          await value.getModelData();
                          _modelNotifier.value = false;
                        },
                      ),
                      ValueListenableBuilder(
                          valueListenable: _modelNotifier,
                          builder: (context, v, child) {
                            return v
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CustomShimmerTextField(
                                      width: double.maxFinite,
                                      height: 60,
                                    ),
                                  )
                                : CustomDropDown(
                                    text: 'Model',
                                    label: 'Select Model',
                                    items: value.modelModel?.data
                                            ?.map((e) => e.name ?? '')
                                            .toList() ??
                                        [],
                                    onChanged: (String? v) async {
                                      value.addRequirementModel.vehicleModelId =
                                          value.modelModel?.data
                                              ?.firstWhere((e) => e.name == v)
                                              .id;
                                      _variantNotifier.value = true;
                                      await value.getVariantData();
                                      _variantNotifier.value = false;
                                    },
                                  );
                          }),
                      ValueListenableBuilder(
                          valueListenable: _variantNotifier,
                          builder: (context, v, child) {
                            return v
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CustomShimmerTextField(
                                      width: double.maxFinite,
                                      height: 60,
                                    ),
                                  )
                                : CustomDropDown(
                                    text: 'Variant',
                                    label: 'Select Variant',
                                    items: value.variantModel?.bodyTypes
                                            ?.map((e) => e.name ?? '')
                                            .toList() ??
                                        [],
                                    onChanged: (String? v) {
                                      value.addRequirementModel
                                              .vehicleVariantId =
                                          value.variantModel?.bodyTypes
                                              ?.firstWhere((e) => e.name == v)
                                              .id;
                                    },
                                  );
                          }),
                      ValueListenableBuilder(
                          valueListenable: _modelNotifier,
                          builder: (context, v, child) {
                            return CustomDropDown(
                              text: 'Year',
                              label: 'Select Year',
                              items: years,
                              onChanged: (String? v) {
                                value.addRequirementModel.year =
                                    int.tryParse(v ?? '');
                              },
                            );
                          }),
                      TransmissionSelector(),
                      ValueListenableBuilder(
                          valueListenable: _variantNotifier,
                          builder: (context, v, child) {
                            return v
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CustomShimmerTextField(
                                      width: double.maxFinite,
                                      height: 60,
                                    ),
                                  )
                                : CustomDropDown(
                                    text: 'Fuel ',
                                    label: 'Select fuel type',
                                    items: value.variantModel?.fuelTypes
                                            ?.map((e) => e.name ?? '')
                                            .toList() ??
                                        [],
                                    onChanged: (String? v) {
                                      value.addRequirementModel.fuelTypeId =
                                          value.variantModel?.fuelTypes
                                              ?.firstWhere((e) => e.name == v)
                                              .id;
                                    },
                                  );
                          }),
                      CustomDropDown(
                        text: 'Color',
                        label: 'Select Color',
                        items: value.brandModel?.vehicleColors
                                ?.map((e) => e.name ?? '')
                                .toList() ??
                            [],
                        onChanged: (String? v) {
                          value.addRequirementModel.vehicleColorId = value
                              .brandModel?.vehicleColors
                              ?.firstWhere((e) => e.name == v)
                              .id;
                        },
                      ),
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
          onPressed: () async {
            if (_formKey.currentState != null &&
                _formKey.currentState!.validate()) {
              await provider.AddRequirement();
              provider.getVendorRequirements();
              for (int i = 0; i < 2; i++) {
                Navigator.pop(context);
              }
            }
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
  late final RequirementProvider provider;
  @override
  void initState() {
    provider = context.read<RequirementProvider>();
    // TODO: implement initState
    super.initState();
  }

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
                    provider.addRequirementModel.transmissionId = 1;
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
                          : const Color.fromARGB(255, 178, 178, 178),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAutomatic = false;
                    provider.addRequirementModel.transmissionId = 2;
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
                          : const Color.fromARGB(255, 178, 178, 178),
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

List<String> years = ['2020', '2021', '2022', '2023', '2024'];
