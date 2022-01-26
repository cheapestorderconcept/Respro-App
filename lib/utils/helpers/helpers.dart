import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';

class Helpers {
  final BuildContext context;

  Helpers(this.context);

  Future<Null> showProgress(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: AbsorbPointer(
              child: Container(
                 width: 80,
                height: 80,
               color: kPrimaryBodyColor,
                child: Center(
                  child: SizedBox(
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Center(
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            backgroundColor: kPrimaryBodyColor,
                            strokeWidth: 2.0,
                            valueColor: AlwaysStoppedAnimation(
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
  
  Future<void> showError(BuildContext context, String msg) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.only(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
            ),
            children: <Widget>[
              Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.stop_circle,
                      color: Colors.white,
                      size: 50,
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 12,
                  bottom: 12,
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        msg,
                        style: const TextStyle(
                            fontSize: 22, fontFamily: "SourceSansPro-Light"),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                        bottom: 10,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
