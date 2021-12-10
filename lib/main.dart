import 'package:fancy_dialog/FancyAnimation.dart';
import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
  home: Home(),
    )
  );
}
class Home extends StatelessWidget {
  var mykey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mykey,
      appBar:AppBar(
        title: Text('my Dialog')
      ),
      body: Center(
        child:Column(
          children: [
            RaisedButton(
              child:Text('Alert Dialog'),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text('Deleting'),
                      content: Text('Are you want to delete?'),
                      actions: [
                        RaisedButton(
                          child:Text('close'),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        ),
                        RaisedButton(
                          child:Text('Delete'),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  }
                );
              },
            ),
            RaisedButton(
              child:Text('custom Dialog 1'),
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context){
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        height: 150,
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center ,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Save Data',
                            style: Theme.of(context).textTheme.headline,
                            textAlign: TextAlign.center,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText:'Enter your Data'
                                ),
                            ),
                            RaisedButton(
                              child:Text('save') ,
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              color: Colors.blue,
                            ),
                          ],
                          ),
                      ),
                     );
                  },);
              },
            ),
            RaisedButton(
              child:Text('custom Dialog 2'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return CustomDialog(
                      title:'To continue learn' ,
                      description: 'please share',
                      buttonText: 'Agree',
                      );
                  }
                  );
              },
            ),
            RaisedButton(
              child: Text('Full screen Dialog'),
              onPressed: (){
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                  barrierColor: Colors.black,
                  transitionDuration: Duration(microseconds: 200),
                  pageBuilder: (BuildContext context,Animation first,Animation second){
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 10,
                        height: MediaQuery.of(context).size.height - 80,
                        padding: EdgeInsets.all(20),
                        color: Colors.red,
                        child: Column(
                          children: [
                            Text('please share'),
                            RaisedButton(
                              child: Text('Exit'),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            RaisedButton(
              child: Text('External package Dialog'),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) => FancyDialog(
                    title: "Don't forget",
                    descreption: 'please share',
                    gifPath: FancyGif.CHECK_MAIL,
                    ok: 'Yes',
                    okColor: Colors.blue,
                    okFun: (){
                      print('yes was clicked');
                    },
                    animationType: FancyAnimation.BOTTOM_TOP,
                  ),
                );
              },
            ),
          ],
          ) ,
          ) ,
      );
  }
}
class Consts{
  static const double padding = 16;
  static const double avatar = 66;
  Consts._();
}
class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;
  CustomDialog({this.title,this.description,this.buttonText,this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(Consts.padding)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
  dialogContent(BuildContext context){
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatar + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatar),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(color: Colors.black,blurRadius:10,offset:Offset(0,10)),
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
              SizedBox(height: Consts.padding,),
              Text(description,textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
              SizedBox(height: 24,),
              Align(
                alignment:Alignment.bottomRight,
                child: FlatButton(
                  child:Text(buttonText),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
        Positioned(left: Consts.padding,right: Consts.padding,
        child: CircleAvatar(backgroundColor: Colors.blue,radius: Consts.avatar,),
        ),
      ],
    );
  }
}