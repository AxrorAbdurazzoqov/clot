import 'package:clot/src/core/constants/font_style/font_style_const.dart';
import 'package:clot/src/core/extensions/get_mediaqueyr_height_width.dart';
import 'package:clot/src/core/widgets/elevated_button.dart';
import 'package:clot/src/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:clot/src/features/auth/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({
    super.key,
    required GlobalKey<FormState> formKey,
    required String title,
    required List<CustomTextField> textFormFields,
    required onTap,
    this.hasAppBackButton = false,
    this.bottomChildren = const SizedBox(),
  })  : _formKey = formKey,
        _textFormFields = textFormFields,
        _title = title,
        _onTap = onTap;

  final GlobalKey<FormState> _formKey;
  final String _title;
  final List<CustomTextField> _textFormFields;
  final VoidCallback _onTap;
  final bool hasAppBackButton;
  final Widget bottomChildren;

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: widget.hasAppBackButton ? const CustomAppBar() : null,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: widget.hasAppBackButton? 20: context.getHeight * 0.15, horizontal: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget._title, style: FontStyleConst.huge.copyWith(fontWeight: FontWeight.w700)),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Form(
                key: widget._formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(widget._textFormFields.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: widget._textFormFields[index],
                  );
                })),
              ),
            ),
            CustomElevatedButton(
              onTap: widget._onTap,
              text: 'Continue',
            ),
            widget.bottomChildren,
          ],
        ),
      ),
    );
  }
}
