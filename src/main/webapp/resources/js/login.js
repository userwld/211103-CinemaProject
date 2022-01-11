/* 아이디 저장 */
$(document).ready(function() {

    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#userId").val(key);

    if ($("#userId").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#checkSavedID").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }

    $("#checkSavedID").change(function() { // 체크박스에 변화가 있다면,
        if ($("#checkSavedID").is(":checked")) { // ID 저장하기 체크했을 때,
            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
        } else { // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });

    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#userId").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
        if ($("#checkSavedID").is(":checked")) { // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});

function setCookie(cookieName, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName) {
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if (start != -1) {
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if (end == -1) end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

/* 로그인 요청 */
function loginRequest() {
    var name = document.getElementById("userId").value;
    var passward = document.getElementById("userPassword").value;

    if (name == "" || passward == "") {
        const Toast = Swal.mixin({
            toast: true,
            position: 'center-end',
            showConfirmButton: false,
            timer: 4000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer)
                toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
        })

        Toast.fire({
            icon: 'error',
            title: '빈칸을 모두 입력하여 주세요.'
        })
        return;
    }
    var idChecked = idCheck();
    var pwChecked = pwCheck();
    if (!idChecked || !pwChecked) {
        Swal.fire({
            icon: 'error',
            title: '오류',
            text: '아이디가 존재하지 않거나, 비밀번호가 일치하지 않습니다.',
        })
        return;
    }

    let timerInterval
    Swal.fire({
        title: '환영합니다!',
        timer: 1000,
        timerProgressBar: true,
        didOpen: () => {
            Swal.showLoading()
            const b = Swal.getHtmlContainer().querySelector('b')
            timerInterval = setInterval(() => {
                b.textContent = Swal.getTimerLeft()
            }, 100)
        },
        willClose: () => {
            location.href = '/cinema/';
        }
    }).then((result) => {
        /* Read more about handling dismissals below */
        location.href = '/cinema/';
    })

}

/* 아이디 체크 */
function idCheck() {
    var i = document.getElementById("userId").value;
    var info = { id: i };
    var check = false;

    $.ajax({
        url: "loginIdCheck",
        type: "POST",
        data: JSON.stringify(info),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,

        success: function(result) {
            if (result) {
                check = true;
            }
        },
        error: function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    })
    return check;
}

/* 비밀번호 체크 */
function pwCheck() {
    var i = document.getElementById("userId").value;
    var pw = document.getElementById("userPassword").value;
    var info = { id: i, pw: pw };
    var check = false;

    $.ajax({
        url: "loginPwCheck",
        type: "POST",
        data: JSON.stringify(info),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,

        success: function(result) {
            if (result) {
                check = true;
            }
        },
        error: function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    })
    return check;
}