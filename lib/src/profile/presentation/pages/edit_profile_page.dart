import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:path/path.dart' as path;

import '../../../../shared/theme/color_scheme.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumber = "";
  String country = '';
  String gender = '';

  bool isSavedToAccount = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  final isSaved = ValueNotifier<bool>(false);
  final isSaving = ValueNotifier<bool>(false);

  List<DropdownMenuItem> countrys = [
    const DropdownMenuItem(
      value: 'Ghana',
      child: Text('Ghana'),
    ),
    const DropdownMenuItem(value: 'Nigeria', child: Text('Nigeria'))
  ];

  List<DropdownMenuItem> genders = [
    const DropdownMenuItem(
      value: 'Male',
      child: Text('Male'),
    ),
    const DropdownMenuItem(value: 'Female', child: Text('Female'))
  ];

  File? _image;
  final picker = ImagePicker();
  String? _imageUrl;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  saveProfile() {
    FirebaseAuth _auth = FirebaseAuth.instance;
    String? userID = _auth.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: userID)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.update({
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'phone': phoneNumber,
          'email_address': emailAddressController.text,
          'date_of_birth': dateOfBirthController.text,
          'country': country,
          'gender': gender
        }).then((value) => isSaved.value == true);
      });
    });
  }

  getProfile() {
    FirebaseAuth _auth = FirebaseAuth.instance;
    String? userID = _auth.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: userID)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        firstNameController.text = doc['first_name'];
        lastNameController.text = doc['last_name'];
        phoneNumberController.text = doc['phone'];
        emailAddressController.text = doc['email_address'];
        dateOfBirthController.text = doc['date_of_birth'];
      });
    });
  }

  Future<void> _uploadImageToFirebase() async {
    if (_image != null) {
      // Get the file name without the extension
      String fileName = path.basenameWithoutExtension(_image!.path);
      // Get the file extension
      String fileExtension = path.extension(_image!.path);

      final storage = FirebaseStorage.instance;
      final reference =
          storage.ref().child('profile_pics/$fileName$fileExtension');

      // Upload the file to Firebase Storage
      final uploadTask = reference.putFile(_image!);

      // Get the download URL after the image is uploaded
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _imageUrl = downloadUrl;
      });

      print('Download URL: $_imageUrl');
    } else {
      print('No image selected.');
    }
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: lightColorScheme.primary),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('users')
            .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;

            return ListView(
              children: documents
                  .map((doc) => Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // const CircleAvatar(
                              //   radius: 60,
                              //   backgroundImage: AssetImage('assets/images/profile.png'),
                              // ),

                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: doc['profile_image_url'] == null ||
                                        doc['profile_image_url'] == ''
                                    ? Stack(children: [
                                        const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: AssetImage(
                                                'assets/images/profile.png')),
                                        Positioned(
                                            left: 65,
                                            top: 45,
                                            child: IconButton(
                                                onPressed: () async {
                                                  await _pickImage();
                                                  await _uploadImageToFirebase();
                                                  doc.reference.update({
                                                    'profile_image_url':
                                                        _imageUrl
                                                  });
                                                },
                                                icon: Icon(
                                                  IconlyBold.camera,
                                                  color:
                                                      lightColorScheme.primary,
                                                )))
                                      ])
                                    : Stack(children: [
                                        CircleAvatar(
                                            radius: 50,
                                            backgroundImage: NetworkImage(
                                                doc['profile_image_url'])),
                                        Positioned(
                                            left: 65,
                                            top: 45,
                                            child: IconButton(
                                                onPressed: () async {
                                                  await _pickImage();
                                                  _uploadImageToFirebase();
                                                  doc.reference.update({
                                                    'profile_image_url':
                                                        _imageUrl
                                                  });
                                                },
                                                icon: Icon(
                                                  IconlyBold.camera,
                                                  color:
                                                      lightColorScheme.primary,
                                                )))
                                      ]),
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Form(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Text(
                                          'First Name(*)',
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: firstNameController,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 14),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.lightBlue),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          fillColor: Colors.white,
                                        ),
                                      ),

                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 20, bottom: 5),
                                        child: Text(
                                          'Last Name(*)',
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: lastNameController,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 14),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.lightBlue),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          fillColor: Colors.white,
                                        ),
                                      ),

                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 20, bottom: 5),
                                        child: Text(
                                          'Email Address(*)',
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: emailAddressController,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 14),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.lightBlue),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          fillColor: Colors.white,
                                        ),
                                      ),

                                      //country
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 15, bottom: 5),
                                        child: Text(
                                          'Country',
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                      ),

                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: DropdownButtonFormField(
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 14),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              labelStyle:
                                                  TextStyle(color: Colors.grey),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.lightBlue),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              fillColor: Colors.white,
                                            ),
                                            hint: const Text('select country'),
                                            items: countrys,
                                            // value: widget.country,
                                            onChanged: (selectedCountry) =>
                                                country = selectedCountry),
                                      ),

                                      ///phone number
                                      ///

                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 15, bottom: 5),
                                        child: Text(
                                          'Contact number(*)',
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 1, bottom: 10),
                                          child: SizedBox(
                                            height: 50,
                                            child: IntlPhoneField(
                                                decoration: InputDecoration(
                                                    alignLabelWithHint: true,
                                                    focusedBorder: const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .lightBlue),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                    enabledBorder: const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      borderSide: BorderSide(
                                                          color: theme
                                                              .colorScheme
                                                              .error,
                                                          width: 2),
                                                    ),
                                                    filled: true,
                                                    fillColor: theme
                                                        .colorScheme.surface
                                                        .withOpacity(0.9)),
                                                controller:
                                                    phoneNumberController,
                                                showDropdownIcon: false,
                                                disableLengthCheck: true,
                                                // validator to check if length is 10

                                                flagsButtonPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                initialCountryCode: 'GH',
                                                // countries: const ['GH', 'NG', 'KE'],
                                                onChanged: (phone) {
                                                  phoneNumber =
                                                      phone.completeNumber;
                                                }),
                                          )),

                                      //date of birth
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 15, bottom: 5),
                                        child: Text(
                                          'Date of Birth',
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                      ),

                                      TextFormField(
                                        controller: dateOfBirthController,
                                        keyboardType: TextInputType.datetime,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 14),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.lightBlue),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          fillColor: Colors.white,
                                        ),
                                      ),

                                      //gender
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 15, bottom: 5),
                                        child: Text(
                                          'Gender',
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: DropdownButtonFormField(
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 14),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              labelStyle:
                                                  TextStyle(color: Colors.grey),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.lightBlue),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              fillColor: Colors.white,
                                            ),
                                            hint: const Text('select gender'),
                                            items: genders,
                                            onChanged: (selectedGender) =>
                                                gender = selectedGender),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Center(
                                          child: SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.45,
                                            child: ValueListenableBuilder(
                                              builder: (BuildContext context,
                                                  value, Widget? child) {
                                                return ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          lightColorScheme
                                                              .primary,
                                                      minimumSize:
                                                          const Size.fromHeight(
                                                              50),
                                                    ),
                                                    onPressed:
                                                        isSaving.value == true
                                                            ? null
                                                            : () async {
                                                                isSaving.value =
                                                                    true;
                                                                await saveProfile();

                                                                //show snackbar
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        SnackBar(
                                                                  backgroundColor:
                                                                      Colors.green[
                                                                          300],
                                                                  content:
                                                                      const Text(
                                                                    'Profile update successful',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  behavior:
                                                                      SnackBarBehavior
                                                                          .floating,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                  ),
                                                                  margin: EdgeInsets.only(
                                                                      bottom: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.82,
                                                                      right: 20,
                                                                      left: 20),
                                                                ));

                                                                isSaving.value =
                                                                    false;
                                                              },
                                                    child:
                                                        isSaving.value == false
                                                            ? const Text('Save')
                                                            : const Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10,
                                                                        vertical:
                                                                            1),
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                      'Saving...')
                                                                ],
                                                              ));
                                              },
                                              valueListenable: isSaving,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            );
          } else {
            if (snapshot.hasError) {
              return Text('Error');
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
