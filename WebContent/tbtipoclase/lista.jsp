<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="sv.edu.ues.igf115.controller.*"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.*" %>
<%@page import="org.springframework.context.* , org.springframework.context.support.*, org.springframework.web.context.support.*" %>
<%@page import="sv.edu.ues.igf115.model.*" %>


<%
ApplicationContext context= WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
TbTipoClaseController ctrlDept=(TbTipoClaseController) context.getBean("ctrlDepto");
List<TbTipoClase> list= ctrlDept.daDepartamentos();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Show All Users</title>
</head>
<body>
<center><h2>Tb_Tipo_Clase</h2></center>
	<div class="wrap">
		<section>
		<div class="container">
			<table class="table table-hover">

				<thead>
					<tr>
						<th>Codigo Clase</th>
                		<th>Descripcion</th>
                		<th>Fecha</th>
                		<th colspan=2>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="<%=list%>" var="user">
						<tr>
							<td><c:out value="${user.c_tipo_clase}" /></td>
							<td><c:out value="${user.d_tipo_clase}" /></td>
							<td><fmt:formatDate pattern="dd MMM,yyyy"
									value="${user.f_ingreso}" /></td>
							<td><a
								href="edit.jsp?userId=<c:out value="${user.c_tipo_clase}"/>">Update</a></td>
							<td><a
								href="delete.jsp?userId=<c:out value="${user.c_tipo_clase}"/>">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<center> 
		<input type="button" value="Agregar" onClick="location.href='new.jsp'" />
		</center> 
		
		<p><a href="new.jsp">Agregar</a></p>
		</div>
		</section>
	</div>

	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>
</html>