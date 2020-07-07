<%-- 
    Document   : RegistrarUsuario
    Created on : 15/09/2019, 06:30:26 PM
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
        <title>Registro Usuario</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../css/main.css">
        <link rel="stylesheet" type="text/css" href="../css/util.css">
        <link rel="stylesheet" type="text/css" href="../css/styles.css">
        <link rel="stylesheet" type="text/css" href="../css/stylesfrom.css"/>
        <script src="https://kit.fontawesome.com/f5d9884a45.js"></script>

    </head>
    <body>
        <header>
            <div class=" row shadow-sm p-3 mb-3 bg-white rounded">
                <div class="col-md-7 mt-3 ml-5">
                    <a href="../index.jsp"><img src="../img/LOGO1!.png" width="379"> </a>
                </div>
            </div>
        </herader>
        
        <section class="mt-5">
            <div class="container">
                <div class="d-flex justify-content-center h-100">
                    <div class="form1">
                        <form action="../RegistroUsuario" method="post">
                            <div class="card-header">
                                <div class="center1">
                                    <img src="../img/LogoRedu.png" width="90">
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-address-card"></i></span>
                                    </div>
                                    <select name="idTdocu" class="form-control" id="exampleFormControlSelect1" >
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

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-id-badge"></i></span>
                                    </div>
        <input type="number" class="form-control" placeholder="Documento" name="txtdocumento" aria-label="Username"
               aria-describedby="basic-addon1" maxlength="12" required title="Ingrese su documento">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    </div>
         <input type="text" class="form-control" placeholder="Nombre" name="txtnombre" aria-label="Username"
                           aria-describedby="basic-addon1" maxlength="20" pattern="[A-Z a-z]{1,}"  required>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    </div>
            <input type="text" class="form-control" placeholder="Apellido" name="txtapellido" aria-label="Username"
                       aria-describedby="basic-addon1"  maxlength="20" pattern="[A-Z a-z]{1,}"  required>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-mobile-phone"></i></span>
                                    </div>
         <input type="number" class="form-control" placeholder="Telefono" name="txttelefono" aria-label="Username"
                         aria-describedby="basic-addon1" maxlength="15" required>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-home"></i></span>
                                    </div>
  <input type="text" class="form-control" placeholder="Direccion" name="txtdireccion"
         aria-label="Username" aria-describedby="basic-addon1" maxlength="25"pattern="[^'\x22<>]+"required>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                                    </div>
   <input type="email" class="form-control" placeholder="Correo"  name ="txtcorreo"
                aria-label="Username" aria-describedby="basic-addon1"  required>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                                    </div>
   <input type="password" class="form-control" placeholder="Contrraseña" name="txtpasword" id="txtpasword"
   aria-label="Username" aria-describedby="basic-addon1" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                                </div>
                                     <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                                    </div>
 <input type="password" class="form-control" placeholder="Confirme su contraseña" name="txtpaswordconfir" id="txtpaswordconfir"
   aria-label="Username" aria-describedby="basic-addon1" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-male"></i></span>
                                    </div>
                                    <select  class="form-control" name="idrol"> 
                                        <option value="2">Cliente</option>
                                        <option value="3">Transportista</option>
                                        <option value="1">Super Admi Temporal</option>
                                         
                                    </select>   
                                </div>
                                <div class="center1">

       <input type="submit" value="Cancelar" name="accion" value="Cancelar"class="btn btn-danger ">
       
       <input onclick="validador()" type="submit" value="Registrar" name="accion" class="btn float-right login_btn ml-2">
                                </div>

                            </div>
                        </form>
                        <div class="card-footer">
                        </div>

                    </div>
                </div>
            </div>

        </section>
                                     <footer class="footer posi mt-5">
        <div class="theme-footer-widget posi"> 
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-lg-4 mt-3"> 
                        <div class="mt-3 mr-5">
                            <a href="../index.jsp"><img src="../img/LogoRedu.png"width="170"> </a>
                        </div>
                        <div class="mt-4">
                            <a>
                                <i class="fas fa-phone"></i>
                                <font class="font">(57)21312323 </font>
                            </a>
                        </div>
                        <div class="mt-3">
                            <a>
                                <i class="fas fa-phone"></i>
                                <font class="font">(57)21312312 </font>
                            </a>
                        </div>
                        <div class="mt-3">
                            <a>
                                <i class="fas fa-envelope"></i>
                                <font class="font">Cliente@ViaExpress.com </font> 
                            </a>
                        </div>
                        <div class="mt-3">
                            <a>
                                <i class="fas fa-stopwatch"></i>
                                <font class="font">Lun - Vie 09:00am - 06:00pm</font> 
                            </a>
                        </div>
                    </div>  
                    <div class="col-md-3 col-lg-3"> 
                        <div class="mt-5">
                            <h2>Servicios</h2>

                            <div class="mt-3">
                                <a href="index.jsp">
                                    <font class="font">Buzon de sugerencias</font> 
                                </a>
                            </div>
                            <div class="mt-3">
                                <a href="index.jsp">
                                    <font class="font">Antencion al Cliente</font> 
                                </a>
                            </div>
                        </div>
                    </div> 
                    <div class="col-md-3 col-lg-3"> 
                        <div class="mt-5">
                            <h2>Información</h2>
                            <div class="mt-4">
                                <a href="index.jsp">
                                    <font class="font">Sobre Nosotros</font> 
                                </a>
                            </div>
                            <div class="mt-3">
                                <a href="index.jsp">
                                    <font class="font">Mision y vision</font> 
                                </a>
                            </div

                        </div>
                        <div class="mt-3">
                            <a href="index.jsp">
                                <font class="font">Trabaje con nosotros</font> 
                            </a>
                        </div>
                        <div class="mt-3">
                            <a href="index.jsp">
                                <font class="font">Informacon legal</font> 
                            </a>
                        </div>
                    </div> 

                </div>

                <div class="col-md-3 col-lg-2" >
                    <div  class="mt-5">
                        <h2>Redes </h2>
                        <div class="mt-4">
                            <a>
                                <i class="icon10 fab fa-facebook"></i>
                            </a>
                        </div>
                        <div clas="mt-4">
                            <a>
                                <i class="icon10 fab fa-instagram"></i>
                            </a>
                        </div>
                        <div clas="mt-5">
                            <a>
                                <i class="icon10 fab fa-twitter"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        </div>       
    </footer>
        <script src="../js/main.js"></script>
        <script src="../js/jquery-3.3.1.slim.min.js"></script>
       <script src="../js/Validador.js"></script>
       <script src="js/f5d9884a45.js" ></script>
</body>
</html>
