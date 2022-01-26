import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/widgets/forms.dart';
import 'package:image_picker/image_picker.dart';

String? userEmail;
String? userpassword;
String? dropdownValue = 'Individual';
String? propertyName;
String? lastName;

class PostPropertyPage extends StatelessWidget {
  const PostPropertyPage({Key? key}) : super(key: key);

  Future<void> imagePicker() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 50,
      maxHeight: 50,
      imageQuality: 100,
    );
  }

  static ValueNotifier<String?> v = ValueNotifier(dropdownValue);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyFormField(
          validator: (validate) {},
          formWidth: 350,
          onChanged: (name) {
            propertyName = name;
          },
          hintText: 'Property name',
          hintStyle: kGeneralHinrStyle,
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
        MyFormField(
          validator: (validate) {},
          formWidth: 350,
          onChanged: (lastname) {
            lastName = lastname;
          },
          hintText: 'Location',
          hintStyle: kGeneralHinrStyle,
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
        MyFormField(
          validator: (validate) {},
          formWidth: 350,
          onChanged: (email) {
            userEmail = email;
          },
          hintText: 'Price',
          hintStyle: kGeneralHinrStyle,
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
        MyTextArea(
          formHeight: 100,
          validator: (validate) {},
          formWidth: 350,
          obscureText: true,
          onChanged: (password) {
            userpassword = password;
          },
          hintText: 'Description',
          maxLines: null,
          keyBoardType: TextInputType.multiline,
          hintStyle: kGeneralHinrStyle,
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
        ValueListenableBuilder(
            valueListenable: v,
            builder: (BuildContext context, hasError, Widget? child) {
              return CustomDropDown(
                  color: Colors.grey.shade200,
                  dropdownValue: v.value,
                  onChanged: (value) {
                    v.value = value;
                  },
                  items: const [
                    "Individual",
                    'Property Owner',
                    'Estate Agent',
                    'Property Developer',
                    'Employer',
                    'Worker'
                  ]);
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: imagePicker,
            child: Container(
              height: 120,
              width: 120,
              decoration:
                  BoxDecoration(border: Border.all(color: kPrimaryBodyColor)),
              child: const Icon(Icons.photo_camera),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 20.0, right: 10),
          child: MyFormButton(
            width: double.infinity,
            height: 60,
            onPressed: () {},
            label: 'Post  property',
          ),
        ),
      ],
    );
  }
}
