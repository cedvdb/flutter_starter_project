import 'package:easy_localization/easy_localization.dart';
import 'package:eureka_app/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CreateRestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        child: _CreateRestaurantCard(),
      ),
    );
  }
}

class _CreateRestaurantCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(Spacing.m),
        child: Column(
          children: [
            Text(
              tr('createRestaurant.Create Restaurant'),
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: Spacing.m,
            ),
            _RestaurantForm(),
            ButtonBar(
              children: [
                RaisedButton(
                  onPressed: () => {},
                  child: Text(
                    tr('createRestaurant.SAVE'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _RestaurantForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _fbKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          // FormBuilderTextField(
          //   attribute: 'name',
          //   decoration: InputDecoration(
          //     labelText: tr('createRestaurant.Name'),
          //     // border: OutlineInputBorder(),
          //   ),
          //   validators: [
          //     FormBuilderValidators.required(
          //         errorText: 'name must not be empty')
          //   ],
          // )
        ],
      ),
    );
  }
}
