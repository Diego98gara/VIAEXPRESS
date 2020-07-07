<%-- 
    Document   : Editar
    Created on : 19/08/2019, 12:10:11 PM
    Author     : Diego Alejandro
--%>

<%@page import="co.edu.sena.ViaExpress.persistencia.vo.UserVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Datos </title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/stilos1.css">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <meta charset="utf-8">	
    </head>
    <body>
        <div>
            <%
                UserDao userdao = new UserDao();
                int id = Integer.parseInt((String) request.getAttribute("idUsuario"));
                UserVo userveo = (UserVo) userdao.getuserById(id);
            %>
            <!-- 
            <h1> Modificar</h1>
            <form action="UsuarioServlet" >
                <label> tipo documento</label>
                <input type="number" name="tdoc" value="<%=userveo.getTipodocumento()%>" class="form-control" placeholder="tdocumento"><br>
                <label>documento</label>
                <input type="number" name="docu" value="<%=userveo.getDocumento()%>"  class="form-control" placeholder="Documento"><br>
                <label>nombre</label>
                <input type="text" name="nom" value="<%=userveo.getNombre()%>" class="form-control" placeholder="Nombre"><br>
                <label> apellido</label>
                <input type="text" name="ape" value="<%=userveo.getApellido()%>"  class="form-control" placeholder="Apellido"><br>
                <label> telefono</label>
                <input type="number" name="tel" value="<%=userveo.getTelefono()%>" class="form-control" placeholder="Telefono"><br>
                <label> direccion</label>
                <input type="text" name="dire" value="<%=userveo.getDireccion()%>" class="form-control" placeholder="Dirección"><br>
                <label> correo</label>
                <input type="text" name="cor" value="<%=userveo.getCorreo()%>" class="form-control" placeholder="Correo"><br>
                <label> password</label>
                <input type="text" name="pass" value="<%=userveo.getPassword()%>"  class="form-control" placeholder="password"><br>
                <label> rol</label>
                <input type="number" name="rol" value="<%=userveo.getRol()%>"  class="form-control" placeholder="rol"><br>
                <label> id </label>
                <input type="hiden" name="id" value="<%=userveo.getIduser()%>"class="form-control" placeholder="rol"><br>
                <div >
                    <button  name ="accion" value="Actualizar">Actualizar</button>
                    <button href="UsuarioServlet?accion=listar">cancelar</button>
                </div>
            </form>-->
            <div class="progress">
                <div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <div class="card">
                <div class="card-header">
                    <a href="index.jsp"><img onclick="../index.jsp"src="img/logo.png" width="250" height="50"></a>
                </div>
                <div class="text-center">
                    <div class="card-body">
                        <h2 class="card-title">Actualizar</h2>
                    </div>
                </div>

                <div id="caja0">
                    <form class="text-center">
                        <div class="row">
                            <div class="form-group" >

                                <input type="hiden"  class="form-control" placeholder="id"  id="exampleFormControlSelect1" name="id" value="<%=userveo.getIduser()%>" style="WIDTH: 300px; HEIGHT: 40px">
                            </div>
                        </div>
                        <div class="col" id="caja1"> 
                            <input type="number" class="form-control" placeholder="tipo documento" name="tdoc" value="<%=userveo.getTipodocumento()%>" style="WIDTH: 300px; HEIGHT: 40px">
                        </div>
                        <div class="col" id="caja2">
                            <input type="number" class="form-control" placeholder="Documento" name="docu" value="<%=userveo.getDocumento()%>"  style="WIDTH: 300px; HEIGHT: 40px">
                        </div>
                        <div class="col" id="caja3">
                            <input type="text" class="form-control" placeholder="Nombre" name="nom" value="<%=userveo.getNombre()%>" style="WIDTH: 300px; HEIGHT: 40px">
                        </div>
                        <div class="col" id="caja4">
                            <input type="text" class="form-control" placeholder="Apellido" name="ape" value="<%=userveo.getApellido()%>" style="WIDTH: 300px; HEIGHT: 40px">
                        </div>
                        <div class="col" id="caja5">
                            <input type="text" class="form-control" placeholder="Telefono" name="tel" value="<%=userveo.getTelefono()%>" style="WIDTH: 300px; HEIGHT: 40px">
                        </div>
                        <div class="col" id="caja6">
                            <input type="text" class="form-control" placeholder="Direccion"name="dire" value="<%=userveo.getDireccion()%>" style="WIDTH: 300px; HEIGHT: 40px">
                        </div>
                        <div class="col" id="caja7">
                            <input type="text" class="form-control" placeholder="Correo" name="cor" value="<%=userveo.getCorreo()%>" style="WIDTH: 300px; HEIGHT: 40px">
                        </div>
                        <div class="col" id="caja8">
                            <input type="text" class="form-control" placeholder="Password"name="pass" value="<%=userveo.getPassword()%>"style="WIDTH: 300px; HEIGHT: 40px">
                        </div>
                        <div class="col" id="caja9">
                            <input type="text" class="form-control" placeholder="rol"name="pass"name="rol" value="<%=userveo.getRol()%>"style="WIDTH: 300px; HEIGHT: 40px">
                        </div>
                </div>

                <div id="registrar">
                    <button class="btn btn-warning" name ="accion" value="Actualizar">Actualizar</button>
                    <a class="btn btn-danger" href="UsuarioServlet?accion=listar">cancelar</a>
                </div>

                </form>
            </div>
        </div>

    </div>


</div>
</body>
</html>
