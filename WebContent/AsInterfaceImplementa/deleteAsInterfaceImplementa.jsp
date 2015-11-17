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
AsInterfaceImplementaController AsInterImplementsCtrol=(AsInterfaceImplementaController) context.getBean("AsInterImplementsCtrol");

AsInterfaceImplementa asInterfaceImplementa = null ;

String crear = request.getParameter("crear");


String mensaje;
Integer isd=0;
Integer codigo;

	if (crear != null && "yes".equals(crear)) {
		Integer id= Integer.parseInt(request.getParameter("id"));
		asInterfaceImplementa = AsInterImplementsCtrol.daAsInterfaceImplementaById(id);	
		boolean existe = AsInterImplementsCtrol.eliminar(asInterfaceImplementa);
		 
		if (existe) {
			response.sendRedirect("listAsInterfaceImplementa.jsp");
			mensaje = "Se creo el  departamento";
		} else {
			response.sendRedirect("listAsInterfaceImplementa.jsp");
			mensaje = "Error al guardar el cliente";
		}
	} else if (crear != null && "no".equals(crear)) {
		response.sendRedirect("listAsInterfaceImplementa.jsp");
	}else{
		isd = Integer.parseInt(request.getParameter("userId"));
		asInterfaceImplementa = AsInterImplementsCtrol.daAsInterfaceImplementaById(isd);
		codigo = asInterfaceImplementa.getCInterfaceImplementa();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit AsMetodo</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="Resource/bootstrap.css" rel="stylesheet">

 <script>
    function cambiaDefecto(){
       document.frmAddAtributo.crear.defaultValue = "no";	   
    }  
   </script> 
</head>
<body>
	<div class="container">
		<form method="POST" action='deleteAsInterfaceImplementa.jsp' name="frmAddAtributo"
			role="form">


			<label for="lab"> ¿Seguro que desea eliminar el registro ?</label>


			<div class="form-group">
				<label for="personid"> Codigo: 
				<c:out value="<%=asInterfaceImplementa.getCInterfaceImplementa()%>"  />
				</label>
			</div>
			<td></td>
			
			<input type="hidden" id="id" name="id" value=<c:out value="<%=isd%>" /> />
			<input type="hidden" name="crear" value="yes" /> 
			<input type="submit" value="SI"/>
			<input type="button" value="NO" onClick="location.href='listAsInterfaceImplementa.jsp'"/>
			
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>
</html>