function logincheck(){
	if (document.login.userid.value == ''){
		alert("아이디를 입력하세요");
		document.login.userid.focus();
		return false;
	} else if (document.login.pwd.value == ''){
		alert("아이디를 입력하세요");
		document.login.pwd.focus();
		return false;
	} else {
		return true;
	}
	
}



function idcheck(){
	//최초로 입력된 아이디가 없으면 "아이디를 먼저 입력하세요" 라는 메세지를 출력 후 팝업창 없이 초기상태로 되돌아감
	
	if(document.join.userid.value == ''){
		alert("아이디를 먼저 입력하세요");
		document.join.userid.focus();
		return;
	}
	
	var inputid = document.join.userid.value;
	var opt = "toolbar = no, menubar = no, resizable = no, width = 500, height = 200";
	
	//inputid 에 전달된 아이디의 사용 가능/불가능 을 조회하여 결과와 함께 팝업창에 보여줄 예정
	window.open("board.do?command=idcheck&userid="+inputid , 'idcheck', opt);
	
}

function joincheck(){
	
	if(document.join.userid.value == ''){
		alert("아이디를 먼저 입력하세요");
		document.join.userid.focus();
		return false;
	} else if (document.join.pwd.value == ''){
		alert("비밀번호를 입력해주세요")
		document.join.pwd.focus();		
		return false;
	} else if (document.join.pwd.value != document.join.pwd_check.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.join.pwd_check.focus();
		return false;		
	} else if (document.join.name.value == ''){
		alert("이름을 입력해주세요")
		document.join.name.focus();		
		return false;
	} else if (document.join.email.value == ''){
		alert("메일주소를 입력해주세요")
		document.join.email.focus();		
		return false; 
	} else if (document.join.phone.value == ''){
		alert("전화번호를 입력해주세요")
		document.join.phone.focus();		
		return false;
	} else if (document.join.userid.value != document.join.reid.value){
		alert("아이디 중복 확인을 먼저 진행해주세요.")
		document.join.userid.focus();		
		return false;
	} else {
		return true;
	}
	
}

function updatecheck(){
	if (document.update.pwd.value == ''){
		alert("비밀번호를 입력해주세요")
		document.update.pwd.focus();		
		return false;
	} else if (document.update.pwd.value != document.update.pwd_check.value){
		alert("비밀번호 확인이 일치하지 않습니다.");
		document.update.pwd_check.focus();
		return false;		
	} else if (document.update.name.value == ''){
		alert("이름을 입력해주세요")
		document.update.name.focus();		
		return false;
	} else if (document.update.email.value == ''){
		alert("메일주소를 입력해주세요")
		document.update.email.focus();		
		return false; 
	} else if (document.update.phone.value == ''){
		alert("전화번호를 입력해주세요")
		document.update.phone.focus();		
		return false;
	} else {
		return true;
	}	
}

function withdraw(){
	let ans = confirm ("정말 탈퇴하시겠습니까?");
	if(ans){
		location.href='board.do?command=deleteMember';
	}else{
		return;
	}	
}


function boardcheck(){
	if(document.insertBoard.pass.value == ""){
		alert("비밀번호를 입력하세요");
		document.insertBoard.pass.focus();
		return false;
	} else if(document.insertBoard.email.value == ""){
		alert("이메일을 입력하세요");
		document.insertBoard.email.focus();
		return false;
	} else if(document.insertBoard.title.value == ""){
		alert("제목을 입력하세요");
		document.insertBoard.title.focus();
		return false;
	} else if(document.insertBoard.content.value == ""){
		alert("내용을 입력하세요");
		document.insertBoard.content.focus();
		return false;
	} else {
		return true;
	}
}


function updateBoardCheck(pass){
	if(document.insertBoard.pass.value == ""){
		alert("비밀번호를 입력하세요");
		document.insertBoard.pass.focus();
		return false;
	} else if(document.insertBoard.email.value == ""){
		alert("이메일을 입력하세요");
		document.insertBoard.email.focus();
		return false;
	} else if(document.insertBoard.title.value == ""){
		alert("제목을 입력하세요");
		document.insertBoard.title.focus();
		return false;	
	} else if (document.insertBoard.pass.value != pass){
		alert ("비밀번호가 일치하지 않습니다.")
		document.insertBoard.pass.focus();
		return false;			
	} else {
		return true;
	}
	
	
}



function deleteBoard(pass,num){
	var inputpass = prompt('삭제에 필요한 비밀번호를 입력하세요',"");
	if(pass != inputpass){
		alert('비밀번호가 일치하지 않습니다.');
		return;
	}else{
		location.href='board.do?command=deleteBoard&num='+num;
	}
}
























