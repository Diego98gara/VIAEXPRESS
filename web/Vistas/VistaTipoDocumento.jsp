<%-- 
    Document   : VistaTipoDocumento
    Created on : 25/08/2019, 02:01:20 PM
    Author     : Diego Alejandro
--%>

<%@page import="java.util.Iterator"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.TipoDocumentoVo"%>
<%@page import="java.util.List"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.TipoDocumentoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/stilos.css">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <meta charset="utf-8">
        <title>Tipos de documento</title>
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
                                    <h2 class="card-title">Tipo Documento</h2>
                                </div>
                            </div>
                            <div class="">
                                  <div class="center1">
                                <form action="TipoDocumentoServlet" method="post">
                                    <div class="col">
                       <input type="text" name="descripcionDoc" class="form-control" placeholder="Descripcion">
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
                                  TipoDocumentoDao tipoDocumentoDao = new TipoDocumentoDao();
                                  List<TipoDocumentoVo> list = tipoDocumentoDao.getordenaPorId();
                                  Iterator<TipoDocumentoVo> iter = list.iterator();
                                  TipoDocumentoVo uv = null;
                                 while (iter.hasNext()) {
                                 uv = iter.next();
                                %>
                                <tbody>
                                    <tr>
                                        <th scope="row"><%=uv.getIdTipoDocumento()%></th>
                                        <td><%=uv.getDescripcionDocumento()%></td>
                                        <td> 
 <a href="TipoDocumentoServlet?accion=eliminar&id=<%= uv.getIdTipoDocumento()%>"class="btn btn-danger">Eliminar</a>
 <a href="TipoDocumentoServlet?accion=editar&id=<%= uv.getIdTipoDocumento()%>" class="btn btn-info">Actulizar</a>
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
