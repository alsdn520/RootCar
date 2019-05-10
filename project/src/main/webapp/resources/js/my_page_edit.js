/**
 * member_join.js
 */
 function my_page_edit_check(){
	
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
	 if($.trim($("#mem_addr").val())==""){
		 alert("수정할 회원 주소를 입력하세요!");
		 $("#mem_addr").val("").focus();
		 return false;
	 }
	 
	 if($('input:checkbox[name="member_Activation"]').is(":checked")){
		 alert('수정 동의를 하였습니다.');
	 }else{
		 alert('수정 동의를 해주세요.');
		 return false;
	 }
 }
 