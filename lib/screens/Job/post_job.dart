import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/screens/HomePage/home.dart';
import 'package:resmart/utils/api_service.dart';
import 'package:resmart/widgets/forms.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


String? price;
String? desc;
String? category = 'Individual';
String? propertyName;
String? location;
List<String> image = [];

class JobPostingPage extends StatelessWidget  with ChangeNotifier{
   JobPostingPage({Key? key}) : super(key: key);

  Future<void> imagePicker() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 50,
      maxHeight: 50,
      imageQuality: 50,
    );
    image.add(photo!.path.toString());
    
    notifyListeners();
  }

  static ApiService apiService = ApiService();
  static GlobalKey<FormState> formState = GlobalKey<FormState>();

  static ValueNotifier<String?> v = ValueNotifier(category);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyFormField(
            validator: (validate) {},
            formWidth: 350,
            onChanged: (name) {
              propertyName = name;
            },
            hintText: 'Job name',
            hintStyle: kGeneralHinrStyle,
            filled: true,
            fillColor: Colors.grey.shade200,
          ),
          MyFormField(
            validator: (validate) {},
            formWidth: 350,
            onChanged: (val) {
              location = val;
            },
            hintText: 'Location',
            hintStyle: kGeneralHinrStyle,
            filled: true,
            fillColor: Colors.grey.shade200,
          ),
          MyFormField(
            validator: (validate) {},
            formWidth: 350,
            onChanged: (val) {
              price = val;
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
            onChanged: (val) {
              desc = val;
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
                      'job Agent',
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
              onPressed: () async {
                if (formState.currentState!.validate()) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  String? userToken = prefs.getString('token');
                  var response = await apiService.postJob(
                      jobStatus: 'active',
                      jobCategory: category,
                      jobDesc: desc,
                      jobImage: image,
                      jobLocation: location,
                      jobName: propertyName,
                      jobPrice: int.parse(price!),
                      token: userToken);

                  if (response.statusCode == 200 ||
                      response.statusCode == 201 ||
                      response.statusCode == 202) {
                    await Fluttertoast.showToast(
                        msg: response.data["response_message"].toString(),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: kPrimaryBodyColor,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                    return;
                  }
                  if (response.statusCode == 400 ||
                      response.statusCode == 401 ||
                      response.statusCode == 500) {
                    await Fluttertoast.showToast(
                        msg: response.data["response_message"].toString(),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: kPrimaryBodyColor,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    return;
                  }
                }
              },
              label: 'Post Job',
            ),
          ),
        ],
      ),
    );
  }
}
