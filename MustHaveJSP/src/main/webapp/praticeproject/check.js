function addCheck() {
	if (frm.resvno.value.length == 0) {
		alert("예약번호가 입력되지 않았습니다.");
		frm.resvno.focus();
		return false;
	}
	else if (frm.empno.value.length == 0) {
		alert("사원번호가 입력되지 않았습니다.");
		frm.empno.focus();
		return false;
		}
		else if (frm.resvdate.value.length == 0) {
		alert("근무일자가 입력되지 않았습니다.");
		frm.resvdate.focus();
		return false;
		}
		else if (frm.seatno.value.length == 0) {
		alert("좌석번호가 입력되지 않았습니다.");
		frm.seatno.focus();
		return false;
		}
		else 
		alert("좌석예약정보가 등록되었습니다!");
		document.frm.submit();
		return true;
}
function res(){
	alert("정보를 지우고 처음부터 다시 입력합니다.")
	document.frm.reset();
}

