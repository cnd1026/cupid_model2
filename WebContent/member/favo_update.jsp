<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/head.jsp" %>
<%
request.setCharacterEncoding("utf-8");

String[] favo = request.getParameterValues("favo");
String[] favo1 = request.getParameterValues("favo1");
String[] favo2 = request.getParameterValues("favo2");
String[] favo3 = request.getParameterValues("favo3");

%>

취미 : <%=favo[0] %>

<%

for (int i=1; i<favo.length; i++) {
%>
, <%=favo[i] %>
<%
}
%>
<br>
음식 : <%=favo1[0] %>

<%

for (int i=1; i<favo1.length; i++) {
%>
, <%=favo1[i] %>
<%
}
%>
<br>
음악 : <%=favo2[0] %>

<%

for (int i=1; i<favo2.length; i++) {
%>
, <%=favo2[i] %>
<%
}
%>
<br>
스포츠 : <%=favo3[0] %>

<%

for (int i=1; i<favo3.length; i++) {
%>
, <%=favo3[i] %>
<%
}
%>

<%

String myfavo = favo[0];

for (int i=1; i<favo.length; i++) {
	myfavo = myfavo + ", " + favo[i];
}
%>

<%=myfavo%>