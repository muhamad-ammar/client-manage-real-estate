import 'package:property_help/constants/routesNames.dart';
import 'package:property_help/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../Utils/appTheme.dart';
import '../../Utils/app_styles.dart';
import '../../Utils/uiUtils.dart';
import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../components/helper_methods.dart';
import '../../components/progressDialogue.dart';
import '../../constants/error_messages.dart';
import '../../data/response/status.dart';
import '../../view_model/auth_view_model.dart';
import '../../view_model/base_view_model.dart';


class SignInScreen extends StatefulWidget {
  int index, id;
  String route;

  SignInScreen({Key? key, this.index = 0, this.id = 0, this.route = ''}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _uiState = ValueNotifier(UiState.none);
  final _obscurePassword = ValueNotifier(true);
  AuthViewModel? _viewModel;
  // HomeViewModel? homeVM;
  // UserViewModel? _userViewModel;
  String? _email;
  String? _password;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _viewModel = Provider.of<AuthViewModel>(context, listen: false);
      // homeVM = Provider.of<HomeViewModel>(context, listen: false);
      // _userViewModel = Provider.of<UserViewModel>(context, listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [


        Expanded(
          child: Stack(
            children: [
              // IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.chevron_left, size: 35,)),
              _buildContent(),
              Consumer<AuthViewModel>(
                builder: (context, value, child) {
                  return ProgressDialog(visible: value.loading);

                },
              ),
            ],
          ),
        ),

      ],
    );
  }

  Widget _buildContent() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            UiUtils.getScreenWidth(context) * 0.05,
          ),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                Insets.gapH25,
                _buildEmail(),
                Insets.gapH15,
                _buildPassword(),
                Insets.gapH25,
                CustomButton(
                  "Login",
                  onPressed: _submit,
                  textColor: AppTheme.primaryTextColor,
                ),
                Insets.gapH20,

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(
        "Sign In",
        style: Textify.heading1,
      ),
    );
  }

  Widget _buildEmail() {
    return ValueListenableBuilder(
      valueListenable: _uiState,
      builder: (context, value, child) {
        return CustomTextField(
          labelText: "Username",
          hint: "Enter your username",
          prefixIcon: Icons.person,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: ErrorMessages.required("Username"),
            ),

          ]),
          onSaved: (newValue) {
            _email = newValue?.trim();
          },
        );
      },
    );
  }

  Widget _buildPassword() {
    return ValueListenableBuilder(
      valueListenable: _uiState,
      builder: (context, value, child) {
        return ValueListenableBuilder<bool>(
          valueListenable: _obscurePassword,
          builder: (context, value, child) {
            return CustomTextField(
              labelText: "Password",
              hint: "Enter your password",
              obscureText: value,
              prefixIcon: Icons.lock,
              suffixIcon:
              value ? Icons.remove_red_eye : Icons.close,
              onSuffixIconPressed: () {
                _obscurePassword.value = !value;
              },
              textInputAction: TextInputAction.done,
              validator: FormBuilderValidators.required(
                errorText: ErrorMessages.required("Password"),
              ),
              onSaved: (newValue) {
                _password = newValue?.trim();
              },
            );
          },
        );
      },
    );
  }



  Future<void> _submit() async {
    bool valid = _formKey.currentState?.validate() ?? false;
    if (valid) {
      Utils.removeCurrentFocus(context);
      _formKey.currentState?.save();

      final response = await _viewModel?.loginApi(_email, _password);
      if (!mounted) {
        return;
      }
      if (response?.status == Status.COMPLETED) {
        NavigationUtils.replace(context, RoutesName.home);

      } else {
        Utils.flushBarErrorMessage(response?.message, context);
      }
    } else {
      _uiState.value = UiState.error;
    }
  }
}
