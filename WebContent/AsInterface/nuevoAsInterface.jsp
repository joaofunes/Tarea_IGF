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
CtrlAsInterface ctrlAsInter=(CtrlAsInterface) context.getBean("ctrlAsInter");

List<AsInterface> list= ctrlAsInter.daAsInterface();

String crear = request.getParameter("crear");
System.out.println (crear);

if(crear != null && "on".equals(crear)) {
String dInterface = request.getParameter("dInterface");
String cUsuario= request.getParameter("cUsuario");
Integer cInterface = Integer.parseInt(request.getParameter("cInterface"));
Date fecha = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fIngreso")); 

boolean existe = ctrlAsInter.crearAsInterface(cInterface, dInterface, cUsuario, fecha);
String mensaje;

	if (existe) {
		response.sendRedirect("listAsInterface.jsp");
		mensaje = "Se creo el  departamento";
	} else {
		response.sendRedirect("nuevoAsInterface.jsp");
		mensaje = "Error al guardar el cliente";
	}
}	

%>
<!DOCTYPE html PUBLIC>
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
		<form method="POST" action='nuevoAsInterface.jsp' name="frmAddAtributo" role="form">

			<div class="form-group">
				<label for="cInterface">Código:
				<select id="cInterface" name="cInterface"  style="width:210%;height:5%">
				<%
				boolean b;
				for(int i=1; i<100; i++){
					b=true;
					for(int j=0; j<list.size(); j++){
						if(list.get(j).getCInterface()==i){
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
				<label for="dInterface">Descripción:<input
					class="form-control" type="text" id="dInterface"
					name="dInterface" 
					value="<c:out value="${AsInterface.dInterface}" />" required/>
				</label>
			</div>
			
			<div class="form-group">
				<label for="cUsuario">Usuario:<input
					class="form-control" type="text" id="cUsuario"
					name="cUsuario" 
					value="<c:out value="${AsInterface.cUsuario}" />" required/>
				</label>
			</div>
			
		   <div class="form-group">
				<label for="fIngreso">Fecha:<input
					class="form-control" type="date" id="fIngreso"
					name="fIngreso" 
					value="<c:out value="${AsInterface.fIngreso}" />" />
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