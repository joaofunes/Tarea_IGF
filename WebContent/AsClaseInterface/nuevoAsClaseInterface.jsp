<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.springframework.context.* , org.springframework.context.support.*, org.springframework.web.context.support.*" %>
<%@page import="sv.edu.ues.igf115.controller.*"%>
<%@page import="sv.edu.ues.igf115.model.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>
<%@page import="java.util.*" %>

<%
ApplicationContext context= WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
AsClaseInterfaceController asClaseInterfaceController=(AsClaseInterfaceController) context.getBean("AsClaseInterfaceController");

AsClaseController asClaseController=(AsClaseController) context.getBean("AsClaseController");
CtrlAsInterface ctrlAsInter=(CtrlAsInterface) context.getBean("ctrlAsInter");

List<AsClaseInterface> list= asClaseInterfaceController.daAsClaseInterface();
List<AsClase> list1= asClaseController.daAsClase();
List<AsInterface> list2= ctrlAsInter.daAsInterface();

String crear = request.getParameter("crear");
System.out.println (crear);
String mensaje = " ";
if(crear != null && "on".equals(crear)) {
Integer cClaseInterface = Integer.parseInt(request.getParameter("cClaseInterface"));
int cClase= Short.parseShort(request.getParameter("cClase"));
int cInterface = Short.parseShort(request.getParameter("cInterface"));

boolean existe = asClaseInterfaceController.crearAsClaseInterface(cClaseInterface, cClase, cInterface);

	if (existe) {
		response.sendRedirect("listAsClaseInterface.jsp");
		mensaje = "Se creó el Registro";
	} else {
		response.sendRedirect("nuevoAsClaseInterface.jsp");
		mensaje = "El codigo ya existe";
	}
}	

%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nuevo AsClaseInterface</title>
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
		<form method="POST" action='nuevoAsClaseInterface.jsp' name="frmAddAtributo" role="form">
			
			<div class="form-group">
				<label for="cClaseInterface">Código:
				<select id="cClaseInterface" name="cClaseInterface"  style="width:225%;height:5%">
				<%
				boolean b;
				for(int i=1; i<100; i++){
					b=true;
					for(int j=0; j<list.size(); j++){
						if(list.get(j).getCClaseInterface()==i){
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
				<label for="cClase">Clase:
				<select id="cClase" name="cClase"  style="width:275%;height:5%">
				<c:forEach items="<%=list1%>" var="AsClase">
				<option><c:out value="${AsClase.CClase}" /></option>
				</c:forEach>
				</select>
				</label>
			</div>
			
			<div class="form-group">
				<label for="cInterface">Interface:
				<select id="cInterface" name="cInterface"  style="width:213%;height:5%">
				<c:forEach items="<%=list2%>" var="AsInterface">
				<option><c:out value="${AsInterface.CInterface}" /></option>
				</c:forEach>
				</select>
				</label>
			</div>
			
			    <input type="hidden" name="crear" value="on"/>
			 <button type="submit" class="btn btn-primary">Guardar</button>
			<label><%=mensaje%></label>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

</body>
</html>