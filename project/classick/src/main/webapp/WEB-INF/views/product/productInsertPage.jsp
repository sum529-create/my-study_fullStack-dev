<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="Classick - 상품 등록" name="title"/>
</jsp:include>

<script type="text/javascript" src="/classick/assets/lib/SmartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/classick/assets/lib/sheepit/jquery.sheepItPlugin.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<script type="text/javascript">

	var rowCount = 0;

	$(function(){
		fn_calPrice();
		fn_calDisRate();
		fn_tagList();
		fn_selectedByCategory();
		$('.notFood').css('display','none');
		$('.food').css('display','none');
		fn_freeCheck();
		fn_safetyCheck();
		fn_pOptionRow();
	});
	
	function fn_freeCheck(){
		$('#freeCheck').change(function(){
			var freeCheck = $('#freeCheck').is(":checked"); 
			if(freeCheck){
				$("input:text[name='pASDesc1']").prop("disabled", true);
				$("input:text[name='pASDesc2']").prop("disabled", true);
				
			}else {
				$("input:text[name='pASDesc1']").prop("disabled", false);
				$("input:text[name='pASDesc2']").prop("disabled", false);
			}
		});
	}
	
	function fn_calDisRate(){
		$('#pPrice').keyup(function(){
			var pListPrice = $('#pListPrice').val();
			if(pListPrice != ''){
				var pPrice = $('#pPrice').val();
				var calDisRate = (Math.floor(100 - (100/(pListPrice/pPrice))));
				$('#pDisRate').val(calDisRate);
			}
		});
	}

	function fn_calPrice(){
		$('#pDisRate').keyup(function(){
			var pListPrice = $('#pListPrice').val();
			if(pListPrice != ''){
				var pDisRate = $('#pDisRate').val();
				var calPrice = 0;
				if( pDisRate > 100){
					calPrice = 0;
				} else if( pDisRate < 0){
					calPrice = pPrice;
				} else {
					calPrice = pListPrice - (pListPrice*(pDisRate/100));
				}
				$('#pPrice').val((Math.floor(calPrice/10)*10));
				//$('#calPrice').empty();
				//$('#calPrice').text('[ 할인율 적용 판매가: ' + (Math.floor(calPrice/10)*10) + '원 ]');
			}
		});
	}

	function fn_tagList(){
		$('#pTag').keyup(function(){
			var tagText = $('#pTag').val();
			if(tagText.includes(',') > 0){
				var tagList = tagText.split(',');
				if( tagList.length > 0 && tagText.includes(',') > 0){
					for (var i = 0; i < tagList.length; i++) {
						//$('#tagList').append($('<span>').text(tagList[i]));
					}
				} else{
					$('#tagList').empty();
				}
			}
		});
	}
	
	function fn_selectedByCategory(){
		$('#pCategory').change(function(){
			var food = ['음료(커피,차 등)', '디저트,베이커리,떡', '농축수산물', '수제 반찬', '그 외 수제먹거리', '전통주' ];
			var pCategory = $('#pCategory').val();
			if(food.indexOf(pCategory) != -1){
				$('.food').css('display','table-row');
				$('.notFood').css('display','none');
			}else {
				$('.notFood').css('display','table-row');
				$('.food').css('display','none');
			}
		});
	}
	
	function fn_safetyCheck(){
		$("#safetyChk").change(function(){
	        if($("#safetyChk").is(":checked")){
	        	$("#safetyInput").val('safe');
	        }else{
	        	$("#safetyInput").val('not-safe');
	        }
	        console.log($("#safetyInput").val());
	    });
		
	}
	
	function fn_pOptionRow(){
		
        $("#optionAdd").click(function(){
        	$('<tr>')
			.append($('<td>').append($('<input/>', {type: 'text', name: 'optionTitle', placeholder: '예) 용량, 사이즈, 컬러' })))
			.append($('<td>').append($('<input/>', {type: 'text', name: 'optionContent', placeholder: '예) 1kg, M, Black' })))
			.append($('<td>').append($('<input/>', {type: 'text', name: 'optionPrice', placeholder: '예) 3000'})))
			.append($('<td>').append($('<input/>', {type: 'text', name: 'optionStock', placeholder: '예) 999'})))
			.appendTo('#pOptionRow');
 	     });

        $("#optionRemove").click(function(){
            var targetRow = $('#pOptionRow > tr:last');
            var rowLength = $('#pOptionRow > tr').length;
            console.log(targetRow);
            console.log(rowLength);
			if(rowLength > 1){
	            targetRow.remove();
			}
        });

	}

</script>

<section class="banner-title" data-image="type1" data-theme="blue">
	<h1>상품 등록</h1>
	<p>판매하고자 하는 상품을 등록해주세요.</p>
