// import 'package:flutter/material.dart';

// import '../../../../shared/data/svg_assets.dart';
// import '../../../sign_up/presentation/pages/sign_up_page.dart';

// class SignInPage extends StatefulWidget {
//   const SignInPage({Key? key}) : super(key: key);

//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final formKey = GlobalKey<FormState>();


//   late TextEditingController phoneNumberController = TextEditingController();
//   late String email;
//   late String password = '';

//   ///Google SignIn button pressed
//   final googleSignInButtonPressed = ValueNotifier<bool>(false);

//   /// form submitted
//   final showSubmitButton = ValueNotifier<bool>(true);

//   /// AutoFocus node
//   late FocusNode focusNode;

 
  

//   @override
//   void initState() {
//     super.initState();
//     focusNode = FocusNode();
   
//   }

//   @override
//   void dispose() {
//     focusNode.dispose();
//     // phoneNumberController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//         body: SafeArea(
//             minimum: const EdgeInsets.symmetric(horizontal: 20),
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
            
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(SvgAssets.signInSvg),
            
//                         Text('Welcome Back',style:theme.textTheme.titleLarge?.copyWith(fontSize: 30,fontWeight: FontWeight.bold) ,),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Text('Log in to access quality healthcare',style:theme.textTheme.titleLarge?.copyWith(fontSize: 12) ,),
//                         ),
            
            
            
//                           Padding(
//                             padding: const EdgeInsets.only(top: 20,bottom: 20),
//                             child: TextFormField(
//                               obscureText: true,
//                               keyboardType: TextInputType.visiblePassword,
//                               decoration: const InputDecoration(
            
//                                 labelText: 'Email',
//                               ),
//                               onChanged: (email_address) => email = email_address,
//                               // validator: Validator.name,
//                             )
//                         ),          
            
                       
                       
//                         //Password
//                         Padding(
//                             padding: const EdgeInsets.only(top: 20,bottom: 20),
//                             child: TextFormField(
//                               obscureText: true,
//                               keyboardType: TextInputType.visiblePassword,
//                               decoration: const InputDecoration(
            
//                                 labelText: 'Password',
//                               ),
//                               onChanged: (passwd) => password = passwd,
//                               // validator: Validator.name,
//                             )
//                         ), 
            
//                         ///LOG IN BUTTON
//                        Container(
//                         decoration:  const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(30)),
//                           gradient: LinearGradient(colors: [Color(0xff5ba2f4),Color(0xff034c81),])
//                         ),
//                          child: ElevatedButton(onPressed: (){},
//                          style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,
//                          elevation: 0),
                         
                         
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 15),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: const [
                                
//                                 Text('LOG IN',),
                                
                               
//                               ],
//                             ),
//                           ),

                          
//                           ),
//                        ),

//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                             const Text('Dont Have An Account?'),
//                             TextButton(onPressed: (){

//                               Navigator.push(context,
//                         MaterialPageRoute(builder: (BuildContext context)=>const SignUpPage()));
                        
//                             }, child: const Text('SIGN UP'))
//                           ],),
//                         )         
//                       ]),
//                 ),
//               ),
//             )));
//   }
// }
