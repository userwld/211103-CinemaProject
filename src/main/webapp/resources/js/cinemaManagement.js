function InputCinemaInfo() {
    var country = document.getElementById("input-country-name");
    var cinema = document.getElementById("input-cinema-name");

    if (country.value == "") {
        alert("지역명을 입력하세요.")
        country.focus();
        return
    }

    if (cinema.value == "") {
        alert("지점명을 입력하세요.")
        cinema.focus();
        return
    }

    var info = { countryName: country.value, cinemaName: cinema.value };

    Swal.fire({
        title: '영화관 추가',
        text: "영화관을 추가 하시겠어요?",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: '취소',
        confirmButtonText: '추가'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: "cinemaInsert",
                method: 'post',
                data: JSON.stringify(info),
                contentType: "application/json; charset=utf-8",

                success: function() {
                    Swal.fire({
                        title: '영화관 추가',
                        text: '영화관이 추가 되었습니다.',
                        icon: 'success'
                    }).then((result) => {
                        window.location.reload();
                    })
                },
                error: function(request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            })
        }
    })
}

function cinemaDelete(id) {
	if(confirm('정말 삭제하시겠습니까?')) {
		var info = {id : id};
            $.ajax({
                url: "cinemaDelete",
                method: 'post',
                data: JSON.stringify(info),
                contentType: "application/json; charset=utf-8",

                success: function() {
					alert('삭제가 완료되었습니다.');
					window.location.reload();
                },
                error: function(request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            })
	}
}