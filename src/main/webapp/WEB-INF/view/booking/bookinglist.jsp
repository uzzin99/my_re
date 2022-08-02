<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var='blist' items='${blist}'>
    <tr><td>가게이름</td><td>${blist.SName}</td></tr>
    <tr><td>예약날짜</td><td>${blist.HDate}</td></tr>
    <tr><td>예약시간</td><td>${blist.HTime}</td></tr>
    <tr><td>예약번호</td><td>NO.${blist.HSeqno}</td></tr>
    <tr><td>인원수</td><td>${blist.HPeople}</td></tr>
    <tr><td>예약자</td><td>${blist.HOnepeople}</td></tr>
    <tr><td>연락처</td><td>${blist.HMobile}</td></tr>
</c:forEach>
</body>
</html>