</section>
<div class="inner-w mt40">
	<form method="post" enctype="multipart/form-data">
		<table class="formTable">
			<tbody>
				<tr>
					<td colspan="3"><h2>상품(작품) 정보</h2></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input class="wd70 ht30px" type="text" name="pName"/></td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>
						<select name="pCategory" id="pCategory" class="wd30 ht30px">
							<option value="">상품 카테고리를 선택하세요</option>
							<option value="음료(커피,차 등)">음료(커피, 차 등)</option>
							<option value="디저트,베이커리,떡">디저트, 베이커리, 떡</option>
							<option value="농축수산물">농축수산물</option>
							<option value="수제 반찬">수제 반찬</option>
							<option value="그 외 수제먹거리">그 외 수제먹거리</option>
							<option value="전통주">전통주</option>
							<option value="문구,팬시">문구, 팬시</option>
							<option value="휴대폰 케이스">휴대폰 케이스</option>
							<option value="전자기기 관련">전자기기 관련</option>
							<option value="꽃(생화,드라이,다육)">꽃 (생화, 드라이, 다육)</option>
							<option value="캔들,디퓨져,방향제">캔들, 디퓨져, 방향제</option>
							<option value="향수,화장품,뷰티">향수, 화장품, 뷰티</option>	
							<option value="반지">반지</option>	
							<option value="귀걸이">귀걸이</option>	
							<option value="목걸이">목걸이</option>	
							<option value="팔찌">팔찌</option>	
							<option value="그 외 액세서리">그 외 액세서리</option>	
							<option value="비누,천연비누">비누, 천연비누</option>	
							<option value="섬유,의류,퀄트">섬유, 의류,퀄트</option>	
							<option value="패션잡화">패션잡화</option>	
							<option value="인테리어 소품">인테리어 소품</option>	
							<option value="도자기">도자기</option>	
							<option value="주방,생활">주방, 생활</option>	
							<option value="가구">가구</option>	
							<option value="지갑(지폐,카드,동전,명함)">지갑 (지폐,카드,동전,명함)</option>	
							<option value="가방,파우치">가방, 파우치</option>	
							<option value="시계">시계</option>	
							<option value="남성 수제화">남성 수제화</option>	
							<option value="여성 수제화">여성 수제화</option>	
							<option value="인형,장난감">인형, 장난감</option>	
							<option value="반려동물 용품">반려동물 용품</option>	
							<option value="페인팅,캐리커쳐,캘리">페인팅, 캐리커쳐, 캘리</option>	
							<option value="육아,아동">육아, 아동</option>	
							<option value="파인아트">파인아트</option>	
							<option value="공예">공예</option>	
							<option value="기타">기타</option>	
						</select>				
					</td>
				</tr>
				<tr>
					<td>상품 가격</td>
					<td><input class="taRight wd30 ht30px" type="text" id="pListPrice" name="pListPrice" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>&nbsp;원</td>
				</tr>
				<tr>
					<td>판매 가격</td>
					<td>
						<input class="taRight wd30 ht30px" type="text" id="pPrice" name="pPrice" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>&nbsp;원
					</td>
				</tr>
				<tr>
					<td>상품 할인율</td>
					<td>
						<input class="taRight wd40px ht30px" type="text" id="pDisRate" name="pDisRate" value="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />&nbsp;퍼센트(%)
						<!-- <span id="calPrice"></span> -->
					</td>
				</tr>
				<tr>
					<td>상품 설명</td>
					<td><textarea name="pDesc" id="smartEditor" class="wd70"></textarea></td>
				</tr>
				<tr>
					<td>상품 옵션(옵션,추가금액,재고)</td>
					<td>
						 <table class="pOptionTable">
							<thead>
								<tr>
									<th>구분</th>
									<th>내용</th>
									<th>추가금액</th>
									<th>판매재고</th>
									<th style="vertical-align: middle; width:70px;"><input type="button" id="optionAdd" value="추가"/>&nbsp;<input type="button" id="optionRemove" value="삭제"/></th>
								</tr>
							</thead>
							<tbody id="pOptionRow">
								<tr>
									<td><input type="text" name="optionTitle" placeholder="예) 용량, 사이즈, 컬러" /></td>
									<td><input type="text" name="optionContent" placeholder="예) 1kg, M, Black" /></td>
									<td><input type="text" name="optionPrice" placeholder="예) 3000" /></td>
									<td><input type="text" name="optionStock" placeholder="예) 999" /></td>
								</tr>
							</tbody>
						</table>
						
					</td>
				</tr>
				<tr>
					<td>상품 이미지</td>
					<td><input type="file" name="pImages" multiple /></td>
				</tr>
				<tr>
					<td>상품 태그(#)</td>
					<td>
						<input class="wd70 ht30px" type="text" id="pTag" name="pTag" />
						<br/><span id="tagList"></span>
					</td>
				</tr>
				<tr>
					<td colspan="3"><h2>상품(작품) 상세 정보</h2></td>
				</tr>
				<tr class="notFood">
					<td>종류</td>
					<td>
						<input class="wd50 ht30px" type="text" name="pDetail" />
					</td>
				</tr>
				<tr class="notFood">
					<td>소재</td>
					<td>
						<input class="wd50 ht30px" type="text" name="pDetail" />
					</td>
				</tr>
				<tr class="notFood"> 
					<td>사이즈</td>
					<td>
						<input class="wd50 ht30px" type="text" name="pDetail" />
					</td>
				</tr>
				<tr class="notFood">
					<td>제조사 / 제조국</td>
					<td>
						제조사: <input class="wd20 ht30px" type="text" name="pDetail" />
						제조국: <input class="wd20 ht30px" type="text" name="pDetail" />
					</td>
				</tr>
				<tr class="notFood">
					<td>취급시 주의사항</td>
					<td>
						<textarea name="pDetail" id="" cols="50" rows="3"></textarea>
					</td>
				</tr>
				<tr class="notFood">
					<td>품질보증기준</td>
					<td>
						<textarea name="pDetail" id="" cols="50" rows="3"></textarea>
					</td>
				</tr>
				<tr class="food">
					<td>식품의 유형</td>
					<td>
						<input class="wd50 ht30px" type="text" name="pDetail" />
					</td>
				</tr>
				<tr class="food">
					<td>생산자 및 소재지</td>
					<td>
						생산자: <input class="wd30 ht30px" type="text" name="pDetail" /> <br/><br/>
						소재지: <input class="wd30 ht30px" type="text" name="pDetail" />
					</td>
				</tr>
				<tr class="food"> 
					<td>제조연월일, 유통기한 또는 품질유지기한</td>
					<td>
						제조연월일: <input class="ht30px" type="text" name="pDetail" placeholder="예) 2021년 1월 1일"/> <br/><br/>
						유통기한 또는 품질유지기한: <input class="wd30 ht30px" type="text" name="pDetail" placeholder="예) 제조일로부터 30일" />
					</td>
				</tr>
				<tr class="food">
					<td>포장단위별 용량(중량), 수량</td>
					<td>
						포장단위별 용량(중량): <input class="wd20 ht30px" type="text" name="pDetail"/><br/><br/>
						포장단위별 수량: <input class="wd20 ht30px" type="text" name="pDetail" />
					</td>
				</tr>
				<tr class="food">
					<td>안전식품 표시 가능 여부</td>
					<td>
						<input type="checkbox" id="safetyChk" value="safe" style="vertical-align: middle"/>
						<input type="hidden" name="pDetail" id="safetyInput" value="not-safe"/>
						<label for="safetyChk" style="line-height: 30px">식품위생법에 따른 영업 신고 및 등록이 되어있는 상품입니다.</label>
					</td>
				</tr>
				<tr class="food">
					<td>원재료명 및 함량</td>
					<td>
						<textarea name="pDetail" id="" cols="50" rows="5"></textarea>
					</td>
				</tr>
				<tr class="food">
					<td>영양성분</td>
					<td>
						<textarea name="pDetail" id="" cols="50" rows="5"></textarea>
					</td>
				</tr>
				<tr class="food">
					<td>보관방법 또는 취급방법</td>
					<td>
						<textarea name="pDetail" id="" cols="50" rows="5"></textarea>
					</td>
				</tr>
				<tr class="food">
					<td>관리법상 표시사항</td>
					<td>
						<textarea name="pDetail" id="" cols="50" rows="5"></textarea>
					</td>
				</tr>
				<tr class="food">
					<td>유전자변형식품에 해당하는 경우의 표시</td>
					<td>
						<textarea name="pDetail" id="" cols="50" rows="2"></textarea>
					</td>
				</tr>
				<tr class="food">
					<td>영유아식 또는 체중조절식품 등에 해당하는 경우 표시광고 사전심의필 유무 및 부작용 발생 가능성</td>
					<td>
						<textarea name="pDetail" id="" cols="50" rows="3"></textarea>
					</td>
				</tr>
				<tr class="food">
					<td>수입식품에 해당하는 경우</td>
					<td>
						<textarea name="pDetail" id="" cols="50" rows="2"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="3"><h2>배송 관련</h2></td>
				</tr>
				<tr>
					<td>배송비 기본료</td>
					<td>
						<input type="checkbox" id="freeCheck" />&nbsp;무료 배송&nbsp;&nbsp;
						<input class="taRight wd10 ht30px" type="text" name="pASDesc1" value="3500" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>&nbsp;원&nbsp;&nbsp;
						<input class="taRight wd10 ht30px" type="text" name="pASDesc2" value="50000" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>&nbsp;원 이상 구매시 무료배송
					</td>
				</tr>
				<tr>
					<td>제주 / 도서산간 추가비용</td>
					<td><input class="taRight wd10 ht30px" type="text" name="pASDesc3" value="3000" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>&nbsp;원</td>
				</tr>
				<tr>
					<td>제작 / 배송 소요기간</td>
					<td><input class="taRight wd10 ht30px" type="text" name="pASDesc4" value="3" placeholder="예) 3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>&nbsp;일 이내</td>
				</tr>
				<tr>
					<td>제작 / 배송 방법</td>
					<td>
						<textarea name="pASDesc5" cols="50" rows="3">주문 후 제작에 들아가는 제품입니다.</textarea>
					</td>
				</tr>
				<tr>
					<td>교환 / 환불 정책</td>
					<td>
						<select name="pASDesc6">
							<option value="조건확인">조건확인</option>
							<option value="불가">불가</option>
							<option value="불가">가능</option>
						</select><br/><br/>
						
						<textarea name="pASDesc7" cols="50" rows="5">주문 전 판매 작가님과 연락하여 확인해주세요.</textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2">
						<br/><br/><br/>
						<input class="wd20 ht30px" type="button" value="상품 등록" onclick="fn_productInsert(this.form)"/>
					</th>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
	
<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp" %>
<script>
	var oEditors = []; 
	nhn.husky.EZCreator.createInIFrame({ 
		oAppRef : oEditors, elPlaceHolder : "smartEditor", //저는 textarea의 id와 똑같이 적어줬습니다. 
		sSkinURI : "/classick/assets/lib/SmartEditor2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요! 
		fCreator : "createSEditor2", 
		htParams : { // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseVerticalResizer : false, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseModeChanger : false } 
	});
	
	$(function() {
		$("#savebutton").click(function(){
			oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); //textarea의 id를 적어줍니다. 
			var content = document.getElementById("smartEditor").value;
			
			if(content == "" || content == null || content == '&nbsp;' || content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
				alert("본문을 작성해주세요."); 
				oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱 
				return; 
			} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다. 
			var result = confirm("발행 하시겠습니까?"); 
			if(result){ 
				alert("발행 완료!"); 
				$("#noticeWriteForm").submit(); 
			}else { 
				return; 
			}
		});
	});
	
	function fn_productInsert(f){
		
		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); //textarea의 id를 적어줍니다. 
		var pDesc = f.pDesc.value;
		
		if(f.pName.value == ''){
			alert('상품명을 입력해주세요.');
			f.pName.focus();
			return;
		}
		
		if(f.pCategory.value == ''){
			alert('카테고리를 선택해주세요.');
			f.pCategory.focus();
			return;
		}
		
		if(f.pPrice.value == ''){
			alert('상품 가격을 입력해주세요.');
			f.pPrice.focus();
			return;
		}
		
		if(pDesc == "" || pDesc == null || pDesc == '&nbsp;' || pDesc == '<br>' || pDesc == '<br/>' || pDesc == '<p>&nbsp;</p>'){
			alert("상품 설명을 작성해주세요."); 
			oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱 
			return; 
		} 
		
		var count = $("tbody[id=pOptionRow]>tr").length;
		if(count == 1){
			if(f.optionTitle.value == '' || f.optionContent.value == '' || f.optionPrice.value == '' || f.optionStock.value == ''){
				alert("상품 옵션을 작성해주세요."); 
				f.optionTitle.focus();
				return;
			}
		}else{
			for (var i = 0; i < count; i++) {
				if(f.optionTitle[i].value == '' || f.optionContent[i].value == '' || f.optionPrice[i].value == '' || f.optionStock[i].value == ''){
					alert("상품 옵션을 작성해주세요."); 
					f.optionTitle[0].focus();
					return;
				}
			}
		}
		
		if(f.pASDesc1.value == '' || f.pASDesc2.value == '' || f.pASDesc3.value == '' || f.pASDesc4.value == '' ){
			alert('배송 관련 정보를 모두 입력해주세요.');
			return;
		}
		
		var result = confirm("상품을 등록 하시겠습니까?"); 
		if(result){ 
			f.action = 'productInsert.do'; 
			f.submit(); 
		}else { 
			return; 
		}
		
	}
</script>