<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="sv.edu.ues.igf115.controller.*"%>
<%@page import="sv.edu.ues.igf115.model.*"%>
<%@page import="java.util.*"%>
  <%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.springframework.context.* , org.springframework.context.support.*, org.springframework.web.context.support.*" %>


<%
	ApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
	AsClaseController asClaseController = (AsClaseController) context.getBean("AsClaseController");

	String crear = request.getParameter("crear");
	String mensaje;

	if (crear != null && "on".equals(crear)) {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		AsClase asClase = new AsClase();
		
		TbTipoClase tb = asClaseController.daTbTipoById(request.getParameter("codTipoClase"));
		TbAplicativo ta = asClaseController.daTbApliById(request.getParameter("codAplicativo"));
		AsClase ac = asClaseController.daAsClaseById(Integer.parseInt(request.getParameter("codClasePadre")));

		asClase.setCClase(Integer.parseInt(request.getParameter("clase")));
		asClase.setDClase(request.getParameter("descripcionClase"));
		asClase.setCTipoClase(tb);
		asClase.setCUsuario(request.getParameter("usuario"));
		asClase.setFIngreso(formatter.parse(request.getParameter("fecha")));
		asClase.setCAplicativo(ta);
		asClase.setCClasePadre(ac);

		boolean existe = asClaseController.crear(asClase);
		if (existe) {
			response.sendRedirect("lista.jsp");
			mensaje = "Se creo el  asclase";
		} else {
			response.sendRedirect("new.jsp");
			mensaje = "Error al guardar el asclase";
		}
	}

	else {

		List<TbTipoClase> lstTbTipoClase = asClaseController.daTbTipoClase();
		request.setAttribute("lstTbTipoClase", lstTbTipoClase);
		List<TbAplicativo> lstAplicativo = asClaseController.daTbAplicativo();
		request.setAttribute("lstAplicativo", lstAplicativo);
		List<AsClase> lstAsClase = asClaseController.daAsClase();
		request.setAttribute("lstAsClase", lstAsClase);
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nuevo AsClase</title>
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
		<form method="POST" action='new.jsp'
			name="frmAddAsAtributo" role="form">

					
			<div class="form-group">
				<label for="clase">Codigo Clase: <input
					class="form-control" type="number" id="clase"
					name="clase"
					value="" />
				</label>
			</div>
			
			<div class="form-group">
				<label for="descripcionClase"> Descripcion Clase: <input
					class="form-control" type="text" id="descripcionClase"
					name="descripcionClase"
					value=""/>
				</label>
			</div>

			

			<div class="form-group">
				<label for="codTipoClase"> Codigo Tipo Clase: <select
					name='codTipoClase'>
						<option value="${TbTipoClase.CTipoClase}" selected>${TbTipoClase.CTipoClase}</option>
						<c:forEach items="${lstTbTipoClase}" var="met">
							<option value="${met.c_tipo_clase}">${met.c_tipo_clase}</option>
						</c:forEach>
				</select>
				</label>
			</div>
			

			
			<div class="form-group">
				<label for="usuario"> Usuario:<input class="form-control"
					type="text" id="usuario" name="usuario"
					value="" />
				</label>
			</div>
			
			<div class="form-group">
				<label for="fecha"> fecha de ingreso:<input
					class="form-control" type="text" id="fecha"
					name="fecha" 
					value="<c:out value="" />" />
				</label>
			</div>

			<div class="form-group">
				<label for="codAplicativo"> Codigo Aplicativo: <select
					name='codAplicativo'>
						<option value="${TbAplicativo.c_aplicativo}" selected>${TbAplicativo.c_aplicativo}</option>
						<c:forEach items="${lstAplicativo}" var="role">
							<option value="${role.c_aplicativo}">${role.c_aplicativo}</option>
						</c:forEach>
				</select>
				</label>
			</div>
			
			<div class="form-group">
				<label for="codClasePadre"> Codigo Clase Padre: <select
					name='codClasePadre'>
						<option value="${AsClase.CClasePadre}" selected>${AsClase.CClasePadre}</option>
						<c:forEach items="${lstAsClase}" var="role">
							<option value="${role.CClasePadre.CClase}">${role.CClasePadre.CClase}</option>
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