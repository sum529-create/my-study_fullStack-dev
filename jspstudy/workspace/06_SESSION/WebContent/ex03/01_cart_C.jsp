<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String product = request.getParameter("product");
		String quantity = request.getParameter("quantity");
		
		// 무슨 제품을 몇개 구매한다.
		// 제품:key, 몇 개: Value->Map
		
		Map<String, String> map = new HashMap<>();
		map.put(product, quantity);
		
		// map을 하나의 제품으로 간주하고 map을 여러개 저장할 수 있는
		// ArrayList를 cart로 선언한다.
		// ArrayList<Map> cart = new ArrayList<>();	// 새로 만드는 cart
													//첫번째는 잘 수행되지만, 두번째로는 오류가 날 가능성이 있다?
		// session에서 cart를 꺼내왔는데 없는 경우에는 새로 cart를 만든다.
		ArrayList<Map> cart = (ArrayList<Map>)session.getAttribute("cart");
		
		if(cart == null){	// 첫 장바구니 담기
			cart = new ArrayList<>();	// cart 새로 만들기
			session.setAttribute("cart", cart);	// 장바구니 세션에 보관
		}	// 빈 카트 올림
		
		// 무슨 작업이 추가로 필요한가요?
		// map(제품)을 cart(장바구니)에 담아둔다.
		// ArrayList에 데이터 추가 메소드: add()
		cart.add(map);	// 담는 것은 무조건적으로 담아준다.
		
	%>
	
	<script type="text/javascript">
		
		// 자바 변수는 자바 스크립트에서 사용 할 수 있다.
		// 제품명을 가져와서
		// 냉장고를 장바구니에 추가했습니다. (alert) 
		// 장바구니로 가려면 "확인"	(confirm)
		// 계속 쇼핑하려면 "취소"를 누르세요.
		
		alert('<%=product%>'+"를 장바구니에 추가했습니다.")
		// 제품을 ' '로 감싸 줄것
		if(confirm('장바구니로 가려면 "확인", 계속 쇼핑하려면 "취소"를 누르세요.')){
			location.href='/06_SESSION/ex03/01_cart_D.jsp';
		}else{
			location.href='/06_SESSION/ex03/01_cart_B.jsp';
		}
		
		
	
	</script>
	
</body>
</html>