<%-- 
    Document   : EditarRol
    Created on : 25/08/2019, 01:06:37 PM
    Author     : Diego Alejandro
--%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.RolVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.RolDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/stilos.css">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <meta charset="utf-8">	
    </head>
    <body>
        <div class="container m-5">
            <%
                RolDao roldao = new RolDao();
                int idRol = Integer.parseInt((String) request.getAttribute("idRol"));
                RolVo rolvo = (RolVo) roldao.getRolById(idRol);
            %>
            <h1 class="text-center"> Actualizar Rol</h1>
            <form action="ControladorRol" >
                <label> IdRol</label >
                <input type="number" name="id" value="<%=rolvo.getIdrol()%>" class="form-control" placeholder="Ingresa id"><br>
                <label>Descripcion</label>
                <input type="text" name="desc" value="<%=rolvo.getDescripcion()%>"  class="form-control" placeholder="nueva descripcion"><br>

                <div >
                    <button class="btn btn-warning"name ="accion" value="Actualizar">Actualizar</button>
                    <a class="btn btn-danger" href="ControladorRol?accion=consultar">cancelar</a>
                </div>
                </body>
                </html>

