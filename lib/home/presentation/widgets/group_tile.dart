import 'package:bill_share/common/utils/image_url_generator.dart';
import 'package:bill_share/common/widgets/profile_image.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/home/domain/simple_group.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';

class GroupTile extends StatelessWidget {
  final SimpleGroup group;
  final Function onTap;
  const GroupTile({
    super.key,
    required this.group,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.5),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        leading: ProfileImage(
          size: 42,
          imageUrl: ImageUrlGenerator.generatePublicImageUrl(group.imageUrl),
        ),
        title: Text(group.name, style: Font.h4DarkMedium),
        subtitle: Text(
          '${T(context).members}: ${group.membersCount}',
          style: Font.h6Grey,
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
