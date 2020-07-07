<%-- 
    Document   : VistaConsultar
    Created on : 17/08/2019, 12:44:48 PM
    Author     : Diego Alejandro
--%>

<%@page import="co.edu.sena.ViaExpress.persistencia.vo.RolVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.RolDao"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.TipoDocumentoVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.TipoDocumentoDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.UserVo"%>
<%@page import="java.util.List"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.UserDao"%>
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
            <div class="row">
                <section class = "cmd-2 ml-2">
                    <div class = "center1">
                        <div class="progress">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <a href="index.jsp"><img onclick="../index.jsp"src="img/logo.png" width="250" height="50"></a>
                            </div>
                            <center>
                                <div class="card-body">
                                    <h2 class="card-title">Usuarios</h2>
                                </div>
                            </center>
                            <div class="center1">

                                <form action="UsuarioServlet" method="post">
                                    <div class="row">
                                        <div class="col">
                                            <div class="from-group">
                                                <select name="id" class="form-control" id="exampleFormControlSelect1">
                                                    <%
                                                        TipoDocumentoDao tipoDocumentodao = new TipoDocumentoDao();
                                                        List<TipoDocumentoVo> list = tipoDocumentodao.getordenaPorId();
                                                        Iterator<TipoDocumentoVo> iter = list.iterator();
                                                        TipoDocumentoVo uv = null;
                                                        while (iter.hasNext()) {
                                                            uv = iter.next();
                                                    %>
                        <option value="<%=uv.getIdTipoDocumento()%>" ><%=uv.getDescripcionDocumento()%></option>
                                                    <%}%>
                                                </select>   
                                            </div>
                                        </div>
                                        <div class="col">
                                            <input type="text" name="docu" class="form-control" placeholder="Documento">
                                        </div>
                                        <div class="col">
                                            <input type="text" name="nom" class="form-control" placeholder="Nombre">
                                        </div>
                                        <div class="col">
                                            <input type="text" name="ape"  class="form-control" placeholder="Apellido">
                                        </div>
                                        <div class="col">
                                            <input type="number" name="tel"  class="form-control" placeholder="Telefono">
                                        </div>
                                        <div class="col">
                                            <input type="text" name="dire"  class="form-control" placeholder="Dirección">
                                        </div>
                                        <div class="col">
                                            <input type="text" name="cor"  class="form-control" placeholder="Correo">
                                        </div>
                                        <div class ="col">
                                            <input type="text" name="pass"  class="form-control" placeholder="password">
                                        </div>
                                        <div class ="col">
                                            <div class="from-group">
                                                <select name="idRol" class="form-control" id="exampleFormControlSelect1">
                                                    <%
                                                        RolDao roldao  = new RolDao();
                                                        List<RolVo> listi = roldao.getOrdenarId();
                                                       Iterator<RolVo> iteri = listi.iterator();
                                                        RolVo uvl = null;
                                                        while (iteri.hasNext()) {
                                                             uvl= iteri.next();
                                                    %>
                  <option value="<%=uvl.getIdrol()%>"><%=uvl.getDescripcion()%></option>
                                                    <%}%>
                                                </select>   
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center mt-5">
                                        <button class="btn btn-danger" name ="registrar">registar</button>
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
                                    <th scope="col">#</th>
                                    <th scope="col">Tipo Documento</th>
                                    <th scope="col">Documento</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Apellido</th>
                                    <th scope="col">Telefono</th>
                                    <th scope="col">Dirección</th>
                                    <th scope="col">Correo</th>
                                    <th scope="col"> password</th>
                                    <th scope="col">rol</th>
                                </tr>
                            </thead>
                            <%
                                UserDao userdao = new UserDao();
                                List<UserVo> list1 = userdao.getordenaPorId();
                                Iterator<UserVo> iter2 = list1.iterator();
                                UserVo uv1 = null;
                                while (iter2.hasNext()) {
                                    uv1 = iter2.next();
                            %>
                            <tbody>
                                <tr>
                                    <th scope="row"><%= uv1.getIduser()%></th>
                                    <td><%= uv1.getTipodocumento()%></td>
                                    <td><%= uv1.getDocumento()%></td>
                                    <td><%= uv1.getNombre()%></td>
                                    <td><%= uv1.getApellido()%></td>
                                    <td><%= uv1.getTelefono()%></td>
                                    <td><%= uv1.getDireccion()%></td>
                                    <td><%= uv1.getCorreo()%></td>
                                    <td><%= uv1.getPassword()%></td>
                                    <td><%= uv1.getRol()%></td>

                                    <td> 
                                        
               <a href="UsuarioServlet?accion=eliminar&id=<%= uv1.getIduser()%>"class="btn btn-danger">Eliminar</a>
               <a href="UsuarioServlet?accion=editar&id=<%= uv1.getIduser()%>"class="btn btn-info">Actulizar</a>
                                    </td>
                            <div class="btn-group" role="group" aria-label="Basic example">
                            </div>
                            </tr>
                            <% }%>
                            </tbody>
                        </table>
                        </body>
                        </html>
