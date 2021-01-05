import 'package:easy_localization/easy_localization.dart';
import 'package:eureka_app/data/state/user/user_cubit.dart';
import 'package:eureka_app/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:eureka_app/ui/widgets/_index.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'create_restaurant_cubit.dart';

class CreateRestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(Spacing.l),
          child: Column(
            children: [
              Text(
                tr('createRestaurant.Create Restaurant'),
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: Spacing.m,
              ),
              BlocConsumer<CreateRestaurantCubit, CreationState>(
                cubit: CreateRestaurantCubit(),
                builder: (context, state) {
                  switch (state.status) {
                    case CreationStatus.uncreated:
                      return CreateRestaurantForm(
                        onSubmit: (String name) => context
                            .read<CreateRestaurantCubit>()
                            .create(name: name),
                      );
                    default:
                      return SpinKitCircle();
                  }
                },
                listener: (context, state) {
                  if (state.status == CreationStatus.created) {
                    context
                        .read<UserCubit>()
                        .setSelectedRestaurant(state.restaurant.id);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

typedef OnSubmit(String name);

class CreateRestaurantForm extends StatelessWidget {
  final OnSubmit onSubmit;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  CreateRestaurantForm({this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _fbKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          FormBuilderTextField(
            name: 'name',
            decoration: InputDecoration(
              labelText: tr('createRestaurant.Name'),
              // border: OutlineInputBorder(),
            ),
            validator: FormBuilderValidators.required(
              context,
              errorText: 'name must not be empty',
            ),
          ),
          ButtonBar(
            children: [
              RaisedButton(
                onPressed: () {
                  if (_fbKey.currentState.saveAndValidate()) {
                    String name = _fbKey.currentState.value['name'];
                    onSubmit(name);
                  }
                },
                child: Text(
                  tr('createRestaurant.SAVE'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
