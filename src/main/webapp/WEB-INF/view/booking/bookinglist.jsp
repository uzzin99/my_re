<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>bookinglist</title>
</head>
<body>
aaas
<h1 align="center"><input type="text" value='${sVO.SName}'></h1>
<c:forEach var='i' items="${list}">
    <div align="center">
        <p>예약번호<input type="text" value='${i.HSeqno}'></p>
        <p>예약날짜 <input type="date" value='${i.HDate}'></p>
        <p>예약시간 <input type="time" value='${i.HTime}'></p>
        <p>예약인원수 <input type="text" value='${i.HPeople}'></p>
        <p>예약자 <input type="text" value='${i.HOnepeople}'></p>
        <p>연락처 <input type="text" value='${i.HMobile}'></p>
        <p>요청사항 <input type="textarea" value='${i.HRequest}'></p>
    </div>
</c:forEach>
</body>
</html>
