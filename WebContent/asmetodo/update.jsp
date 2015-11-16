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
AsMetodoController asMetodoController=(AsMetodoController) context.getBean("AsMetodoController");

String crear = request.getParameter("crear");

String mensaje="";
AsMetodo asMet = new AsMetodo();
AsMetodoPK asMetodoPK= new AsMetodoPK();
Integer isd= null;

	if (crear != null && "on".equals(crear)) {
		
		
		asMet = asMetodoController.findByIdAsMetodo(Integer.parseInt(request.getParameter("codigoMetodo")));

	

		
		asMetodoPK.setCClase(Integer.parseInt(request.getParameter("clase")));
		asMetodoPK.setCMetodo(Integer.parseInt(request.getParameter("codigoMetodo")));		
		asMet.setAsMetodoPK(asMetodoPK);
		asMet.setBActivo(Integer.parseInt(request.getParameter("activo")));//1 ACtivo
		asMet.setCUsuario(request.getParameter("usuario"));
		asMet.setDMetodo(request.getParameter("descripcionMetodo"));
		asMet.setDTipoRetorno(request.getParameter("descripcionTRetorno"));
		asMet.setFIngreso(new Date());
		asMet.setNParametros(Integer.parseInt(request.getParameter("parametro")));

		AsClase asClase=asMetodoController.daAsClaseEntidad(Integer.parseInt(request.getParameter("clase")));
		asMet.setAsClase(asClase);
		
		TbTipoMetodo tbTipoMetodo = asMetodoController.daTbTipoMetodoEntidad(request.getParameter("tipoMetodo"));
		asMet.setCTipoMetodo(tbTipoMetodo);
		
		boolean existe = asMetodoController.update(asMet);
		if (existe) {
			response.sendRedirect("asmetodo.jsp");
			mensaje = "Se creo el  departamento";
		} else {
			response.sendRedirect("asmetodo.jsp");
			mensaje = "Error al guardar el TbTipoAtributo";
		}
	} 
	else{
		
		List<AsClase> lstAsClase= asMetodoController.daAsClase();
		request.setAttribute("lstAsClase", lstAsClase);
 		List<TbTipoMetodo> lstTbTipoMetodo= asMetodoController.daTipoMetodo();
		request.setAttribute("lstTbTipoMetodo", lstTbTipoMetodo);
		
		isd =Integer.parseInt(request.getParameter("userId"));
		request.setAttribute("id",isd);
		request.setAttribute("AsMetodo", asMetodoController.findByIdAsMetodo(isd));
		
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
	<h1>Actualizar  ASMetodo</h1>
		<form method="POST" action='update.jsp'
			name="frmAddAtributo" role="form">

			
			<div class="form-group">
				<label for="codigoMetodo"> Codigo Metodo: <input 
					class="form-control"  id="codigoMetodo" name="codigoMetodo" readonly="readonly"
					value=<c:out value="${AsMetodo.asMetodoPK.CMetodo}" /> />
				</label>
			</div>
			
			
			<div class="form-group">
				<label for="clase"> Codigo Clase: <select name='clase'>
						<option value="${AsMetodo.asMetodoPK.CClase}" selected>${AsMetodo.asMetodoPK.CClase}</option>
						<c:forEach items="${lstAsClase}" var="clas">
							<option value="${clas.CClase}">${clas.CClase}</option>
						</c:forEach>
				</select>
				</label>
			</div>

			<div class="form-group">
				<label for="descripcionMetodo"> Descripcion  Metodo:<input
					class="form-control" type="text" id="descripcionMetodo"
					name="descripcionMetodo" 
					value="<c:out value="${AsMetodo.DMetodo}" />" />
				</label>
			</div>
			
			<div class="form-group">
				<label for="descripcionTRetorno"> Descripcion Tipo Retorno:<input
					class="form-control" type="text" id="descripcionTRetorno"
					name="descripcionTRetorno" 
					value="<c:out value="${AsMetodo.DTipoRetorno}" />" />
				</label>
			</div>

			<div class="form-group">
				<label for="usuario"> Usuario:<input
					class="form-control" type="text" id="usuario"
					name="usuario" 
					value="<c:out value="${AsMetodo.CUsuario}" />" />
				</label>
			</div>

			<div class="form-group">
				<label for="activo"> Activo:<input
					class="form-control" type="number" id="activo"
					name="activo" 
					value="<c:out value="${AsMetodo.BActivo}" />" />
				</label>
			</div>
			
			<div class="form-group">
				<label for="parametro"> Numero Parametros:<input class="form-control"
					type="number" id="parametro" name="parametro"
					value="<c:out value="${AsMetodo.NParametros}" />" />
				</label>
			</div>


			<div class="form-group">
				<label for="tipoMetodo"> Tipo Metodo: <select name='tipoMetodo'>
						<option value="${AsMetodo.CTipoMetodo.CTipoMetodo}" selected>${AsMetodo.CTipoMetodo.CTipoMetodo}</option>
						<c:forEach items="${lstTbTipoMetodo}" var="metodo">
							<option value="${metodo.CTipoMetodo}">${metodo.CTipoMetodo}</option>
						</c:forEach>
				</select>
				</label>
			</div>
			
				<input type="hidden" name="crear" value="on"/>
			 	<input type="submit" value="Agregar"/>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>
</html>