<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">

    $(document).ready(function(){
        fn_getWeather();
    });

    function fn_getWeather() {
        $('#btn').click(function(){

            $.ajax({
                url: 'getWeather.do',
                type: 'get',
                dataType: 'xml',

                success: function( resultXML ) {
                    var locationList = $(resultXML).find('location');
                    $('#weather').empty();
                    $.each(locationList, function(idx, location){
                        // 문제. 도시(city) 이름을 5칸을 합쳐서 <tbody id="weather"></tbody>에 표시하는 코드를 작성하시오.
                        $('<tr>')
                        .append($('td[colspan=5]').html($(this).location.find('city').text()))
                        .appendTo('#weather');
                        var dataList = $(location).find('data');
                        $.each(dataList, function(idx, data){
                            // 문제. 일시, 날씨, 최저기온, 최고기온, 습도를 <tbody id="weather"></tbody>에 표시하는 코드를 작성하시오.
                        $('<tr>')
                        .append($('<td>').html($(this).data.find('tmEf').text()))
                        .append($('<td>').html($(this).data.find('wf').text()))
                        .append($('<td>').html($(this).data.find('tmn').text()))
                        .append($('<td>').html($(this).data.find('tmx').text()))
                        .append($('<td>').html($(this).data.find('rnSt').text()))
                        .appendTo('#weather');
                        });
                    });
                },
                error: function() {
                    alert('실패');
                }
            });
        });
    }
</script>
</head>
<body>
    <h3>전국 중기 예보</h3>
    <input id="btn" type="button" value="중기예보가져오기" /><br/><br/>
    <table border="1">
        <thead>
            <tr>
                <td>일시</td>
                <td>날씨</td>
                <td>최저기온</td>
                <td>최고기온</td>
                <td>습도</td>
            </tr>
        </thead>
        <tbody id="weather"></tbody>
    </table>
</body>
</html>