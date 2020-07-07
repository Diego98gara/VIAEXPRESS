<%-- 
    Document   : VistaTipoMercancia
    Created on : 26/08/2019, 07:49:50 PM
    Author     : Diego Alejandro
--%>

<%@page import="java.util.Iterator"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.TipoMercanciaVo"%>
<%@page import="java.util.List"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.TipoMercanciaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
  <div class="progress"><div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="card">
                            <div class="card-header">
          <a href="index.jsp"><img onclick="../index.jsp"src="img/logo.png" width="250" height="50"></a>
                            </div>
                            <div clas="text-center">
                                <div class="card-body">
                                    <h2 class="card-title">Tipo Mercancia</h2>
                                </div>
                            </div>
                            <div class="container">
                                <div class="center1">
                   <form action="TipoMercanciaServlet" method="post">
                    <div class="col">
                 <input type="text" name="descripcion" class="form-control" placeholder="Descripcion">
                      </div>
                         </div>
                            </div>
                            <div class="p-5">
                                <div class="text-center mt-5">
                                    <button class="btn btn-danger" name ="registrar">registar</button>
                                </div>
                            </div>
                            </form>
                        </div>
                        <div class="progress mt-5">
<div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <section  class="container">
                        <div class="row">
                            <table class="table table-dark" >
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Descripcion</th>
                                    </tr>
                                </thead>
                                <%
                                    TipoMercanciaDao tipoMercanciaDao =new TipoMercanciaDao();
                                    List<TipoMercanciaVo>list1=tipoMercanciaDao.getordenaPorId();
                                    Iterator<TipoMercanciaVo> iter2 =list1.iterator();
                                   TipoMercanciaVo uv1 =  null;
                                    while (iter2.hasNext()) {
                                        uv1 = iter2.next();
                                %>
                                <tbody>
                                    <tr>
                                        <th scope="row"><%=uv1.getIdTipoMercacia()%></th>
                                        <td><%=uv1.getDescripcionTipoMercancia()%></td>
                                        <td> 
      <a href="TipoMercanciaServlet?accion=eliminar&id=<%=uv1.getIdTipoMercacia()%>"class="btn btn-danger">Eliminar</a>
      <a href="TipoMercanciaServlet?accion=editar&id=<%=uv1.getIdTipoMercacia()%>"class="btn btn-info">Actulizar</a>
                                        </td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                </div>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </section>    
                    </body>
                    </html>
