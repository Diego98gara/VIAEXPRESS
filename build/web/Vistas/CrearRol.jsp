<%-- 
    Document   : CrearRol
    Created on : 25/08/2019, 01:04:49 PM
    Author     : Diego Alejandro
--%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.RolVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.RolDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Proyecto</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/stilos.css">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <meta charset="utf-8">	
    </head>

    <body>

        <main class="m-4">
            <div>
                <section class = "cmd-2 ml-2">
                    <div class = "center1">
                        <div class="progress">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="card">
                            <div class="card-header">

                                <a href="index.jsp"><img src="img/logo.png"  width="250" height="50"></a> 


                            </div>
                            <center>
                                <div class="card-body">
                                    <h2 class="card-title">Tabla Roles</h2>
                                </div>
                            </center>
                            <div class="center1">

                                <form action="ControladorRol" method="post">
                                    <div class="row">
                                        <div id="caja30">
                                            <div class="col">
                                                <input type="text" name="Desc" class="form-control" placeholder="Ingresa rol" style="width:300px;height: 40px; ">
                                            </div>
                                        </div>


                                    </div>
                                    <div class="text-center mt-5">
                                        <button class="btn btn-danger" name ="accion" value="Crear">registar</button>
                                    </div>
                                </form>

                            </div>
                            <div class="progress mt-5">
                                <div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>

                            </div>
                        </div>

                        <table class="table table-dark" >
                            <thead>
                                <tr>
                                    <th scope="col">idRol</th>
                                    <th scope="col">Descripcion Rol</th>

                                </tr>
                            </thead>
                            <%
                                RolDao roldao = new RolDao();
                                List<RolVo> lista = roldao.getOrdenarId();
                                Iterator<RolVo> itera = lista.iterator();
                                RolVo rv = null;
                                while (itera.hasNext()) {
                                    rv = itera.next();

                            %>
                            <tbody>
                                <tr>
                                    <th scope="row"><%=rv.getIdrol()%> </th>
                                    <th><%=rv.getDescripcion()%></th>
                                    <td> 
                <a href="ControladorRol?accion=eliminar&id=<%= rv.getIdrol()%>" class="btn btn-danger">Eliminar</a>
                <a href="ControladorRol?accion=editar&id=<%= rv.getIdrol()%>"class="btn btn-info">Actulizar</a>
                                    </td>
                            <div class="btn-group" role="group" aria-label="Basic example">
                            </div>
                            </tr>
                            <% }%>
                            </tbody>
                        </table>
                        </body>
                        </html>