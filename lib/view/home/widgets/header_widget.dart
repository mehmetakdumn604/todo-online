part of '../home_view.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 190.h,
      color: AppColors.instance.profileBgColor,
      child: Column(
        children: [
          const Spacer(),
          CircleAvatar(
            radius: 70.r,
            backgroundImage: const CachedNetworkImageProvider(
              AppStrings.profileImage,
              cacheKey: AppStrings.profileImage,
            ),
          ),
          SizedBox(height: 10.h),
          Text.rich(
            TextSpan(text: AppStrings.hello, style: AppStyles.instance.semiBoldStyle, children: [
              TextSpan(
                text: "Mehmet",
                style: AppStyles.instance.boldStyle,
              )
            ]),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.instance.nameTextColor,
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
