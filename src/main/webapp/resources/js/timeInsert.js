function InputTimeInfo() {
	var countryName = document.getElementById("countryName").value;
	var cinemaName = document.getElementById("cinemaName").value;
	var movieName = document.getElementById("movieName").value;
	var hallName = document.getElementById("hallName").value;
	var ticketDate = document.getElementById("ticketDate").value;
	var startTime = document.getElementById("startTime").value;
	
	if(countryName == "" || cinemaName == "" || movieName == "" || hallName == "" || ticketDate == "" || startTime == ""){
		alert('정보를 입력해주세요.');
	}
	else {
		document.getElementById('timeInsertForm').submit();
	}
}