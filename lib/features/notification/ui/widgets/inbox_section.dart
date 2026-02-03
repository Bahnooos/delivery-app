import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';

class InboxSection extends StatelessWidget {
  const InboxSection({super.key});

 final int? selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      
    InboxItem(title: 'Notification', selectedIndex: selectedIndex, index: 0),
    InboxItem(title: 'messages', selectedIndex: selectedIndex, index: 1),

      ],
    );
  }
}

class InboxItem extends StatefulWidget {
   InboxItem({super.key,required this.title,required this.selectedIndex,required this.index});
  final String? title;
   int? selectedIndex;
   int? index;

  @override
  State<InboxItem> createState() => _InboxItemState();
}

class _InboxItemState extends State<InboxItem> {
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>  setState(()=> widget.selectedIndex = widget.index),
      child: Column(
        children: [
          Text(widget.title??'',style: context.font14TextSecondaryRegular,),
          8.verticalSpace,
          Divider(color:widget.selectedIndex == widget.index? AppColors.primary: AppColors.gray,)
          
        ],
      ),
    );
  }
}

