//전화번호 정규표현식

else if (type == ValidType.phone) {
    // RegExp regex = RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$'); // 010 휴대폰 번호
    RegExp regex = RegExp(r'^(0[0-9]{1,2})-?([0-9]{3,4})-?([0-9]{4})$');  //일반 / 휴대폰 번호

    if (value.isEmpty) {
        return '전화번호를 입력해 주세요.';
    } else if (value.length < 11) {
        return '전화번호 양식에 맞게 입력해 주세요.';  //전화번호 길이 추가
    } else if (!regex.hasMatch(value)) {
        return '전화번호 양식에 맞게 입력해 주세요.';
    }
}