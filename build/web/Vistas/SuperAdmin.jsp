<%-- 
    Document   : SuperAdmin
    Created on : 28/08/2019, 03:27:55 PM
    Author     : Diego Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, user-scalable=no">
  <title></title>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="css/stilos_1.css">
</head>
<body>

  <header class="text-center">
    <div class="progress">
        <div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
       </div>
    <div class="card">
  <div class="card-header">

      <a href="index.jsp"><img src="img/logo_1.png" width="250" height="50"></a>
    
  </div>
  <center>
  <div>
    <h1 class="card-title">Super Administrador</h1>
  </header>

  <main class="row m-0" id="margen">
    <nav class="col-sm-12 col-md-2 mt-5 ">
      <ul class="list-group text-center">
        <li>
          <a class="btn btn-success list-group-item list-group-item-action" href="UsuarioServlet?accion=listar">Gestion Usuarios</a>
        </li>
        <li>
          <a class="btn btn-success list-group-item list-group-item-action" href="TipoVehiculoServlet?accion=listar">Tipos Vehiculos</a>
        </li>
        <li>
          <a class="btn btn-success list-group-item list-group-item-action" href="ControladorRol?accion=consultar">Roles</a>
        </li>
        <li>
 <a class="btn btn-success list-group-item list-group-item-action" href="TipoDocumentoServlet?accion=listar">Tipos Documento</a>
         </li> 
         <li>
<a class="btn btn-success list-group-item list-group-item-action" href="TipoMercanciaServlet?accion=listar">Tipos Mercancia</a>             
         </li>
      </ul>
    </nav>

    <section class="col-sm-12 col-md-7 offset-md-3 mt-5" >
      <div id="carouselExampleControls" class="carousel slide size-carousel" data-ride="carousel" >
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="img/imagen1.jpg" class="d-block w-100">
          </div>
          <div class="carousel-item">
            <img src="img/imagen2.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="img/imagen3.jpg" class="d-block w-100" alt="...">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </section>
  </main>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>