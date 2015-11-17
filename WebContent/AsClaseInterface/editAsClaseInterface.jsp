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
AsClaseInterfaceController asClaseInterfaceController=(AsClaseInterfaceController) context.getBean("AsClaseInterfaceController");
AsClaseController asClaseController=(AsClaseController) context.getBean("AsClaseController");
CtrlAsInterface ctrlAsInter=(CtrlAsInterface) context.getBean("ctrlAsInter");

List<AsClaseInterface> list= asClaseInterfaceController.daAsClaseInterface();
List<AsClase> list1= asClaseController.daAsClase();
List<AsInterface> list2= ctrlAsInter.daAsInterface();


String crear = request.getParameter("crear");

AsClaseInterface asClaseInterface = null;

String mensaje;
Integer id;
Integer isd;
Integer codigo;
Integer cClase;
Integer cInterface;

	if (crear != null && "on".equals(crear)) {
		id = Integer.parseInt(request.getParameter("codigo"));
		cClase = Integer.parseInt(request.getParameter("cClase"));
		cInterface = Integer.parseInt(request.getParameter("cInterface"));
		asClaseInterface = asClaseInterfaceController.daAsClaseInterfaceById(id);
		asClaseInterface.setCClase(cClase);
		asClaseInterface.setCInterface(cInterface);

		boolean existe = asClaseInterfaceController.update(asClaseInterface);
		if (existe) {
			response.sendRedirect("listAsClaseInterface.jsp");
			mensaje = "Se creo la AsClaseInterface";
		} else {
			response.sendRedirect("editAsClaseInterface.jsp?userId=<c:out value="+id+"");
			mensaje = "Error al guardar la AsClaseInterface";
		}
	} else {
		isd = Integer.parseInt(request.getParameter("userId"));
		asClaseInterface= asClaseInterfaceController.daAsClaseInterfaceById(isd);
		codigo = asClaseInterface.getCClaseInterface();
		cClase= asClaseInterface.getCClase();
		cInterface = asClaseInterface.getCInterface();
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editar AsClaseInterface</title>
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
		<form method="POST" action='editAsClaseInterface.jsp'
			name="frmAddAtributo" role="form">

			<div class="form-group">
				<label for="personid"> Código: <input
					class="form-control" id="codigo" name="codigo" readonly="readonly"
					value=<c:out value="<%=asClaseInterface.getCClaseInterface()%>" /> />
				</label>
			</div>
			
			<div class="form-group">
				<label for="cClase">Clase:
				<select id="cClase" name="cClase"  style="width:254%;height:50%">
				<option><c:out value="<%=asClaseInterface.getCClase()%>" /></option>
				<c:forEach items="<%=list1%>" var="AsClase">
				<option><c:out value="${AsClase.CClase}" /></option>
				</c:forEach>
				</select>
				</label>
			</div>
			
			<div class="form-group">
				<label for="cInterface">Interface:
				<select id="cInterface" name="cInterface"  style="width:195%;height:100%">
				<option><c:out value="<%=asClaseInterface.getCInterface()%>" /></option>
				<c:forEach items="<%=list2%>" var="AsInterface">
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