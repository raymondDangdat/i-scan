import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/state_and_city_provider.dart';
import '../resources/constants/color_constants.dart';
import 'components.dart';
import 'modals/select_city_modal.dart';

class CitySelectionDropdownWidget extends StatelessWidget {
  const CitySelectionDropdownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StateAndCityProvider>(
        builder: (ctx, stateCityProvider, child) {
      return CustomDropdownWithLabelButton(
        isRequired: false,
        text: stateCityProvider.selectedCity == null
            ? "Select LGA"
            : stateCityProvider.selectedCity?.name,
        label: "",
        onTap: () async {
          if (stateCityProvider.selectedState == null) {
            //  Do nothing as no state is selected
          } else {
            stateCityProvider.getListOfCities();
            showCitySelectionModal(context);
          }
        },
        textColor:
            stateCityProvider.selectedCity == null ? hintTextColor : black,
      );
    });
  }
}
