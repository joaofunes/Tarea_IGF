<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="sv.edu.ues.igf115.controller.*"%>
<%@page import="sv.edu.ues.igf115.model.*"%>
<%@page import="java.util.*"%>
<%@page import="org.springframework.context.* , org.springframework.context.support.*, org.springframework.web.context.support.*" %>
    
    
    
<%
ApplicationContext context= WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
AsClaseController asClaseController=(AsClaseController) context.getBean("AsClaseController");


AsClase asClase= null;	

String crear = request.getParameter("crear");


String mensaje;
Integer id= (request.getParameter("id")!=null)? Integer.parseInt(request.getParameter("id")):null ;
Integer isd=null;


	if (crear != null && "yes".equals(crear)) {
		asClase = asClaseController.daAsClaseById(id);		
		boolean existe = asClaseController.eliminar(asClase);
		 
		if (existe) {
			response.sendRedirect("lista.jsp");
			mensaje = "Se elimino el registro";
		} else {
			response.sendRedirect("lista.jsp");
			mensaje = "Error al guardar el cliente";
		}
	} else if (crear != null && "no".equals(crear)) {
		response.sendRedirect("lista.jsp");
		
	}else{
		isd = Integer.parseInt(request.getParameter("userId"));
		asClase = asClaseController.daAsClaseById(isd);
		request.setAttribute("asClase", asClase);
		
	
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
		<form method="POST" action='delete.jsp' name="frmAddAtributo"
			role="form">


			<label for="lab"> Seguro que desea eliminar el registro </label>


			
			<div class="form-group" >
				<label for="clase">Codigo Clase: 	
				<c:out value="<%=asClase.getCClase()%>"/>
				</label>
			</div>

			<div class="form-group">
				<label for="descripcionClase"> Descripcion Clase: <c:out
						value="<%=asClase.getDClase()%>" />
				</label>
			</div>

			<div class="form-group">
				<label for="codTipoClase"> Codigo Tipo Clase: 
				  <c:out value="<%=asClase.getCTipoClase()%>"/>
				</label>
			</div>
		
			<div class="form-group">
				<label for="usuario"> Usuario:
				<c:out value="<%=asClase.getCUsuario()%>"/>
				</label>
			</div>
			
			<div class="form-group">
				<label for="fecha"> fecha de ingreso:
				<c:out value="<%=asClase.getFIngreso()%>"/>
				</label>
			</div>

			<div class="form-group">
				<label for="codAplicativo"> Codigo  Aplicativo:
				<c:out value="<%=asClase.getCAplicativo()%>"/>
				</label>
			</div>
			
			<div class="form-group">
				<label for="codClasePadre"> Codigo Clase Padre:
				<c:out value="<%=asClase.getCClasePadre()%>"/>
				</label>
			</div>
			
		
			<td></td>
			
			<input type="hidden" id="id" name="id" value=<c:out value="<%=isd%>" /> />
			<input type="hidden" name="crear" value="yes" /> 
			<input type="submit" value="SI"/>
			<input type="submit" value="NO" onclick="cambiaDefecto()"/>
			
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>
</html>