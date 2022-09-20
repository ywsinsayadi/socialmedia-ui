import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/domain/blocs/blocs.dart';
import 'package:social_media/ui/themes/colors.dart';
import 'package:social_media/ui/widgets/widgets.dart';

modalPrivacyProfile(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final userBloc = BlocProvider.of<UserBloc>(context);

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(20.0))),
    backgroundColor: Colors.white,
    barrierColor: Colors.black26,
    builder: (context) => Container(
      height: size.height * .41,
      width: size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadiusDirectional.vertical(top: Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 5,
                width: 38,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(50.0)),
              ),
            ),
            const SizedBox(height: 15.0),
            Center(
                child: BlocBuilder<UserBloc, UserState>(
                    buildWhen: (previous, current) => previous != current,
                    builder: (_, state) => TextCustom(
                        text: (state.user != null && state.user!.isPrivate == 0)
                            ? 'تغییر حساب به خصوصی'
                            : 'تغییر حساب به عمومی',
                        fontWeight: FontWeight.w500))),
            const SizedBox(height: 5.0),
            const Divider(),
            const SizedBox(height: 10.0),
            Row(
              children: const [
                Icon(Icons.photo_outlined, size: 30, color: Colors.black),
                SizedBox(width: 10.0),
                TextCustom(
                    text: 'همه می توانند عکس ها و فیلم های شما را ببینند',
                    fontSize: 15,
                    color: Colors.grey)
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: const [
                Icon(Icons.chat_bubble_outline_rounded,
                    size: 30, color: Colors.black),
                SizedBox(width: 10.0),
                TextCustom(
                  text:
                      'این تغییری نمی کند که چه کسی می تواند شما را تگ کند \n@اشاره',
                  fontSize: 15,
                  color: Colors.grey,
                  maxLines: 2,
                )
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: const [
                Icon(Icons.person_add_alt, size: 30, color: Colors.black),
                SizedBox(width: 10.0),
                TextCustom(
                  text:
                      'همه برنامه های معلق باید \n تایید شوند مگر اینکه آنها را حذف کنید',
                  fontSize: 15,
                  color: Colors.grey,
                  maxLines: 2,
                )
              ],
            ),
            const SizedBox(height: 10.0),
            const Divider(),
            const SizedBox(height: 10.0),
            BlocBuilder<UserBloc, UserState>(
              buildWhen: (previous, current) => previous != current,
              builder: (_, state) => BtnFrave(
                text: (state.user != null && state.user!.isPrivate == 0)
                    ? 'به خصوصی تغییر دهید'
                    : 'به عمومی تغییر دهید',
                width: size.width,
                fontSize: 17,
                backgroundColor: ColorsFrave.primary,
                onPressed: () {
                  Navigator.pop(context);
                  userBloc.add(OnChangeAccountToPrivacy());
                },
              ),
            )
          ],
        ),
      ),
    ),
  );
}
