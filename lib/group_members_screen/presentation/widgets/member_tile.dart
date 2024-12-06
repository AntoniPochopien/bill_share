import 'package:bill_share/common/widgets/profile_image.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:flutter/material.dart';

class MemberTile extends StatelessWidget {
  final GroupMember groupMember;
  const MemberTile({super.key, required this.groupMember});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        ProfileImage(
          size: 47,
        ),
        SizedBox(width: 16),
        Text(groupMember.username),
      ]),
    );
  }
}
