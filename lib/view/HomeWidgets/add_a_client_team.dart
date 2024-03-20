import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:property_help/components/custom_button.dart';
import 'package:provider/provider.dart';

import '../../Utils/appTheme.dart';
import '../../Utils/app_styles.dart';
import '../../Utils/input_field_utils.dart';
import '../../Utils/uiUtils.dart';
import '../../components/custom_textfield.dart';
import '../../components/helper_methods.dart';
import '../../components/progressDialogue.dart';
import '../../constants/app_constants.dart';
import '../../constants/error_messages.dart';
import '../../data/model/registerRequest.dart';
import '../../view_model/auth_view_model.dart';
import '../../view_model/base_view_model.dart';

class AddAClientOrTeam extends StatefulWidget {
  String? type;

  AddAClientOrTeam({super.key, this.type = "Client"});

  @override
  State<AddAClientOrTeam> createState() => _AddAClientOrTeamState();
}

class _AddAClientOrTeamState extends State<AddAClientOrTeam> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _uiState = ValueNotifier(UiState.none);
  final _password = ValueNotifier<String?>(null);
  final _obsecurePassword = ValueNotifier(true);
  final _obsecureConfirmPassword = ValueNotifier(true);
  final _countryController = TextEditingController();
  final _request = RegisterRequest();
  AuthViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _viewModel = Provider.of<AuthViewModel>(context, listen: false);
    });
  }

  @override
  void dispose() {
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _onBackPressed();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.primaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.chevron_left,
                size: 30,
                color: AppTheme.primaryTextColor,
              )),
          title: Text(
            "Add a ${widget.type}",
            style: Textify.title1.copyWith(color: AppTheme.primaryTextColor),
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 30,
      ),
      child: Stack(
        children: [
          widget.type == "Client" ? _buildClientContent() : _buildTeamContent(),
          Consumer<AuthViewModel>(
            builder: (context, value, child) {
              return ProgressDialog(visible: value.loading);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildClientContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(UiUtils.getScreenWidth(context) * 0.05),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _buildDescription(),
              _buildFullName(),
              Insets.gapH15,
              _buildEmail(),
              // Insets.gapH15,
              // _buildPassword(),
              Insets.gapH15,
              _buildMobile1(),
              Insets.gapH15,
              _buildMobile2(),
              Insets.gapH15,
              _buildClientStatus(),
              Insets.gapH15,
              _buildTextArea(),
              Insets.gapH15,

              CustomButton(
                "Add ${widget.type}",
                textColor: AppTheme.primaryTextColor,
              ),
              // Insets.gapH15,
              // _buildGender(),
              // Insets.gapH15,
              // _buildEmploymentStatus(),
              // Insets.gapH20,
              // _buildRouteToLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(UiUtils.getScreenWidth(context) * 0.05),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _buildDescription(),
              _buildUsername(),
              Insets.gapH15,
              _buildFirstName(),
              Insets.gapH15,
              _buildLastName(),
              Insets.gapH15,
              _buildEmail(),
              Insets.gapH15,
              _buildPassword(),
              Insets.gapH15,
              _buildMobile1(),
              Insets.gapH15,
              _buildMobile2(),
              Insets.gapH15,
              _buildEmploymentStatus(),
              Insets.gapH15,
              CustomButton(
                "Register ${widget.type}",
                textColor: AppTheme.primaryTextColor,
              ),
              // Insets.gapH15,
              // _buildGender(),
              // Insets.gapH15,
              // _buildEmploymentStatus(),
              // Insets.gapH20,
              // _buildRouteToLogin(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildTitle() {
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width,
  //     child: Row(
  //       children: [
  //
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildDescription() {
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width,
  //     child: Text(
  //       Strings.signUpDescription,
  //       style: Textify.paragraph1.copyWith(color: AppTheme.descriptionColor),
  //     ),
  //   );
  // }

  Widget _buildUsername() {
    return ValueListenableBuilder(
      valueListenable: _uiState,
      builder: (context, value, child) {
        return CustomTextField(
          labelText: "Username",
          hint: "Enter Username",
          prefixIcon: Icons.person_pin_rounded,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: ErrorMessages.required("Username"),
            ),
            FormBuilderValidators.minLength(8,
                errorText:
                    '${"Username"} ${"The length should be at least 8 Characters"}')
          ]),
          onSaved: (newValue) {
            _request.login = newValue?.trim();
          },
        );
      },
    );
  }

  Widget _buildFirstName() {
    return ValueListenableBuilder(
      valueListenable: _uiState,
      builder: (context, value, child) {
        return CustomTextField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
          ],
          labelText: "First Name",
          hint: "Enter your first name",
          prefixIcon: Icons.person_pin,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: ErrorMessages.required("First Name"),
            ),
            FormBuilderValidators.maxLength(20,
                errorText: '${"First Name"} ${"Enter at most 20 Characters"}')
          ]),
          onSaved: (newValue) {
            _request.firstName = newValue?.trim();
          },
        );
      },
    );
  }

  Widget _buildFullName() {
    return ValueListenableBuilder(
      valueListenable: _uiState,
      builder: (context, value, child) {
        return CustomTextField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
          ],
          labelText: "Client Name",
          hint: "Enter your Client full name",
          prefixIcon: Icons.person_pin,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: ErrorMessages.required("Full Name"),
            ),
            FormBuilderValidators.maxLength(100,
                errorText: '${"First Name"} ${"Enter at most 70 Characters"}')
          ]),
          onSaved: (newValue) {
            _request.firstName = newValue?.trim();
          },
        );
      },
    );
  }

  Widget _buildTextArea() {
    return ValueListenableBuilder(
      valueListenable: _uiState,
      builder: (context, value, child) {
        return Column(
          children: [
            InputFieldUtils.labelText(context, "Description / Comment"),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
              decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.grayColor),
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                maxLines: null,
                minLines: 3,
                style: Textify.hint.copyWith(color: AppTheme.primaryTextColor),
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ],
        );
        return CustomTextField(
          showSuffix: false,
          maxLines: null,
          autoValidateMode: AutovalidateMode.disabled,
          labelText: "Description / Comment",
          hint: "Enter your Client full name",
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.maxLength(1000,
                errorText:
                    '${"Description "} ${"Enter at most 1000 Characters"}')
          ]),
          onSaved: (newValue) {
            _request.description = newValue?.trim();
          },
        );
      },
    );
  }

  Widget _buildMobile1() {
    return ValueListenableBuilder(
      valueListenable: _uiState,
      builder: (context, value, child) {
        return CustomTextField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[+0-9 ]')),
          ],
          labelText: "Mobile Number 1",
          hint: "+923XXXXXXXXX",
          prefixIcon: Icons.phone,
          // You might want to use a phone icon here
          keyboardType: TextInputType.phone,
          // Set keyboard type to phone
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: ErrorMessages.required("Mobile Number"),
            ),
            // Optional: Length validation
            FormBuilderValidators.maxLength(14,
                errorText: 'Mobile number should be at max 14 digits'),
          ]),
          onSaved: (newValue) {
            _request.mobile1 = newValue?.trim();
          },
        );
      },
    );
  }

  Widget _buildMobile2() {
    return ValueListenableBuilder(
      valueListenable: _uiState,
      builder: (context, value, child) {
        return CustomTextField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[+0-9 ]')),
          ],
          labelText: "Mobile Number 2",
          hint: "+923XXXXXXXXX",
          prefixIcon: Icons.phone,
          // You might want to use a phone icon here
          keyboardType: TextInputType.phone,
          // Set keyboard type to phone
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            // FormBuilderValidators.required(
            //   errorText: ErrorMessages.required("Mobile Number"),
            // ),
            // Optional: Length validation
            FormBuilderValidators.maxLength(14,
                errorText: 'Mobile number should be at max 14 digits'),
          ]),
          onSaved: (newValue) {
            _request.mobile2 = newValue?.trim();
          },
        );
      },
    );
  }

  Widget _buildLastName() {
    return ValueListenableBuilder(
      valueListenable: _uiState,
      builder: (context, value, child) {
        return CustomTextField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
          ],
          labelText: "Last Name",
          hint: "Last Name",
          prefixIcon: Icons.person,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: ErrorMessages.required("Last Name"),
            ),
            FormBuilderValidators.maxLength(20,
                errorText: '${"Last Name"} ${"Enter at most 20 Characters"}')
          ]),
          onSaved: (newValue) {
            _request.lastName = newValue?.trim();
          },
        );
      },
    );
  }

  Widget _buildEmail() {
    return ValueListenableBuilder(
      valueListenable: _uiState,
      builder: (context, value, child) {
        return CustomTextField(
          labelText: "Email",
          hint: "Enter Email",
          prefixIcon: Icons.mail,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return null; // No value entered, so no validation error
            }
            if (!isEmailValid(value!)) {
              return ErrorMessages.email();
            }
            return null; // Return null if the input is valid
          },
          onSaved: (newValue) {
            _request.email = newValue?.trim();
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
          valueListenable: _obsecurePassword,
          builder: (context, value, child) {
            return CustomTextField(
              labelText: "Password",
              hint: "Enter a password",
              obscureText: value,
              prefixIcon: Icons.lock,
              suffixIcon: value ? Icons.lock : Icons.lock_open,
              onSuffixIconPressed: () {
                _obsecurePassword.value = !value;
              },
              textInputAction: TextInputAction.next,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  errorText: ErrorMessages.required("Password"),
                ),
                FormBuilderValidators.match(
                  AppConstants.regexPassword,
                  errorText: ErrorMessages.password(),
                ),
              ]),
              onChanged: (value) {
                _password.value = value?.trim();
              },
            );
          },
        );
      },
    );
  }

  bool isEmailValid(String value) {
    // Regular expression for email validation
    const emailRegex = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    final regExp = RegExp(emailRegex);
    return regExp.hasMatch(value);
  }

  Widget _buildEmploymentStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputFieldUtils.labelText(context, "Role"),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: AppTheme.grayColor),
              borderRadius: BorderRadius.circular(15)),
          child: ValueListenableBuilder(
            valueListenable: _uiState,
            builder: (context, value, child) {
              return DropdownButtonFormField2<String>(
                isDense: true,
                decoration: InputDecoration(border: InputBorder.none),
                value: "sales",
                hint: Text('Select Employment Status'),
                items: [
                  DropdownMenuItem<String>(
                    value: 'admin',
                    child: Text('Admin'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'manager',
                    child: Text('Manager'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'entryperson',
                    child: Text('Entry Person'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'sales',
                    child: Text('Sales'),
                  ),
                ],
                validator: (value) =>
                    value == null ? 'Please select an employment status' : null,
                onChanged: (newValue) {
                  _request.role = newValue?.trim();
                  print(_request.role);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildClientStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputFieldUtils.labelText(context, "Client Status"),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: AppTheme.grayColor),
              borderRadius: BorderRadius.circular(15)),
          child: ValueListenableBuilder(
            valueListenable: _uiState,
            builder: (context, value, child) {
              return DropdownButtonFormField2<String>(
                isDense: true,
                decoration: InputDecoration(border: InputBorder.none),
                value: "P1",
                hint: Text('Select Employment Status'),
                items: [
                  DropdownMenuItem<String>(
                    value: 'P1',
                    child: Text('Initial'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'P2',
                    child: Text('Stage 2'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'P3',
                    child: Text('Stage 3'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'dead',
                    child: Text('Dead'),
                  ),
                ],
                validator: (value) =>
                    value == null ? 'Please select an employment status' : null,
                onChanged: (newValue) {
                  _request.role = newValue?.trim();
                  print(_request.role);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future<bool> _onBackPressed() async {
    return await Utils.onBackPressed(
      context,
      _viewModel?.loading,
    );
  }

  // Future<void> _submit() async {
  //   bool valid = _formKey.currentState?.validate() ?? false;
  //   if (valid) {
  //     Utils.removeCurrentFocus(context);
  //     _formKey.currentState?.save();
  //
  //     final response = await _viewModel?.register(_request);
  //     if (!mounted) {
  //       return;
  //     }
  //     if (response?.status == Status.COMPLETED) {
  //       _resetFields();
  //       Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) => OTPScreen(
  //             request: _request, )));
  //     } else {
  //       Utils.flushBarErrorMessage(response?.message, context);
  //     }
  //   } else {
  //     _uiState.value = UiState.error;
  //   }
  // }

  void _resetFields() {
    _formKey.currentState?.reset();
    _countryController.text = "";
  }
}
