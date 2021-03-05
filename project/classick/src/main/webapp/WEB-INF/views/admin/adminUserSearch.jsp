<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="Classick - 검색결과 페이지입니다." name="title"/>
</jsp:include>

<%-- css --%>
<link rel="stylesheet" type="text/css" href="/classick/assets/style/admin.css" />
<%-- script --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<%-- jQuery UI CSS파일 --%> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<%-- 날짜 jQuery 기본 js파일 --%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<%-- 날짜 jQuery UI 라이브러리 js파일 --%>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<%-- 주소 검색 jQuery 
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
		
		// 페이지 로드 이벤트
		$(document).ready(function () {
			memberView();
			memberUpdate();
			memberDelete();
			init();
			$('#mPFilename').on("change", previewImg);
		});

		
		/***** 2. 회원 정보 *****/
		function memberView() {
			$('body').on('click', '#btnView', function () {
				$('.not_remove').text('* 이메일 수정불가');
				$('#mPw2').hide();
				$('#mPwCheck').hide();
				$('#btnInsert').hide();
				$('#btnMInsert').css('visibility','visible;');
				$('.imgs_wrap_remove').css('display','block');
				$('.fas.fa-arrow-down').css('display','block');
				var mNo = $(this).parents('tr').find('input:hidden[name="mNo"]').val();
				var rNo = $(this).parents('tr').find('input:hidden[name="rNo"]').val();
				$('#mNoH').val(mNo);
				$('#rNoH').val(rNo);
		        var obj = {
		        	"mNo": mNo,
		        	"rNo": rNo
		        };
				
				$.ajax({
					url: 'memberView.do',
					type: 'post',
					data: JSON.stringify(obj),
					contentType: 'application/json',
					dataType: 'json',
					success: function (responseObj) {
						init();
						if(responseObj.result == true){
							$('input:text[name="mSno"]').val(responseObj.adminMemberDto.mSno);
							$('select[name="role"]').val(responseObj.adminMemberDto.role);
							$('input:password[name="mPw"]').val(responseObj.adminMemberDto.mPw);
							$('input:radio[name="mGender"][value="'+responseObj.adminMemberDto.mGender + '"]').prop('checked', true); 
							$('input:hidden[name="mPFilenameH"]').val(responseObj.adminMemberDto.mPFilename);
							if(responseObj.adminMemberDto.mPFilename != "/classick/assets/image/defaultPFile.jpg"){
								$('.imgs_wrap_remove').html("<img src='resources/storage/" + responseObj.adminMemberDto.mPFilename + "'/>");
							}else{
								$('.imgs_wrap_remove').html("<img src='" + responseObj.adminMemberDto.mPFilename + "'/>");								
							}
							$('input:text[name="mName"]').val(responseObj.adminMemberDto.mName);
							$('input:text[name="mEmail"]').val(responseObj.adminMemberDto.mEmail);
							$('select[name="mPayment"]').val(responseObj.adminMemberDto.mPayment);
							$('select[name="mGrade"]').val(responseObj.adminMemberDto.mGrade);
							$('input:text[name="mPno"]').val(responseObj.adminMemberDto.mPno);
							$('input:text[name="mPhone"]').val(responseObj.adminMemberDto.mPhone);
							$('input:text[name="mAddr"]').val(responseObj.adminMemberDto.mAddr);
							$('input:text[name="mLastAddr"]').val(responseObj.adminMemberDto.mLastAddr);
							$('input:text[name="mPoint"]').val(responseObj.adminMemberDto.mPoint);
							$('.adminMemberLeft input:hidden[name="mNo"]').remove();
							$('.adminMemberLeft').append($('<input type="hidden" name="mNo"/>').val(mNo));
							$('.adminMemberLeft input:hidden[name="rNo"]').remove();
							$('.adminMemberLeft').append($('<input type="hidden" name="rNo"/>').val(rNo));
						}
					},
					error: function () {						
						alert('실패');
					}
				});
			});
		}
		

		
		/***** 4. 회원 수정 *****/
		function memberUpdate() {
			$('#btnUpdate').click(function() {
				event.preventDefault();				
				var form = $('#fileUploadForm')[0];
			    var formData = new FormData(form);
			    
				$.ajax({
					url : 'memberUpdate.do', 
					type: 'post',	
					enctype: 'multipart/form-data',
					processData: false,
					contentType: false,
					data: formData,  
					cache: false,
		            timeout: 600000,
					success: function(data) {
						console.log("SUCCESS:", data);
						if(data.result == 1 || data.result == true){
							alert('회원이 수정되었습니다.');
							//$('<tr>').append($('<td>').html(data));
							$(this).parents('tr').append($('<td>').html(data));
							location.reload();
							init();
						}else if(data.result == -1){
							alert('수정내역이 없습니다.');
						}else if(data.result == 0){
							alert('회원 수정에 실패했습니다.');
						}
					},
					error: function (e) {
						alert('실패');
						console.log("ERROR : ", e);
					}
				});
			});
		}
		
		/***** 5. 회원 삭제 *****/
		function memberDelete() {
			$('body').on('click', '#btnDelete', function () {
			var mNo = $(this).parents('tr').find('input:hidden[name="mNo"]').val();
			var rNo = $(this).parents('tr').find('input:hidden[name="rNo"]').val();
			var mName = $(this).parents('tr').find('input:hidden[name="mName"]').val();
			var obj = {
		        	"mNo": mNo,
		        	"rNo": rNo
		        };
			var check = confirm(mName + '님 정보를 삭제할까요?');
			if(check){
				$.ajax({
					url: 'memberDelete.do',
		        	type: 'post',
		        	data: JSON.stringify(obj),
					contentType: 'application/json',
		        	dataType: 'json',
					success: function(responseObj) {
						if(responseObj.result == 1){
							alert('회원 정보가 삭제되었습니다.');
							location.reload();
						}else{
							alert('회원 정보 삭제에 실패하었습니다.');
						}
					},
					error: function() {
						alert('실패');
					}
				});
			}
			});
		}
		
		/***** 6. 초기화 *****/
		function init() {
			$('#btnInit').click(function () {
				$('select[name="role"]').val('');
				$('input:text[name="mSno"]').val('');
				$('input:password[name="mPw"]').val('');
				$('input:radio[name="mGender"]').prop('checked', false); 
				$('input:file[name="mPFilename"]').val('');
				$('input:text[name="mName"]').val('');
				$('input:text[name="mEmail"]').val('');
				$('select[name="mPayment"]').val('');
				$('select[name="mGrade"]').val('');
				$('input:text[name="mPno"]').val('');
				$('input:text[name="mPhone"]').val('');
				$('input:text[name="mAddr"]').val('');
				$('input:text[name="mLastAddr"]').val('');
				$('input:text[name="mPoint"]').val('');
				$('.imgs_wrap').empty();
				$('.imgs_wrap_remove').empty();
				$('#result').empty();
				$('#result2').empty();
				$('#result3').empty();
			});
			$('select[name="role"]').val('');
			$('input:text[name="mSno"]').val('');
			$('input:password[name="mPw"]').val('');
			$('input:radio[name="mGender"]').prop('checked', false); 
			$('input:file[name="mPFilename"]').val('');
			$('input:text[name="mName"]').val('');
			$('input:text[name="mEmail"]').val('');
			$('select[name="mPayment"]').val('');
			$('select[name="mGrade"]').val('');
			$('input:text[name="mPno"]').val('');
			$('input:text[name="mPhone"]').val('');
			$('input:text[name="mAddr"]').val('');
			$('input:text[name="mLastAddr"]').val('');
			$('input:text[name="mPoint"]').val('');
			$('.imgs_wrap').empty();
			$('.imgs_wrap_remove').empty();
			//$('.not_remove').empty();
			$('#result').empty();
			$('#result2').empty();
			$('#result3').empty();
		}
		
		<%-- 날짜api --%>
		$(function() {
		    $( "#mSno" ).datepicker({
		    	dateFormat: 'yy-mm-dd',
		    	minDate:'-100y',
		    	yearRange: 'c-100:c',
		    	changeMonth: true,
		    	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		         changeYear: true,
		         nextText: '다음 달',
		         prevText: '이전 달'
		    });
		});
		<%-- 지도api 
		$(function() { $("#searchmPno").postcodifyPopUp();});--%>

	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;

	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';

	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = null;
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
		

