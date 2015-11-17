<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="sv.edu.ues.igf115.controller.*"%>
<%@page import="sv.edu.ues.igf115.model.*"%>
<%@page import="java.util.*"%>
<%@page import="org.springframework.context.* , org.springframework.context.support.*, org.springframework.web.context.support.*" %>


<%
ApplicationContext context= WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
AsClaseInterfaceController asClaseInterfaceController=(AsClaseInterfaceController) context.getBean("AsClaseInterfaceController");

List<AsClaseInterface> list= asClaseInterfaceController.daAsClaseInterface();

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
<center><h2>AS_CLASE_INTERFACE</h2></center>
	<div class="wrap">
		<section>
		<div class="container">
			<table class="table table-hover">

				<thead>
					<tr>
						<th>Código</th>
                        <th>Clase</th>
                        <th>Interface</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="<%=list%>" var="AsClaseInterface">
						<tr>
						    <td><c:out value="${AsClaseInterface.CClaseInterface}" /></td>
                    		<td><c:out value="${AsClaseInterface.CClase}" /></td>
                    		<td><c:out value="${AsClaseInterface.CInterface}" /></td>
                    
                    		<td><a href="editAsClaseInterface.jsp?userId=<c:out value="${AsClaseInterface.CClaseInterface}"/>">Modificar</a></td>      
                    		<td><a href="deleteAsClaseInterface.jsp?userId=<c:out value="${AsClaseInterface.CClaseInterface}"/>">Eliminar</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<center> 
		 <button type="submit" value="Crear Nuevo" onClick="location.href='nuevoAsClaseInterface.jsp'" class="btn btn-primary">Crear Nuevo</button>
		</center> 
		</div>
		</section>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>
</html>