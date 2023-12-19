if (resultMap == null) {
    MyToast.show(context, ErrorKeys.connect.translate(context));
    return;
}

if (resultMap['code'] == RESULT_CODE_SUCCESS) {

    if (resultMap['list'] != null) {
        for (int i = 0; i < resultMap['list'].length; i++) {
            _groupList.add(GroupModel.fromJson(resultMap['list'][i]));
        }
    }

    if (_groupList.isNotEmpty && resultMap['list'].length == 0) {
        MyToast.show(context, ErrorKeys.noMoreListItem.translate(context));
        return;
    }

    _filePathGroup = resultMap['file_path'];

    _page++;

} else {
    MyToast.show(context, ErrorKeys.connect.translate(context) + ' : ' + resultMap['message'].toString());
}