import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/detail_news/widget/qr_scan_screen.dart';
import 'package:socialworkapp/widgets/button_widget.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../confirm_information/confirm_information_screen.dart';
import '../home_main/home_main.dart';
import '../../untils/constant_string.dart';
import '../../untils/constants.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../login/bloc/login_bloc.dart';

class DetailNewsScreen extends StatefulWidget {
  final bool admin;
  const DetailNewsScreen({Key? key, required this.admin}) : super(key: key);

  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      isHomePage: false,
      actions: null,
      title: ConstString.titleAppDetailNews.toUpperCase(),
    );
  }

  Widget _buildTextString(BuildContext context, String topic, String content) {
    return Row(
      children: [
        SvgPicture.asset(
          Images.stack,
          width: DimenUtilsPX.pxToPercentage(context, 14),
          height: DimenUtilsPX.pxToPercentage(context, 14),
        ),
        const SizedBox(
          width: Dimens.heightSmall,
        ),
        TextCustom(
          '$topic: ',
          fontSize: Dimens.body,
        ),
        TextCustom(
          content,
          fontSize: Dimens.body,
          fontWeight: true,
        )
      ],
    );
  }

  Widget _buildContent() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ConstColors.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(Dimens.radiusButton),
        color: ConstColors.white,
        boxShadow: [
          BoxShadow(
            color: ConstColors.black.withOpacity(0.2),
            spreadRadius: 0.1,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(Dimens.marginView),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            TextCustom(
              '\t Để thực hiện tốt và chuẩn bị hết các thứ cần thiết cho kì tuyển sinh của trường đại học Công nghệ đồng nai nam 2023. Các bạn hãy đăng ký trợ giúp công tác chuẩn bị cho trường, bạn nào đi sẽ được cộng 5 ngày công tác xã hội. Cơ hội chỉ đến với người nhanh tay, hãy ấn đăng ký nhanh đi nào , Để thực hiện tốt và chuẩn bị hết các thứ cần thiết cho kì tuyển sinh của trường đại học Công nghệ đồng nai nam 2023. Các bạn hãy đăng ký trợ giúp công tác chuẩn bị cho trường, bạn nào đi sẽ được cộng 5 ngày công tác xã hội. Cơ hội chỉ đến với người nhanh tay, hãy ấn đăng ký nhanh đi nào , Để thực hiện tốt và chuẩn bị hết các thứ cần thiết cho kì tuyển sinh của trường đại học Công nghệ đồng nai nam 2023. \n\n\t Các bạn hãy đăng ký trợ giúp công tác chuẩn bị cho trường, bạn nào đi sẽ được cộng 5 ngày công tác xã hội. Cơ hội chỉ đến với người nhanh tay, hãy ấn đăng ký nhanh đi nào , Để thực hiện tốt và chuẩn bị hết các thứ cần thiết cho kì tuyển sinh của trường đại học Công nghệ đồng nai nam 2023. Các bạn hãy đăng ký trợ giúp công tác chuẩn bị cho trường, bạn nào đi sẽ được cộng 5 ngày công tác xã hội. Cơ hội chỉ đến với người nhanh tay, hãy ấn đăng ký nhanh đi nào. \n\n\t Để thực hiện tốt và chuẩn bị hết các thứ cần thiết cho kì tuyển sinh của trường đại học Công nghệ đồng nai nam 2023. Các bạn hãy đăng ký trợ giúp công tác chuẩn bị cho trường, bạn nào đi sẽ được cộng 5 ngày công tác xã hội. Cơ hội chỉ đến với người nhanh tay, hãy ấn đăng ký nhanh đi nào , Để thực hiện tốt và chuẩn bị hết các thứ cần thiết cho kì tuyển sinh của trường đại học Công nghệ đồng nai nam 2023. Các bạn hãy đăng ký trợ giúp công tác chuẩn bị cho trường, bạn nào đi sẽ được cộng 5 ngày công tác xã hội. Cơ hội chỉ đến với người nhanh tay, hãy ấn đăng ký nhanh đi nào .\n\n\t Để thực hiện tốt và chuẩn bị hết các thứ cần thiết cho kì tuyển sinh của trường đại học Công nghệ đồng nai nam 2023. Các bạn hãy đăng ký trợ giúp công tác chuẩn bị cho trường, bạn nào đi sẽ được cộng 5 ngày công tác xã hội. Cơ hội chỉ đến với người nhanh tay, hãy ấn đăng ký nhanh đi nào. \n\n\t Để thực hiện tốt và chuẩn bị hết các thứ cần thiết cho kì tuyển sinh của trường đại học Công nghệ đồng nai nam 2023. Các bạn hãy đăng ký trợ giúp công tác chuẩn bị cho trường, bạn nào đi sẽ được cộng 5 ngày công tác xã hội. Cơ hội chỉ đến với người nhanh tay, hãy ấn đăng ký nhanh đi nào Để thực hiện tốt và chuẩn bị hết các thứ cần thiết cho kì tuyển sinh của trường đại học Công nghệ đồng nai nam 2023.\n\n\t Các bạn hãy đăng ký trợ giúp công tác chuẩn bị cho trường, bạn nào đi sẽ được cộng 5 ngày công tác xã hội. Cơ hội chỉ đến với người nhanh tay, hãy ấn đăng ký nhanh đi nào Để thực hiện tốt và chuẩn bị hết các thứ cần thiết cho kì tuyển sinh của trường đại học Công nghệ đồng nai nam 2023. Các bạn hãy đăng ký trợ giúp công tác chuẩn bị cho trường, bạn nào đi sẽ được cộng 5 ngày công tác xã hội. Cơ hội chỉ đến với người nhanh tay, hãy ấn đăng ký nhanh đi nào Để thực hiện tốt và chuẩn bị hết các thứ cần thiết cho kì tuyển sinh của trường đại học Công nghệ đồng nai nam 2023. Các bạn hãy đăng ký trợ giúp công tác chuẩn bị cho trường, bạn nào đi sẽ được cộng 5 ngày công tác xã hội. Cơ hội chỉ đến với người nhanh tay, hãy ấn đăng ký nhanh đi nào Để thực hiện tốt và chuẩn bị hết các thứ cần thiết cho kì tuyển sinh của trường đại học Công nghệ đồng nai nam 2023.\n\n\t Các bạn hãy đăng ký trợ giúp công tác chuẩn bị cho trường, bạn nào đi sẽ được cộng 5 ngày công tác xã hội. Cơ hội chỉ đến với người nhanh tay, hãy ấn đăng ký nhanh đi nào Để thực hiện tốt và chuẩn bị hết các thứ cần thiết cho kì tuyển sinh của trường đại học Công nghệ đồng nai nam 2023. Các bạn hãy đăng ký trợ giúp công tác chuẩn bị cho trường, bạn nào đi sẽ được cộng 5 ngày công tác xã hội. Cơ hội chỉ đến với người nhanh tay, hãy ấn đăng ký nhanh đi nào',
              maxLines: null,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: Dimens.marginView,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final admin = context.read<LoginBloc>().admin;
    return Column(
      children: [
        const TextCustom(
          'Thông tin tuyển sinh trường đại học công nghệ thông tin',
          textAlign: TextAlign.center,
          fontSize: Dimens.titleAppbar,
          fontWeight: true,
        ),
        const SizedBox(
          height: Dimens.marginView,
        ),
        _buildTextString(context, ConstString.dateRegister, '20/10/2022'),
        const SizedBox(
          height: Dimens.heightSmall,
        ),
        _buildTextString(context, ConstString.dateEnd, '25/10/2022'),
        const SizedBox(
          height: Dimens.heightSmall,
        ),
        _buildTextString(context, ConstString.scoreSocialWork, '5 ngày'),
        const SizedBox(
          height: Dimens.heightSmall,
        ),
        _buildTextString(context, ConstString.namePost, 'Nguyễn Thị Liệu'),
        const SizedBox(
          height: Dimens.heightSmall,
        ),
        _buildTextString(context, ConstString.position, 'Cộng tác viên'),
        const SizedBox(
          height: Dimens.heightSmall,
        ),
        _buildTextString(context, ConstString.datePost, '18/10/2022'),
        const SizedBox(
          height: Dimens.marginView,
        ),
        const TextCustom(
          'Lưu ý: Sau khi ấn đăng ký, bạn đã được lưu tên vào dành sách cho người kiểm duyệt, nếu bạn được nhận vào danh sách bạn sẽ được nhận thông báo, vui lòng làm theo thông báo, xin cảm ơn',
          color: ConstColors.red,
          fontSize: Dimens.titleSmall,
          maxLines: null,
        ),
        const SizedBox(
          height: Dimens.marginView,
        ),
        Expanded(
          child: _buildContent(),
        ),
        const SizedBox(
          height: Dimens.marginView,
        ),
        SizedBox(
          width: DimenUtilsPX.pxToPercentage(context, 155),
          child: PrimaryButton(
              text: admin! ? ConstString.rollUp : ConstString.register,
              onPressed: () {
                if (admin) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const QrScanScreen()));
                } else {
                  AppUtils.showDialogCustom(
                      context: context,
                      title: ConstString.registerEvent,
                      strConfirm: ConstString.yes,
                      strCancel: ConstString.cancel,
                      onCancelClick: () {
                        Navigator.pop(context);
                      },
                      onConfirmClick: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomeMain(
                                    admin: admin,
                                  )),
                        );
                      });
                }
              }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: Padding(
        padding: const EdgeInsets.only(
            right: Dimens.heightSmall,
            left: Dimens.heightSmall,
            top: Dimens.sizedBox,
            bottom: Dimens.sizedBox),
        child: _buildBody(context),
      ),
    );
  }
}
