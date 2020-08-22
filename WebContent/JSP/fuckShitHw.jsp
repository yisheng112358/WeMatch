<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    
</head>
<body>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"
            +request.getServerName()+":"
            +request.getServerPort()+path+"/";
%>

<%-- <base href="<%=basePath%>"> --%>


<%-- <img src="${pageContext.request.contextPath }"><br/> --%>
你的天選之人:${Name[0]}<br/><img src="${pageContext.request.contextPath}/images/10.jpg"><br/>         
你的天選之人:${Name[1]}<br/><img src="${pageContext.request.contextPath}/images/100.jpg"><br/>
你的天選之人3:${Name[2]}<br/><img src="${pageContext.request.contextPath}/images/20.jpg"><br/> 
你的天選之人4:${Name[3]}<br/><img src="${pageContext.request.contextPath}/images/200.jpg"><br/>   
你的天選之人5:${Name[4]}<br/>   





</body>
</html>