import 'package:flutter/material.dart';
import 'package:resmart/components/product_list.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/model/job_model.dart';
import 'package:resmart/utils/api_service.dart';

class JobList extends StatefulWidget {
  const JobList({Key? key}) : super(key: key);

  @override
  State<JobList> createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  final ApiService apiService = ApiService();
  JobModel? jobModel;
  List<JobModel> jobList = [];
  Future<dynamic> getJobs() async {
    var response = await apiService.getAllJobs();
    //print('data: ${response.data['data']["activejob"]}');

    return response.data;
  }

  bool isLoading = false;
  @override
  void initState() {
    getJobs().then((value) {
      var data = value['data']["activeJob"];
      for (var item in data) {
        setState(() {
          jobList.add(JobModel.fromJson(item));
          isLoading = true;
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (jobList == []) {
      return const Scaffold(
        body: Center(
          child: Text('No Job available at the moment. \nTry Again')
        ),
      );
    } else {
      return !isLoading ? const Center(
          child: CircularProgressIndicator(
            color:  Colors.amber,
          ),
        ) : ListView.builder(
        itemCount: jobList.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductList(
            productImagee: jobList[index].jobImage.first,
            onTapCard: () {},
            productLocation: jobList[index].jobLocation,
            productPrice: jobList[index].jobPrice,
            productTitle: jobList[index].jobName,
            onCall: () {},
            onChat: () {},
          );
        },
      );
    }
  }
}
