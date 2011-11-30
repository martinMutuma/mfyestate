<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="estateTag" prefix="estateTag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<estateTag:select cssStyle="width:120px" id="teset" codeType="租赁方式" headerKey="" value="1" headerValue="请选择" />
<estateTag:radio  id="teset" codeType="产权性质" value="1"/>
<estateTag:checkbox  id="teset" codeType="产权性质" value="1,2"/>
</body>
</html>