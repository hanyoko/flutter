//채팅 보낸 시간 ex) 4분 전 .. 1시간 전 ..

static String getHumanDate(String? time, {bool bAllTimeAgo = true}){
    final localizationController = Get.find<LocalizationController>();

    if (time == null || time.isEmpty) {
        return '';
    }

    timeago.setLocaleMessages('ko', CustomKoMessages());

    int diffDate = getDiffDate(time, getNow(), type: 'day');
    int diffMinute = getDiffDate(time, getNow(), type: 'minute');

    if (diffDate >= 365) {
        if (bAllTimeAgo) {
        return timeago.format(DateTime.parse(time), locale: localizationController.currentLanguage);
        }
        return convertDateFormat(time, dateFormat: 'yyyy.MM.dd');
    } else if (diffDate >= 30) {
        if (bAllTimeAgo) {
        return timeago.format(DateTime.parse(time), locale: localizationController.currentLanguage);
        }
        return convertDateFormat(time, dateFormat: 'MM.dd');
    } else if (diffDate >= 1) {
        return timeago.format(DateTime.parse(time), locale: localizationController.currentLanguage);
    } else if (diffMinute <= 1) {
        return '방금 전';
    } else if (diffMinute < 60) {
        return '${diffMinute + 1}분 전';
    } else if (diffMinute >= 60) {
        return '${(diffMinute / 60).floor()}시간 전';
    } else {
        return timeago.format(DateTime.parse(time), locale: localizationController.currentLanguage);
    }
}