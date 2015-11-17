<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="sv.edu.ues.igf115.controller.*"%>
<%@page import="sv.edu.ues.igf115.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="org.springframework.context.* , org.springframework.context.support.*, org.springframework.web.context.support.*" %>

<%
ApplicationContext context= WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
AsInterfaceImplementaController AsInterImplementsCtrol=(AsInterfaceImplementaController) context.getBean("AsInterImplementsCtrol");
CtrlAsInterface ctrlAsInter=(CtrlAsInterface) context.getBean("ctrlAsInter");

List<AsInterface> list= ctrlAsInter.daAsInterface();

String crear = request.getParameter("crear");

AsInterfaceImplementa asInterfaceImplementa = null;

String mensaje;
Integer id;
Integer isd;
Integer codigo;
Integer padre;
Integer hijo;

	if (crear != null && "on".equals(crear)) {
		id = Integer.parseInt(request.getParameter("codigo"));
		padre = Integer.parseInt(request.getParameter("padre"));
		hijo = Integer.parseInt(request.getParameter("hijo"));
		asInterfaceImplementa = AsInterImplementsCtrol.daAsInterfaceImplementaById(id);
		asInterfaceImplementa.setCInterfacePadre(padre);
		asInterfaceImplementa.setCInterfaceHijo(hijo);

		boolean existe = AsInterImplementsCtrol.update(asInterfaceImplementa);
		if (existe) {
			response.sendRedirect("listAsInterfaceImplementa.jsp");
			mensaje = "Se creo el  departamento";
		} else {
			response.sendRedirect("editAsInterfaceImplementa.jsp?userId=<c:out value="+id+"");
			mensaje = "Error al guardar el TbTipoAtributo";
		}
	} else {
		isd = Integer.parseInt(request.getParameter("userId"));
		asInterfaceImplementa= AsInterImplementsCtrol.daAsInterfaceImplementaById(isd);
		codigo = asInterfaceImplementa.getCInterfaceImplementa();
		padre= asInterfaceImplementa.getCInterfacePadre();
		hijo = asInterfaceImplementa.getCInterfaceHijo();
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editar AsInterfaceImplementa</title>
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
		<form method="POST" action='editAsInterfaceImplementa.jsp'
			name="frmAddAtributo" role="form">

			<div class="form-group">
				<label for="personid"> Código: <input
					class="form-control" id="codigo" name="codigo" readonly="readonly"
					value=<c:out value="<%=asInterfaceImplementa.getCInterfaceImplementa()%>" /> />
				</label>
			</div>
			
			<div class="form-group">
				<label for="padre">Interface Padre:
				<select id="padre" name="padre"  style="width:140%;height:30px">
				<option><c:out value="<%=asInterfaceImplementa.getCInterfacePadre()%>" /></option>
				<c:forEach items="<%=list%>" var="AsInterface">
				<option><c:out value="${AsInterface.CInterface}" /></option>
				</c:forEach>
				</select>
				</label>
			</div>
			<div class="form-group">
				<label for="hijo">Interface Hijo:
				<select id="hijo" name="hijo"  style="width:155%;height:30px">
				<option><c:out value="<%=asInterfaceImplementa.getCInterfaceHijo()%>" /></option>
				<c:forEach items="<%=list%>" var="AsInterface">
				<option><c:out value="${AsInterface.CInterface}" /></option>
				</c:forEach>
				</select>
				</label>
			</div>
			
			
			 <input type="hidden" name="crear" value="on"/>
			 <button type="submit" class="btn btn-primary">Actualizar</button>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>
</html>