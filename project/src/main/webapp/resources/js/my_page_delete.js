/**
 * my_page_delete_check
 */
function my_page_delete_check(){

	$mem_pwd=$.trim($("#mem_pwd").val());
	$mem_pwd2=$.trim($("#mem_pwd2").val());
	if($mem_pwd == ""){
		alert("비번을 입력하세요!");
		$("#mem_pwd").val("").focus();
		return false;
	}
	if($mem_pwd2 == ""){
		alert("비번확인을 입력하세요!");
		$("#mem_pwd2").val("").focus();
		return false;
	}
	if($mem_pwd != $mem_pwd2){
		alert("비번이 다릅니다!");
		$("#mem_pwd").val("");//비번 입력박스를 초기화
		$("#mem_pwd2").val("");
		$("#mem_pwd").focus();
		return false;
	}
	if($.trim($("#delete_reason").val())==""){
		alert("탈퇴 사유를 적어주세요");
		$("#delete_reason").val("").focus();
		return false;
	}
	if($('input:checkbox[name="member_Activation"]').is(":checked")){
		alert('탈퇴 동의를 하였습니다.');
	}else{
		alert('탈퇴 동의를 해주세요.');
		return false;
	}
}


//중복아이디 검색
function id_check(){
	/* copy begin */
	$("#idcheck").hide();
	//아이디 영역을 숨김
	$mem_id=$.trim($("#mem_id").val());
	//1.입력글자 길이 체크
	if($mem_id.length < 4){
		$newtext='<font color="red" size="3"><b>아이디는 4자 이상이어야 합니다.</b></font>';
		$("#idcheck").text('');
		//idcheck 아이디 영역 문자열을 초기화
		$("#idcheck").show();
		//idcheck 아이디 영역을 보이게 함.
		$("#idcheck").append($newtext);
		//idcheck영역에 문자열을 추가
		$("#mem_id").val('').focus();
		return false;
	};
	if($mem_id.length > 12){
		$newtext='<font color="red" size="3"><b>아이디는12자 이하이어야 합니다.</b></font>';
		$("#idcheck").text('');
		//idcheck 아이디 영역 문자열을 초기화
		$("#idcheck").show();
		//idcheck 아이디 영역을 보이게 함.
		$("#idcheck").append($newtext);
		//idcheck영역에 문자열을 추가
		$("#mem_id").val('').focus();
		return false;
	};

	//아이디 중복확인
	$.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 아작스 실행
		type:"POST",//데이터를 서버로 보내는 방법url:"./member/member_idcheck.jsp",    
		url:"member_idcheck", //아작스 서버 주소 파일명
		data: {"id":$mem_id},  //좌측 id 피라미터 이름에 우측 $mem_id변수값을 저장
		datatype:"int",//서버의 실행된 결과값을 사용자로 받아오는 방법
		success: function (data) {//success는 아작스로 받아오는것이 성공했을경우//서버 데이터를 data변수에 저장
			if(data==1){//중복 아이디가 있다면
				$newtext='<font color="red" size="3"><b>중복 아이디입니다.</b></font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append($newtext);          		
				$("#mem_id").val('').focus();
				return false;

			}else{//중복 아이디가 아니면
				$newtext='<font color="blue" size="3"><b>사용가능한 아이디입니다.</b></font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append($newtext);
				$("#mem_pwd").focus();
			}  	    	  
		},
		error:function(){
			//비동기식 아작스로 서버디비 데이터를
			//못가져와서 에러가 발생했을 때 호출되는 함수이다.
			alert("data error");
		}
	});//$.ajax
	/* end */	
}