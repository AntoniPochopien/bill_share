import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/domain/user.dart';
import 'package:bill_share/common/utils/image_url_generator.dart';
import 'package:bill_share/common/utils/validators.dart';
import 'package:bill_share/common/widgets/billshare_text_field.dart';
import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/widgets/framed_button.dart';
import 'package:bill_share/common/widgets/profile_image.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileDialog extends StatefulWidget {
  final User user;
  final Future<void> Function(String, XFile?) onUpdate;

  const UpdateProfileDialog({
    super.key,
    required this.user,
    required this.onUpdate,
  });

  @override
  State<UpdateProfileDialog> createState() => _UpdateProfileDialogState();
}

class _UpdateProfileDialogState extends State<UpdateProfileDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _controller;
  bool _isLoading = false;
  XFile? _image;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.user.username);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TitleWithUnderscore(
                title: 'Twój profil',
                description:
                    'Możesz zaktualizować swoje dane w każdym momencie',
              ),
              Column(
                children: [
                  ProfileImage(
                    size: 96,
                    onTap: () async {
                      final picker = ImagePicker();
                      final newImage =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (newImage != null) {
                        setState(() {
                          _image = newImage;
                        });
                      }
                    },
                    imageUrl: ImageUrlGenerator.generatePublicImageUrl(
                        widget.user.imageUrl),
                    imageFile: _image,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: BillshareTextField(
                      controller: _controller,
                      label: T(context).username,
                      validator: (v) =>
                          Validators.usernameValidator(context, v),
                    ),
                  ),
                  Button(
                    text: T(context).update,
                    isLoading: _isLoading,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => _isLoading = true);
                        await widget.onUpdate(_controller.text, _image);
                        if (context.mounted) {
                          context.maybePop();
                        }
                      }
                    },
                  ),
                  FramedButton(
                      text: T(context).cancel,
                      onPressed: () => context.maybePop()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
