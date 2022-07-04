import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../cars/available_cars_screen.dart';
import '../profile/profile_screen.dart';

class BookNowScreen extends StatefulWidget {
  static const routeName = '/book-now';
  const BookNowScreen({Key? key}) : super(key: key);

  @override
  _BookNowScreenState createState() => _BookNowScreenState();
}

class _BookNowScreenState extends State<BookNowScreen> {
  // DateTime _selectedDate;
  List<String> items = ['methos of payment','Cash','Momo'];
  String? selectedItem= 'methos of payment';

  DateTime date = DateTime.now();

  TimeOfDay time = TimeOfDay.now();

  //form key
  final _formkey = GlobalKey<FormState>();
  //ediiting controller
  final nameEditingController  = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final phoneNumberEditingController  = new TextEditingController();
  final dateEditingController = new TextEditingController();
  final timeEditingController = new TextEditingController();
  final carBrandEditingController = new TextEditingController();
  final paymentEditingController = new TextEditingController();

bool loading =false;
void launchWhatsapp({required number, @required message})async{
var url ="whatsapp://send?phone=$number&text=$message";

  // await canLaunchUrl(url) ? launch(url) : print ("cant open");


}
  @override
  Widget build(BuildContext context) {

    //nameField
    final nameField =TextFormField(

      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.emailAddress,

      // validator: () {},
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return (" Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return (" Valid name(Min. 3 Character)");
        }
        return null;
      },


      onSaved :(value){
        nameEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

          hintText: "Name",
          prefixIcon: Icon(
            Icons.person,
            color: Color(0xffCEA110),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

    );
    final emailField =TextFormField(

      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,

      // validator: () {},
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved :(value){
        emailEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

          hintText: "email",
          prefixIcon: Icon(
            Icons.email,
            color: Color(0xffCEA110),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

    );

    //phoneNumberField
    final phoneNumberField =TextFormField(

      autofocus: false,
      controller: phoneNumberEditingController,
      keyboardType: TextInputType.emailAddress,

      // validator: () {},
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your phone number");
        }
        // reg expression for email validation
        if (!RegExp("^[0-9+_.-]")
            .hasMatch(value)) {
          return ("Please Enter a valid phone number");
        }
        return null;
      },
      onSaved :(value){
        phoneNumberEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

          hintText: "phone number",
          prefixIcon: Icon(
            Icons.call,
            color: Color(0xffCEA110),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

    );
    //carBrandField
    final carBrandField =TextFormField(

      autofocus: false,
      controller: carBrandEditingController,
      keyboardType: TextInputType.emailAddress,

      // validator: () {},
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]")
            .hasMatch(value)) {
          return ("Please Enter a valid brand");
        }
        return null;
      },
      onSaved :(value){
        carBrandEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

          hintText: "brand",
          prefixIcon: Icon(
            Icons.email,
            color: Color(0xffCEA110),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

    );
    final dateField =TextFormField(


      autofocus: false,
      controller: dateEditingController,

        textAlignVertical: TextAlignVertical.center,


      onTap: () async{
        DateTime? newDate= await  showDatePicker(
            context: context,
            initialDate: date,

            firstDate: DateTime(2022),
            lastDate: DateTime(2025));
        // if cancle button
        if(newDate == null)return;


        //if ok =>Dtaetime
        setState(() {
          Timestamp myTimeStamp =Timestamp.fromDate(date);
          DateTime myDateTime = myTimeStamp.toDate();
          date =newDate;
        });
      },


      onSaved :(value){
        dateEditingController.text=value!;
      },

      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "${date.day}/${date.month}/${date.year}",
        //     counterText: "${date.day}/${date.month}/${date.year}",

            // counterText: "${date.day}/${date.month}/${date.year}",

          // prefixIcon: Icon(
          //   Icons.email,
          //   color: Color(0xffCEA110),
          // ),
          contentPadding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

    );
    final timeField =TextFormField(

      autofocus: false,
      controller: timeEditingController,
      keyboardType: TextInputType.emailAddress,



      onTap: () async {
        TimeOfDay? newTime= await   showTimePicker(context: context, initialTime: time);
        if(newTime== null)return;
        setState(() {
          time = newTime;
        });
      },

      // validator: () {},
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter the time");
        }
        // reg expression for email validation
        if (!RegExp("^[^[0-9+_.-]")
            .hasMatch(value)) {
          return ("Please Enter a valid time");
        }
        return null;
      },
      onSaved :(value){
        timeEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

          hintText:  '${time.hour} : ${time.minute} ${time.period.name} ',
          // prefixIcon: Icon(
          //   Icons.email,
          //   color: Color(0xffCEA110),
          // ),
          contentPadding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

    );
    final paymentField =TextFormField(

      autofocus: false,
      controller: paymentEditingController,
      keyboardType: TextInputType.emailAddress,

      // validator: () {},
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return ("Please Enter Your Email");
      //   }
      //   // reg expression for email validation
      //   if (!RegExp("^[a-zA-Z0-9+_.-]")
      //       .hasMatch(value)) {
      //     return ("Please Enter a valid brand");
      //   }
      //   return null;
      // },
      onSaved :(value){
        paymentEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

          hintText: "payment method",
          prefixIcon: Icon(
            Icons.attach_money,
            color: Color(0xffCEA110),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

    );
    final bookButton= Material(

      elevation: 8,
      borderRadius: BorderRadius.circular(30),

      color: Color(0xffCEA110),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

        minWidth: 350,
        onPressed:() {
          Map <String,dynamic> data ={"name":nameEditingController.text,"email":emailEditingController.text,"phoneNumber":phoneNumberEditingController.text,"brand":carBrandEditingController.text,"date":dateEditingController.text,"time":timeEditingController.text};
          FirebaseFirestore.instance.collection("reserve").add(data);
        },
        child: Text("Reserve",textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Container(
                //   child: Image.asset("assets/logo.png"),
                // ),
                SizedBox(height: 50,),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [

                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AvailableCarsScreen()));

                          // Navigator.pushNamed(context, AvailableCarsScreen.routeName);
                        },
                        child:   const Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Color(0xffCEA110),
                        ),
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ProfileScreen.routeName);
                        },
                        child:  const Icon(
                          Icons.person,
                          size: 20,
                          color: Color(0xffCEA110),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20, top: 20),
                        alignment: Alignment.center,
                        child: const Text(
                          "RÉSERVE",
                          style: TextStyle(fontSize: 20, color: const Color(0xffCEA110), fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),

                      SizedBox(height: 20,),
                      Container(

                        // decoration: BoxDecoration(
                        //
                        //     color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                        //   BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(1, 1), color: Colors.grey.withOpacity(0.3))
                        // ]),
                        child: nameField,
                      ),

                      SizedBox(height: 20,),
                      Container(
                        // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                        //   BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(1, 1), color: Colors.grey.withOpacity(0.2))
                        // ]),
                        child:emailField,
                      ),
                      SizedBox(height: 30,),
                      Container(
                        // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                        //   BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(1, 1), color: Colors.grey.withOpacity(0.2))
                        // ]),
                        child:phoneNumberField,
                      ),
                      SizedBox(height: 30,),
                      Container(
                        // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                        //   BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(1, 1), color: Colors.grey.withOpacity(0.2))
                        // ]),
                        child:carBrandField,
                      ),
                      SizedBox(height: 30,),



                      Row(
                        children: [
                          GestureDetector(

                            onTap: () async{
                              DateTime? newDate= await  showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2025));
                              // if cancle button
                              if(newDate == null)return;

                              //if ok =>Dtaetime
                              setState(() {
                                date =newDate;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: w * 0.4,
                              height: h * 0.065,
                              margin: const EdgeInsets.only( top: 10),
                              // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                              //   BoxShadow(
                              //       blurRadius: 10, spreadRadius: 7, offset: const Offset(1, 1), color: Colors.grey.withOpacity(0.2))
                              // ]),
                              child: dateField
                            ),
                          ),
                          Expanded(child: Container()),
                          SizedBox(width: 5,),

                          GestureDetector(

                            onTap: () async {
                              TimeOfDay? newTime= await   showTimePicker(context: context, initialTime: time);
                              if(newTime== null)return;
                              setState(() {
                                time = newTime;
                              });
                            },
                            child: Container(

                              alignment: Alignment.center,
                              width: w * 0.4,
                              height: h * 0.065,
                              margin: const EdgeInsets.only(top: 10, right: 20),
                              // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                              //   BoxShadow(
                              //       blurRadius: 10, spreadRadius: 7, offset: const Offset(1, 1), color: Colors.grey.withOpacity(0.2))
                              // ]),
                              child: timeField
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      // Container(
                      //
                      //   // decoration: BoxDecoration(
                      //   //
                      //   //     color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                      //   //   BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(1, 1), color: Colors.grey.withOpacity(0.3))
                      //   // ]),
                      // child: Container(
                      //   width: 280,
                      //   padding: EdgeInsets.only(left: 20,right: 20),
                      //   child: DropdownButton<String>(
                      //     value: selectedItem,
                      //     items: items.map((item) => DropdownMenuItem<String>(
                      //       value: item,
                      //       child: Text(item),
                      //     )).toList(),
                      //     onChanged: (item) => setState(() {
                      //       selectedItem=item;
                      //     }),
                      //   ),
                      // ),
                      // ),

            Row(
                children: [
                  Container(
                    width: 200,
                    child:  loading ? CircularProgressIndicator(): Container(
                      child: bookButton,),
                  ),
                  SizedBox(width: 13,),
                  Container(
                    child: Text(
                      "ou",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 13,),

                  Container(
                    child: Image.asset('assets/images/calls.png'),
                  )
                ],
            ),

                      // loading ? CircularProgressIndicator(): Container(
                      //   child: bookButton,),
                    ],
                  ),
                ),
                SizedBox(height: 13,),
                // Container(
                //   child: Text(
                //     "ou",
                //     style: TextStyle(
                //       fontSize: 20,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),



              ],),
          ),

        ),

      ),



    );

  }
}


