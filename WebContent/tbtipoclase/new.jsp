<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    <%@page import="java.text.SimpleDateFormat"%>
     <%@page import="sv.edu.ues.igf115.controller.*"%>
     <%@page import="sv.edu.ues.igf115.model.*" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.springframework.context.* , org.springframework.context.support.*, org.springframework.web.context.support.*" %>


<%
ApplicationContext context= WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
TbTipoClaseController ctrlDept=(TbTipoClaseController) context.getBean("ctrlDepto");
String crear = request.getParameter("crear");
System.out.println (crear);
if(crear != null && "on".equals(crear)) {
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	 
	//Integer id = Integer.parseInt(request.getParameter("idDep"));
	String ctipo = request.getParameter("c_tipo_clase");
	String dtipo = request.getParameter("d_tipo_clase");
	java.util.Date fecha = formatter.parse(request.getParameter("fecha"));
	boolean existe = ctrlDept.crearDepartamento(ctipo, dtipo, fecha);
	String mensaje;

		if (existe) {
			response.sendRedirect("lista.jsp");
			mensaje = "Se creo el  tipo clase";
		} else {
			response.sendRedirect("new.jsp");
			mensaje = "Error al guardar tipo clase";
		}
	}	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nuevo AsMetodo</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="Resource/bootstrap.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form method="POST" action='new.jsp' name="frmAddAtributo" role="form">

			
			
			<div class="form-group">
				<label for="c_tipo_clase"> codigo clase:<input
					class="form-control" type="text" id="c_tipo_clase"
					name="c_tipo_clase" 
					value="<c:out value="${tb_tipo_clase.c_tipo_clase}" />" />
				</label>
			</div>

			
			<div class="form-group">
				<label for="d_tipo_clase"> nombre clase:<input
					class="form-control" type="text" id="d_tipo_clase"
					name="d_tipo_clase" 
					value="<c:out value="${tb_tipo_clase.d_tipo_clase}" />" />
				</label>
			</div>
			
			<div class="form-group">
				<label for="fecha"> fecha de ingreso:<input
					class="form-control" type="text" id="fecha"
					name="fecha" 
					value="<c:out value="${tb_tipo_clase.f_ingreso}" />" />
				</label>
			</div>
			    <input type="hidden" name="crear" value="on"/>
			 <input type="submit" value="Consultar"/>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>
</html>