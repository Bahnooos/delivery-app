import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileHeader extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String? description;
  final String? profileImageUrl;

  const ProfileHeader({
    super.key,
    required this.firstName,
    required this.lastName,
    this.description,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( vertical:20.w),
      child: Row(
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.secondary.withOpacity(0.2),
              image: profileImageUrl != null
                  ? DecorationImage(
                image: NetworkImage(profileImageUrl!),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: profileImageUrl == null
                ? Center(
              child: Text(
                '${firstName[0]}${lastName[0]}'.toUpperCase(),
                style: context.font22TextPrimarySemiBold?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            )
                : null,
          ),

          SizedBox(width: 16.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$firstName $lastName',
                  style: context.font18TextMediumSemiBold,
                ),
                if (description != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    description!,
                    style: context.font13TextHintRegular,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}