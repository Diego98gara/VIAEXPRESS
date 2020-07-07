<%-- 
    Document   : index
    Created on : 15/08/2019, 06:21:23 PM
    Author     : Diego Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Index</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <meta charset="utf-8">
    </head>
</head>
<body>
    <section>
        <div class=" row shadow-sm p-3 mb-3 bg-white rounded">
            <div class="col-md-7 mt-3 ml-5">
                <img src="img/LOGO1!.png" width="379">
            </div>
            <div class="col-md-4">
                <div class="d-flex  flex-row justify-content-end mt-5">
                         <a href="Vistas/RegistrarUsuario.jsp"class="btn btn-secondary mr-1 sombras4">Registrate</a>
                    <a href="Vistas/Login.jsp" class="btn btn-danger sombras4 " >Iniciar sesion</a>
                </div>
            </div>

        </div>
    </section>
    <main class="mt-1" >
        <div class="row">
            <header class="col-xl-12 border-bottom">
                <nav class="navbar navbar-expand-lg navbar-dark my-color2 nav1 ">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class=" d-flex flex-row justify-content-center collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">

                            <li class="nav-item active">
                                <a class="nav-link" href="">Como Comenzar</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="">Realizar Envio</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="">Realizar Carga</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="">Informacion Trasportistas</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="">Trabaja en ViaExpress</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link " href="">Mision y Vision</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <section class="col-xl-6 mt-3 ml-4 shadow-lg p-0 mb-3 bg-white rounded">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="img/img1.jpg" class="d-block w-100" alt="">
                        </div>
                        <div class="carousel-item">
                            <img src="img/img2.jpg" class="d-block w-100" alt="">
                        </div>
                        <div class="carousel-item">
                            <img src="img/img3.jpg" class="d-block w-100" alt=".">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </section>
            <section class="col-md-5 mt-5 ml-5">
                <div class="d-flex  flex-row justify-content-center">
                    <i class="icon fas fa-mobile-alt"></i> <p class="ml-3 font">Registra Tus datos y tu informacion personal básica.</p>
                </div>
                <div class="d-flex  flex-row justify-content-center p-5">
           <p class="font"> Realiza el envio y ponlo a subastar   .</p><i class="icon fas fa-dolly-flatbed"></i>
                </div>
                <div class="d-flex  flex-row justify-content-center">
                    <i class="icon fas fa-shipping-fast"></i> <p class="ml-2 font">  Verifica la subastas y acepta el trasportista que llevara tu envio, </p>
                </div>
        </div>
    </section>
    <section class="mt-5">
        <div class="row">
            <div class="col-md-6">
                <div class=" ml-5 mt-5">
                    <p class="font text-center">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    </p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="margen">
                    <img class=" seccenter " src="img/img9.jpg" width="465">
                </div>
            </div>
        </div>  
    </section>
    <section class="container mt-5">
        <div class=" row">
            <div class="d-flex justify-content-star">
                <div class="col-sm-3 mt-5">
                    <div>
                        <img src="img/img7.jpg" alt="" width="290">
                    </div>
                    <div class="card mt-3 color2" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title colorCard">Registrate</h5>
                            <h6 class="card-subtitle mb-2 text-muted">Puede registrarte como cliente o compo trasportista</h6>
                            <p class="card-text">Unas de las funciones de ViaExpress es que puede ser cliente o trasportista esta modalidad te ayudara a tener mas ingresos si eres trasportista y a disfrutar de los multiples posibilidades de envios que te brindamos.</p>
                            <div class="text-center">
                                <button type="button" class="btn btn-danger">Registrar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-center">
                <div class="col-sm-3 mt-5 ">
                    <div>
                        <img src="img/img5.jpg" alt=""  width="290">
                    </div>
                    <div class="card mt-3 color2" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title colorCard">Tipos de envio</h5>
                            <h6 class="card-subtitle mb-2 text-muted">Puedes enviar cualquier cosa</h6>
                            <p class="card-text">las funciones de ViaExpress son increibes, puedes llevar mutiplicidad de elementos desde un armario hasta todo un automovil una vez decidas que enviaras y lo  hayas selecionado en las categorias correspondiente entrara en el proceso de subasta.</p>
                            <div class="text-center">
                                <button type="button" class="btn btn-danger">Crear envio</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-end">
                <div  class="col-sm-3 mt-5 ">
                    <div>
                        <img src="img/img8.jpg" alt=""  width="290">
                    </div>
                    <div class="card mt-3 color2" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title colorCard">Subasta</h5>
                            <h6 class="card-subtitle mb-2 text-muted">Puedes escoger mil opciones</h6>
                            <p class="card-text ">En ViaExpress puedes escoger quien llevara tu carga con la modalidad de subasta, tu envio sera puesto en subasta donde participaran los mejores trasportistas, podras ver el perfil de la persona que quieres que  trasporte tu envio y podras aceder a la oferta mas llamativa.</p>
                            <div class="text-center">
                                <button type="button" class="btn btn-danger">Ver ofertas</button>
                            </div>
                        </div>
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
                            <a href="../index.jsp"><img src="img/LogoRedu.png"width="170"> </a>
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
</main>
<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="js/f5d9884a45.js" ></script>
</body>
</html>