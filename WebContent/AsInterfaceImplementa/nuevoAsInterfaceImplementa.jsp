<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.springframework.context.* , org.springframework.context.support.*, org.springframework.web.context.support.*" %>
<%@page import="sv.edu.ues.igf115.controller.*"%>
<%@page import="sv.edu.ues.igf115.model.*"%>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<%
ApplicationContext context= WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
AsInterfaceImplementaController AsInterImplementsCtrol=(AsInterfaceImplementaController) context.getBean("AsInterImplementsCtrol");
CtrlAsInterface ctrlAsInter=(CtrlAsInterface) context.getBean("ctrlAsInter");

List<AsInterfaceImplementa> list= AsInterImplementsCtrol.daAsInterfaceImplementa();
List<AsInterface> list2= ctrlAsInter.daAsInterface();

String crear = request.getParameter("crear");
System.out.println (crear);

if(crear != null && "on".equals(crear)) {
Integer cInterfaceImplementa = Integer.parseInt(request.getParameter("cInterfaceImplementa"));
int c_interface_padre = Short.parseShort(request.getParameter("c_interface_padre"));
int c_interface_hijo = Short.parseShort(request.getParameter("c_interface_hijo"));

boolean existe = AsInterImplementsCtrol.crearAsInterfaceImplementa(cInterfaceImplementa, c_interface_padre, c_interface_hijo);
String mensaje;

	if (existe) {
		response.sendRedirect("listAsInterfaceImplementa.jsp");
		mensaje = "Se creo el  departamento";
	} else {
		response.sendRedirect("nuevoAsInterfaceImplementa.jsp");
		mensaje = "Error al guardar el cliente";
	}
}	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nuevo AsInterface</title>
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
		<form method="POST" action='nuevoAsInterfaceImplementa.jsp' name="frmAddAtributo" role="form">
			<div class="form-group">
				<label for="cInterfaceImplementa">Código:
				<select id="cInterfaceImplementa" name="cInterfaceImplementa"  style="width:225%;height:30px">
				<%
				boolean b;
				for(int i=1; i<100; i++){
					b=true;
					for(int j=0; j<list.size(); j++){
						if(list.get(j).getCInterfaceImplementa()==i){
							b=false;
							}
						}
						if(b){
				%>		   
				  			 <option><c:out value="<%=i%>" /></option>
					
				<%			}
					}%>
				</select>
				</label>
			</div>
			
			<div class="form-group">
				<label for="c_interface_padre">Interface Padre:
				<select id="c_interface_padre" name="c_interface_padre"  style="width:149%;height:30px">
				<c:forEach items="<%=list2%>" var="AsInterface">
				<option><c:out value="${AsInterface.CInterface}" /></option>
				</c:forEach>
				</select>
				</label>
			</div>
			
			<div class="form-group">
				<label for="c_interface_hijo">Interface Hijo:
				<select id="c_interface_hijo" name="c_interface_hijo"  style="width:165%;height:30px">
				<c:forEach items="<%=list2%>" var="AsInterface">
				<option><c:out value="${AsInterface.CInterface}" /></option>
				</c:forEach>
				</select>
				</label>
			</div>
			
			    <input type="hidden" name="crear" value="on"/>
			  <button type="submit" class="btn btn-primary">Guardar</button>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

</body>
</html>