import 'package:cerebranium/helper/storeDetails.dart';
import 'package:cerebranium/helper/validator.dart';
import '../widgets/text-input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Form_Screen extends StatefulWidget {
  @override
  Form_ScreenState createState() => Form_ScreenState();
}

class Form_ScreenState extends State<Form_Screen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController accountController = new TextEditingController();
  final TextEditingController contactController = new TextEditingController();
  final TextEditingController ifsccontroller = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.purple,
                  Colors.blue.shade900,
                  Colors.cyan
                ])),
          ),
          ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/cerebranium.png'),
                        fit: BoxFit.scaleDown)),
                height: 70,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextInput(
                        controller: nameController,
                        icon: FontAwesomeIcons.user,
                        validation: (value) {
                          return Validator.namevalidate(value);
                        },
                        hint: 'Name',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                      ),
                      TextInput(
                        validation: (value) {
                          return Validator.emailvalidate(value);
                        },
                        controller: emailController,
                        icon: Icons.mail,
                        hint: 'Enter Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      TextInput(
                        validation: (value) {
                          return Validator.accountvalidate(value);
                        },
                        controller: accountController,
                        icon: Icons.menu,
                        hint: 'Enter account number',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                      ),
                      TextInput(
                        validation: (value) {
                          return Validator.phonenumbervalidate(value);
                        },
                        controller: contactController,
                        icon: FontAwesomeIcons.phone,
                        hint: 'Enter Phone Number',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                      ),
                      TextInput(
                        validation: (value) {
                          return Validator.ifscvalidate(value);
                        },
                        icon: Icons.menu,
                        hint: 'Enter IFSC code',
                        controller: ifsccontroller,
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 10,
                            primary: Colors.cyan,
                            onPrimary: Colors.purple),
                        child: Text(
                          "Submit",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          validateAndSave();
                          if (validateAndSave()) {
                            AddDetails.addDetails(
                                nameController.text.trim(),
                                emailController.text.trim(),
                                accountController.text.trim(),
                                contactController.text.trim(),
                                ifsccontroller.text.trim(),
                                context);
                            formKey.currentState.reset();
                            nameController.clear();
                            emailController.clear();
                            accountController.clear();
                            contactController.clear();
                            ifsccontroller.clear();
                          } else
                            print("Form not stored");
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
