<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.*" %>
<%@page import="org.springframework.context.* , org.springframework.context.support.*, org.springframework.web.context.support.*" %>
<%@page import="sv.edu.ues.igf115.controller.*"%>
<%@page import="sv.edu.ues.igf115.model.*"%>

<%
ApplicationContext context= WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
AsInterfaceImplementaController AsInterImplementsCtrol=(AsInterfaceImplementaController) context.getBean("AsInterImplementsCtrol");

List<AsInterfaceImplementa> list= AsInterImplementsCtrol.daAsInterfaceImplementa();

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1"
	name="viewport">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="bootstrap.css" rel="stylesheet">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>AsInterfaceImplementa</title>

</head>
<body>
<center><h2>AS_INTERFACE_IMPLEMENTA</h2></center>
	<div class="wrap">
		<section>
		<div class="container">
			<table class="table table-hover">

				<thead>
					<tr>
						<th>Código</th>
                        <th>Padre</th>
                        <th>Hijo</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="<%=list%>" var="AsInterfaceImplementa">
						<tr>
						    <td><c:out value="${AsInterfaceImplementa.CInterfaceImplementa}" /></td>
                    		<td><c:out value="${AsInterfaceImplementa.CInterfacePadre}" /></td>
                    		<td><c:out value="${AsInterfaceImplementa.CInterfaceHijo}" /></td>
                    
                    		<td><a href="editAsInterfaceImplementa.jsp?userId=<c:out value="${AsInterfaceImplementa.CInterfaceImplementa}"/>">Modificar</a></td>      
                    		<td><a href="deleteAsInterfaceImplementa.jsp?userId=<c:out value="${AsInterfaceImplementa.CInterfaceImplementa}"/>">Eliminar</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<center> 
		 <button type="submit" value="Crear Nuevo" onClick="location.href='nuevoAsInterfaceImplementa.jsp'" class="btn btn-primary">Crear Nuevo</button>
		</center> 
		</div>
		</section>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>
</html>