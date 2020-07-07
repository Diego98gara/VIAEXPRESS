<%-- 
    Document   : Login
    Created on : 28/08/2019, 06:39:16 PM
    Author     : Diego Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session = "true"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ViaExpress</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../css/main.css">
        <link rel="stylesheet" type="text/css" href="../css/util.css">
        <link rel="stylesheet" type="text/css" href="../css/styles.css">
        <script src="https://kit.fontawesome.com/f5d9884a45.js"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device5-width, initial-scale=1">
    </head>
    <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100 p-t-60 p-b-20">
                    <form class="login100-form validate-form" action="../controlLogin" method="post">

                        <div class="col-md-4 ">
                            <a href="../index.jsp"><img src="../img/LOGO1!.png" width="397"></a>
                        </div>

                        <div class="wrap-input100 validate-input m-t-80 m-b-35" data-validate = "Email">
                            <input class="input100" type="email" name="email" required>
                            <span class="focus-input100" data-placeholder="Email"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
                            <input class="input100" type="password" name="pass" required>
                            <span class="focus-input100" data-placeholder="Password"></span>
                        </div>

                        <div class=" container-login100-form-btn ">
                            <button class="my-color2 login100-form-btn" name="validar">
                                Login
                            </button>
                             <input hidden="true" name="action" value="ingresar"/>
                        </div>

                        <ul class="login-more p-t-100">
                            <li class="m-b-8 ">
                                <span class="txt1 ">
                                    Olvidó
                                </span>

                                <a href="#" class="txt2">
                                    Email / Password?
                                </a>
                            </li>

                            <li>
                                <span class="txt1">
                                    No tienes una cuenta ?
                                </span>

                                <a href="RegistrarUsuario.jsp" class="txt2">
                                    Registrate
                                </a>
                            </li>
                        </ul>
                    </form>

                </div>
            </div>
        </div>
        <div id="dropDownSelect1"></div>
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
    <script src="js/jquery-3.3.1.slim.min.js"></script>

</body>
</html>