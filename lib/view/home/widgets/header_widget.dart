part of '../home_view.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    return Container(
      width: 1.sw,
      height: 230.h,
      color: AppColors.instance.profileBgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60.r,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: ValueListenableBuilder(
                  valueListenable: LocalDbManager.instance.tasksBox.listenable(),
                  builder: (context, Box box, child) {
                    List tasks = box.get(LocalDbManager.instance.tasksDb) ?? [];
                    double linearValue =
                        tasks.where((element) => element.isCompleted).toList().length /
                            tasks.length;

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Task : ${tasks.length}",
                              style: textStyle,
                            ),
                            Text(
                              "% ${linearValue * 100}",
                              style: textStyle,
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: linearValue,
                          minHeight: 20.h,
                          color: AppColors.instance.greenColor,
                        ),
                      ],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