function previewImg(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
	
	filesArr.forEach(function (f) {
		if(!f.type.match(reg)){
			alert("이미지만 가능합니다.");
			return;
		}
		
		sel_file = f;
		
		var reader  = new FileReader();
		reader.onload = function (e) {
			var img_html = "<img src=\"" + e.target.result + "\" />";
			$(".imgs_wrap").append(img_html); 
			//$(".imgs_wrap").css("background-image", "url('" + e.target.result + "')");
			
		}
		reader.readAsDataURL(f);
	});
}

</script>
	<br/><br/>
	<div class="adminMemberTable">
			<h3>회원 목록 검색 결과</h3>
			<input type="button" id="pageReturn_btn" onclick="location.href='adminUserList.do'">
			<div id="totalRecord"></div><br/><br/>
	<table border="1">
				<thead>
					<tr>
						<td>No</td>
						<td>생년월일</td>
						<td>이름</td>
						<td>이메일</td>
						<td>PW</td>
						<td>성별</td>
						<td>우편번호</td>
						<td>기본 주소</td>
						<td>나머지 주소</td>
						<td>전화번호</td>
						<td>프로필</td>
						<td>결제방법</td>
						<td>구매포인트</td>
						<td>회원등급</td>
						<td>가입일</td>
						<td>회원분류</td>
						<td colspan="2">비고</td>
					</tr>
				</thead>
				<tbody id="adminMemberList">
					<c:if test="${empty list }">
						<tr>
							<td colspan="18">검색된 직원이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty list }">
						<c:forEach var="AdminMemberDto" items="${list}">
							<tr>
								<td>${AdminMemberDto.mNo}</td>
								<td>${AdminMemberDto.mSno}</td>
								<td>${AdminMemberDto.mName}</td>
								<td>${AdminMemberDto.mEmail}</td>
								<td id="mPwLock">${AdminMemberDto.mPw}</td>
								<td>${AdminMemberDto.mGender}</td>
								<td>${AdminMemberDto.mPno}</td>
								<td>${AdminMemberDto.mAddr}</td>
								<td>${AdminMemberDto.mLastAddr}</td>
								<td>${AdminMemberDto.mPhone}</td>
								<c:choose>
									<c:when test="${AdminMemberDto.mPFilename eq null}">
										<td><img src="/classick/assets/image/defaultPFile.jpg"></td>																		
									</c:when>
									<c:when test="${AdminMemberDto.mPFilename eq '/classick/assets/image/defaultPFile.jpg'}">
										<td><img src="/classick/assets/image/defaultPFile.jpg"></td>																		
									</c:when>
									<c:when test="${AdminMemberDto.mPFilename ne '/classick/assets/image/defaultPFile.jpg'}">
										<td><img src="resources/storage/${AdminMemberDto.mPFilename}"></td>									
									</c:when>
								</c:choose>
								<td>${AdminMemberDto.mPayment}</td>
								<td>${AdminMemberDto.mPoint}</td>
								<td>${AdminMemberDto.mGrade}</td>
								<td>${AdminMemberDto.mRegDate}</td>
								<td>${AdminMemberDto.role}
									<input type="hidden" name="mNo" value="${AdminMemberDto.mNo}"/>
									<input type="hidden" name="rNo" value="${AdminMemberDto.rNo}"/>
									<input type="hidden" name="mName" value="${AdminMemberDto.mName}"/>
								</td>
								<td><input type="button" id="btnView"/></td>
								<td><input type="button" id="btnDelete"/></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
	</div>
		<div class="display">
			<button onclick="onDisplay()" id="onDisplay">회원 등록/수정/보기 창 띄우기<br/><i class="fas fa-eye"></i></button>
			<button onclick="offDisplay()" id="offDisplay">회원 등록/수정/보기 창 숨기기<br/><i class="fas fa-eye-slash"></i></button>
		</div>
			<script type="text/javascript">
			$(function () {
				$('#mPwLock').text('******');
			})
			function onDisplay() {
				$('.adminMemberBottom').show();
			}
			function offDisplay() {
				$('.adminMemberBottom').hide();
			}
			
			function btnMInsert() {
				init();
				$('.not_remove').empty();
				$('#mPw2').show();
				$('#mPwCheck').show();
				$('#btnInsert').show();
				$('#btnMInsert').css("visibility","hidden");
				$('.imgs_wrap_remove').css('display','none');
				$('.fas.fa-arrow-down').css('display','none');
			}
			
			/* $(function () {
				$('#mPw').keyup(function () {
					$('#result').html('');
				});
				$('#mPw2').keyup(function () {
					var regExpPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/;
					var mPw = document.getElementById('mPw');
					if($('#mPw').val() != $('#mPw2').val()){
					  $('#result2').html('비밀번호 일치하지 않음');
			          $('#result2').css('color', '#f82a2aa3');
			        }else{
			          if(regExpPw.test(mPw)) {
				          $('#result2').html('비밀번호 일치함');
				          $('#result2').css('color', '#199894b3');			        	  
			          }else{
				          $('#result2').html('영문, 숫자, 특수문자를 조합한 8자 이상의 비밀번호를 입력해주세요.');
				          $('#result2').css('color', '#f82a2aa3');			        	  			        	  
			          }
			        }
				});
			}); */
			
			$(function () {
				$('#mPw').keyup(function () {
				// 8~16자, 영문 대소문자+숫자(필수), 특수문자(선택)
				// 성공 : 사용 가능한 비밀번호입니다. + limegreen
				// 실패 : 8~16자, 영문 대소문자와 숫자(필수), 특수문자(선택) + red
				var regExpPW = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[A-Za-z0-9~!@#$%^&*-_?]{8,16}$/;
				var result = document.getElementById('result');
				if ($('#mPw').val() == '') {
					$('#result').empty();
					result.textContent = '필수 정보입니다.';
					$('#result').css('color', 'red');
				} else {
					if ( regExpPW.test($('#mPw').val()) ) {
						$('#result').empty();
						result.textContent = '사용 가능한 비밀번호입니다.';
						$('#result').css('color', 'limegreen');
						return true;
					} else {
						$('#result').empty();
						result.textContent = '8~16자, 영문 대소문자와 숫자(필수), 특수문자(선택)';
						$('#result').css('color', 'red');
					}
				}
				});
				$('#mPw2').keyup(function () {
				var regExpPW = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[A-Za-z0-9~!@#$%^&*-_?]{8,16}$/;
				var result2 = document.getElementById('result2');
				if($('#mPw').val() != $('#mPw2').val()){
					$('#result2').empty();
					result2.textContent = '비밀번호가 다릅니다.';
					$('#result2').css('color', 'red');						
				}
				if ($('#mPw2').val() == '') {
					$('#result2').empty();
					result2.textContent = '비밀번호를 확인하세요.';
					$('#result2').css('color', 'red');
				}
				else{
					if ( regExpPW.test($('#mPw2').val()) ) {
						$('#result2').empty();
						result2.textContent = '비밀번호가 확인되었습니다.';
						$('#result2').css('color', 'limegreen');
						return true;
					}
					else{
						$('#result2').empty();
						result2.textContent = '8~16자, 영문 대소문자와 숫자(필수), 특수문자(선택)';
						$('#result2').css('color', 'red');
					}
					
				}
			  });
				
			});
			
			function emailCheck(f) {

				// 유효한 이메일: 사용 가능한 이메일입니다.(녹색)
				// 유효하지 않은 이메일: 유효하지 않은 이메일입니다.(빨강)
				var regExpEmail = /^[a-z][a-z0-9-_]+@[a-zA-Z0-9]{3,}(\.[a-zA-Z]{2,6}){1,2}$/;
				var email = f.mEmail.value;
				var result = document.getElementById('result3');
				
				if( regExpEmail.test(email) ) {
					result.textContent = '사용 가능한 이메일입니다.';
					result.setAttribute('class', 'check-ok');
					$("#result3").css('color', 'green');
				} else {
					result.textContent = '유효하지 않은 이메일입니다.';
					result.setAttribute('class', 'check-not');
					$("#result3").css('color', 'red');
				}
				
			}
			
			function deleteMPF() {
				$('#mPFilenameH').val('');
				$('.imgs_wrap_remove').empty();
				$('.imgs_wrap').empty();
				$('#mPFilename').val('');
			}
		</script>
	<div class="adminMemberBottom">
		<div class="adminMemberBottomLeft">
				<h3>회원 수정/보기</h3>
						<form id="fileUploadForm" method="post" enctype="multipart/form-data">
							<div class="adminMemberDiv">
								<label>프로필</label><br>
								<div class="outline">
									<div class="imgs_wrap_remove" style="display: none;"></div>
									<i class="fas fa-arrow-down" style="padding-left: 30px; display: none;"></i>
									<div class="imgs_wrap" ></div>
									<label for="mPFilename" id="mPFilenameU"></label>
									<input type="file" name="mPFilename" id="mPFilename"/>
									<input type="button" onclick="deleteMPF()" id="mPFilenameD" />
									<input type="hidden" name="mPFilenameH" id="mPFilenameH"/>
								</div>
							</div>
							<div class="adminMemberDiv">
								<span class="not_remove"></span><br/>
								<label for="mEmail"><em class="asterisk red">∗</em>이메일</label><br/>
								<input type="text" name="mEmail" id="mEmail" placeholder="이메일을 입력해주세요." onchange="emailCheck(this.form)"/><br/>
								<div id="result3"></div>
							</div>
							<div class="adminMemberDiv">
								<label for="mPw"><em class="asterisk red">∗</em>PW</label><br>
								<input type="password" name="mPw" id="mPw" placeholder="8~16자 영문 대소문자와 숫자(필수), 특수문자(선택)"><br/>
								<div id="result" class="pw-check-result"></div>
								<input type="password" name="mPw2" id="mPw2" placeholder="비밀번호 확인"><br/>
								<div id="result2" class="pw-check-result2"></div>
								<%-- <input type="button" value="검사" id="mPwCheck" onclick="pwCheck(this.form)"/>  --%>
							</div>
							<div class="adminMemberDiv">
								<label for="mName"><em class="asterisk red">∗</em>이름</label><br>
								<input type="text" name="mName" id="mName" placeholder="이름을 입력해주세요.">
							</div>
							<div class="adminMemberDiv">
								<label for="mSno">생년월일</label><br/>
								<input type="text" name="mSno" id="mSno" placeholder="년도-월-일">
							</div>
							<div class="adminMemberDiv">
								<label for="mPhone"><em class="asterisk red">∗</em>전화번호</label><br>
								<input type="text" name="mPhone" placeholder="010-0000-0000" id="mPhone">
							</div>
							<div class="adminMemberDiv">
								성별<br>
								<input type="radio" name="mGender" value="남" id="mGenderM" checked/><label for="mGenderM" id="mGenderML">남</label>
								<input type="radio" name="mGender" value="여" id="mGenderW"/><label for="mGenderW" id="mGenderWL">여</label>
							</div>
							<div class="adminMemberDiv">
								<label for="sample4_postcode">우편번호</label><br>
								<input type="text" name="mPno" id="sample4_postcode" placeholder="우편번호"> <!-- class="postcodify_postcode5" -->
								<input type="button" id="mPnoSearch" onclick="sample4_execDaumPostcode()" ><br/><!-- <button id="searchmPno">검색</button> -->
								<input type="text" name="mAddr"id="sample4_roadAddress" placeholder="도로명주소"><br/> <!--  class="postcodify_address" -->
								<input type="text" name="mLastAddr" id="mLastAddr" placeholder="세부주소"> <!-- class="postcodify_details" -->
							</div>
							<div class="adminMemberDiv">
								<label for="mPayment">결제방법</label><br>
								<select name="mPayment" id="mPayment">
									<option value="">결제방법 선택</option>
									<option value="무통장 입금">무통장입금</option>
									<option value="카드 결제">카드 결제</option>
									<option value="가상계좌">가상 계좌</option>
									<option value="휴대폰 결제">휴대폰 결제</option>
								</select>
							</div>
							<div class="adminMemberDiv">
								<label for="mPoint">구매포인트</label><br>
								<input type="text" name="mPoint" id="mPoint" placeholder="0">
							</div>
							<div class="adminMemberDiv">
								<label for="mGrade"><em class="asterisk red">∗</em>회원등급</label><br>
								<select name="mGrade" id="mGrade">
									<option value="">회원등급 선택</option>
									<option value="금손">금손</option>
									<option value="은손">은손</option>
									<option value="곰손">곰손</option>
									<option value="아기손">아기손</option>
								</select>
							</div>
							<div class="adminMemberDiv">
								<label for="role"><em class="asterisk red">∗</em>회원분류</label><br>
								<select name="role" id="role">
									<option value="">회원분류 선택</option>
									<option value="관리자">관리자</option>
									<option value="일반회원">일반회원</option>
								</select>
							</div>
							<input type="hidden" name="mNo" id="mNoH">
							<input type="hidden" name="rNo" id="rNoH">
						</form> 
						<br/><br/><br/>
							<div class="adminMemberBtn">
									<input type="button" value="수정" id="btnUpdate"/>
									<input type="button" value="초기화" id="btnInit"/>
							</div>
			</div>
			<div class="adminMemberBottomRight">
			</div>
		</div>
<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp" %>