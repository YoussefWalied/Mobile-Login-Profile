import 'package:assignment/colortemplate.dart';
import 'package:assignment/data_base.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  final dynamic data;

  const ProfileScreen({super.key, required this.data});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final dynamic result = widget.data;
  final picker = ImagePicker();
  final DataBase _db = DataBase();
  File? _image;
  bool _isEditing = false;
  final TextEditingController studentIdController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController levelController = TextEditingController();

  final TextEditingController genderController = TextEditingController();
  late String imageString = "";

  void getImagefromCamera() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    imageString = image!.path;
    _db.insertImage(img: imageString);
    print(imageString);
    if (image != null) {
      imageString = image.path;
      setState(() {
        _image = File(image.path);
        print(_image);
      });
    }
  }

  void getImageFromGallery() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imageString = image!.path;
    _db.insertImage(img: imageString);
    if (image != null) {
      imageString = image.path;
      setState(() {
        _image = File(image.path);
        print(_image);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    nameController.text = result["Name"];
    emailController.text = result["Email"];
    passwordController.text = result["Password"];
    studentIdController.text = result["StudId"];
    levelController.text = result["Level"];
    genderController.text = result["Gender"];
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    File file = File(result["image"]);
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left:99.0),
          child: Text('Profile', style: TextStyle(fontSize: 25)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _image != null
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(_image!),
                  )
                : CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(file),
                  ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: getImagefromCamera,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Add from Camera'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: getImageFromGallery,
              icon: const Icon(Icons.photo_library),
              label: const Text('Add from Gallery'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(25,0,0,0),
                child: Text(
                "Name",
                style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5,0,35, 7.5),
                child: Container(
                width: 270,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: _toggleEdit,
                  child: _isEditing
                    ? TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter name...',
                      contentPadding: EdgeInsets.symmetric(vertical: 9),
                      ),
                    )
                    : Text(
                      nameController.text,
                      style: const TextStyle(fontSize: 20),
                    ),
                ),
                ),
              ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(25,0,0,0),
                child: Text(
                "ID",
                style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5,7.5,35, 7.5),
                child: Container(
                width: 270,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: _toggleEdit,
                  child: _isEditing
                    ? TextFormField(
                      controller: studentIdController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter ID...',
                      contentPadding: EdgeInsets.symmetric(vertical: 9),
                      ),
                    )
                    : Text(
                      studentIdController.text,
                      style: const TextStyle(fontSize: 20),
                    ),
                ),
                ),
              ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(25,0,0,0),
                child: Text(
                "Email",
                style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5,7.5,35, 7.5),
                child: Container(
                width: 270,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: _toggleEdit,
                  child: _isEditing
                    ? TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter email...',
                      contentPadding: EdgeInsets.symmetric(vertical: 9),
                      ),
                    )
                    : Text(
                      emailController.text,
                      style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w400),
                    ),
                ),
                ),
              ),
              ],
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(25,0,0,0),
                child: Text(
                "Level",
                style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5,7.5,35, 7.5),
                child: Container(
                width: 270,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: _toggleEdit,
                  child: _isEditing
                    ? TextFormField(
                      controller: levelController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter level...',
                      contentPadding: EdgeInsets.symmetric(vertical: 9),
                      ),
                    )
                    : Text(
                      levelController.text,
                      style: const TextStyle(fontSize: 20),
                    ),
                ),
                ),
              ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(11,0,0,0),
                child: Text(
                "Password",
                style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5,7.5,35, 7.5),
                child: Container(
                width: 270,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: _toggleEdit,
                  child: _isEditing
                    ? TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter password...',
                      contentPadding: EdgeInsets.symmetric(vertical: 9),
                      ),
                    )
                    : Text(
                      passwordController.text,
                      style: const TextStyle(fontSize: 20),
                    ),
                ),
                ),
              ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(23,0,0,0),
                child: Text(
                "Gender",
                style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5,7.5,35, 7.5),
                child: Container(
                width: 270,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: _toggleEdit,
                  child: _isEditing
                    ? TextFormField(
                      controller: genderController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter gender...',
                      contentPadding: EdgeInsets.symmetric(vertical: 9),
                      ),
                    )
                    : Text(
                      genderController.text,
                      style: const TextStyle(fontSize: 20),
                    ),
                ),
                ),
              ),
              ],
            ),
            
            SizedBox(
              height: mediaQuery.size.height * 0.05,
            ),
            ElevatedButton(
              onPressed: () {
              updateName();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kSecondColor,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
              ),
              child: const Text('Edit Profile',style: TextStyle(fontSize: 18, color: kTextColorWhite),),
            ),
          ],
        ),
      ),
    );
  }

  void updateName() async {
    await _db.update(
        name: nameController.text,
        id: result["id"],
        studid: studentIdController.text,
        email: emailController.text,
        password: passwordController.text,
        level: levelController.text,
        gender: genderController.text,
        img: imageString);

    setState(() {
      _isEditing = false;
    });
  }
}