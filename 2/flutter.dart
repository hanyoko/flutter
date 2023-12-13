//switch문을 활용해서 type에 맞는 값 가져오기

_buildTypeIcon(String? type) {
    if (type == null) {
      type == '';
    }

    Color iconColor = COLOR_WHITE;
    Color color = COLOR_BLACK;
    Color textColor = COLOR_BLACK;
    String text = LangKeys.notice.translate(context); // 공지
    Widget icon = Icon(Icons.notifications_outlined, color: iconColor, size: FixedSize.iconSm);

    switch (type) {
      case NoticeType.enrollment: {
        color = COLOR_ENROLLMENT;
        textColor = COLOR_ENROLLMENT;
        icon = SvgPicture.asset('assets/icons/request.svg', color: iconColor, width: FixedSize.thumbnailXxs, height: FixedSize.thumbnailXxs);
        text = LangKeys.enrollment.translate(context); // 등록
        break;
      }
      case NoticeType.cost: {
        color = COLOR_COST;
        textColor = COLOR_ENROLLMENT;
        text = LangKeys.cost.translate(context); // 교습비
        icon = SvgPicture.asset('assets/icons/credit.svg', color: COLOR_ENROLLMENT, width: FixedSize.thumbnailXxs, height: FixedSize.thumbnailXxs);
        break;
      }
    }
    
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: FixedPadding.md * 2),
          padding: const EdgeInsets.all(FixedPadding.sm),
          height: 38, //FixedSize로 38을 만들 수 없음 (디자이너에게 물어봤는데 24와 44 사이값을 만들어야 했는데 없었다고 함.)
          width: 38,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
          child: icon,
        ),
        Text(text, style: Fonts.caption(color: textColor, fontFamily: Fonts.medium)),
      ],
    );
  }