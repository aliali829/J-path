/*import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled58/getx/controller/forget_password_controller.dart';
import 'package:untitled58/module/forgetPassword/create_new_password.dart';

import '../../../widget/custom_form_button.dart';
import '../../../widget/custom_input_field.dart';
import '../../../widget/header.dart';

class CodeForget extends StatelessWidget {
  ForgetController controller = ForgetController();
  CodeForget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content = SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            const Header(title: ''),
            const SizedBox(height: 16),
            CustomInputField(
              labelText: 'code',
              hintText: ' Enter the code sent to Your email',
              onChanged: (value) {
                controller.code = value;
              },
            ),
            const SizedBox(height: 22),
            CustomFormButton(
              innerText: 'Enter',
              onPressed: () {
                clickEnterCode();
              },
            ),
          ],
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: kIsWeb
            ? Center(
                child: Container(
                  width: 500,
                  height: 500,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(60),
                  decoration: BoxDecoration(
                    border: Border.all(width: 10, color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: content,
                ),
              )
            : content,
      ),
    );
  }

  void clickEnterCode() async {
    EasyLoading.show(status: "Loading----");
    await controller.onClickEnterCode();
    if (controller.statusEnterCode) {
      EasyLoading.showSuccess("Success");
      Get.to(CreateNewPassword());
      /* if (kIsWeb) {
        Get.off(ConfirmEmail());
      } else {
        Get.off(ExtranInformation);
      }*/
    } else {
      EasyLoading.showError("Error"
          //  controller.message,
          // duration: Duration(seconds: 10),
          // dismissOnTap: true,
          );
    }
  }
}*/

/*public function admin_login(Request $request){
          {
          if(Admin::where('email',$request->email)->first()->companies->access=='false'){
              return response()->json([
                'dont access'
              ]);
          }
            $request->validate([
            'email'    => 'required',
            'password' => 'required' ]);
            //return $request;

            $credentials = $request->only('email', 'password');  //هي متل تبع الinput all بس هون بحدد الشغلات يلي بدي ياها
         //return $credentials;
        if (auth()->guard('admin')->attempt($credentials))//هةن اخترنا الغارد لان في عنا تنين غارد يوزر وادمن
           {
            // return "143242";
           config(['auth.guards.api.provider'=>'admin']);


           $user=Admin::query()->select('admins.*')->find(auth()->guard('admin')->user()['id']);
          // $success=$user;

           $success['token']=$user->createToken('MyApp',['admin'])->accessToken;
           return response()->json([$success['token']],200);
           }

           else{
            return response()->json([
                'error'=>['Unauthorized']
            ],422);

        }
    }}
 */
////////////////////////////////////////////////////////
/*public function admin_login(Request $request)
{
  $request->validate([
'email'    => 'required',
'password' => 'required' ]);
//return $request;

$credentials = $request->only('email', 'password');  //هي متل تبع الinput all بس هون بحدد الشغلات يلي بدي ياها
//   return $credentials;
if (auth()->guard('admin')->attempt($credentials))//هةن اخترنا الغارد لان في عنا تنين غارد يوزر وادمن
      {
  // return "143242";
  config(['auth.guards.api.provider'=>'admin']);


  $user=Admin::query()->select('admins.*')->find(auth()->guard('admin')->user()['id']);
  // $success=$user;
  $success['token']=$user->createToken('MyApp',['admin'])->accessToken;
  return response()->json([$success]);
  }

  else{
return response()->json([
'error'=>['Unauthorized'] ,401
]);

}
}*/
