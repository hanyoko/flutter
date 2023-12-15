//시간 타이머 설정


//변경 전
action: () {
    setState(() {

        if (_seconds == 0) {  //시간이 초과되었을 때
            MyToast.show(context, LangKeys.timeOver.tr);
            return;
        }

        if (_verifyTextFormManager.text.isEmpty) {  //인증번호 입력창이 비어있을 때

            if (_emailTextFormManager.text.isEmpty || (_selectedEmail == 2 && _directTextFormManager.text.isEmpty)) {
            return;
            }

            _bAccredit = true;
            _timer?.cancel(); //cancel을 해줘야 중복 카운트를 잡을 수 있음
            _startTimer();

            MyToast.show(context, LangKeys.enterCertifyNum.tr);
            return;
            
        } else {

            if (_verifyTextFormManager.text != _bAccreditNum) { //인증번호 입력창에 값이 있을 때
            MyToast.show(context, LangKeys.notSameCertifyNum.tr);
            return;
            }

            _timer?.cancel();
            _seconds = 0;

            String domain = _directTextFormManager.text.isEmpty ? domainList[_selectedEmail ?? 0] : _directTextFormManager.text;
                
            Frame.pagePush(context,
            ScreenAgreeInfo(_provider.koName, _emailTextFormManager.text + '@' + domain)
            );
        }
    }); 
},


//변경 후
action: () {
    setState(() {

        if (_seconds == 0) {  //시간이 초과되었을 때
            MyToast.show(context, LangKeys.timeOver.tr);
            return;
        }

        if (_emailTextFormManager.text.isEmpty || (_selectedEmail == 2 && _directTextFormManager.text.isEmpty)) {
            return;
        }

        if (_verifyTextFormManager.text.isEmpty) {  //인증번호 입력창에 값이 없을 때
            _bAccredit = true;
            _timer?.cancel(); //cancel을 해줘야 중복 카운트를 잡을 수 있음
            _startTimer();

            return;
        } 

        if (_verifyTextFormManager.text != _bAccreditNum) {  //인증번호를 틀렸을 때
            MyToast.show(context, LangKeys.notSameCertifyNum.tr);
            return;
        }

        _timer?.cancel();
        _seconds = 0;

        String domain = _directTextFormManager.text.isEmpty ? domainList[_selectedEmail ?? 0] : _directTextFormManager.text;

        Frame.pagePush(context,
            ScreenAgreeInfo(_provider.koName, _emailTextFormManager.text + '@' + domain)
        );
    }); 
},