<%-- 
    Document   : VistaCliente
    Created on : 22/09/2019, 05:54:47 PM
    Author     : Diego Alejandro
--%>

<%@page import="co.edu.sena.ViaExpress.persistencia.vo.PujaVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.PujaDao"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.DepartamentoVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.DepartamentoDao"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.CiudadVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.ClienteVo"%>

<%@page import="co.edu.sena.ViaExpress.persistencia.dao.CiudadDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.TipoMercanciaVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.UserVo"%>
<%@page import="java.util.List"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.TipoMercanciaDao"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.ClienteDao"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>ViaExpress</title>

        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker.css"/>

    </head>

    <body id="page-top">
        <div id="wrapper">
            <ul class="navbar-nav nav1 sidebar sidebar-dark accordion" id="accordionSidebar">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                    <div class="sidebar-brand-icon">

                        <i class="fas fa-truck"></i>
                    </div>

                    <div class="sidebar-brand-text mx-3">ViaExpress</div>
                </a>
                <li class="nav-item">
                    <a data-toggle="modal" data-target="#registro" class="nav-link collapsed" href="">
                        <i class="far fa-clipboard"></i>
                        <span>Registrar Envio</a></span>          
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar"> 
                    </div>
                </li>
                <li class="nav-item">
                    <a data-toggle="modal" data-target="" class="nav-link collapsed" href="">
                        <i class="fas fa-edit"></i>
                        <span>Actualizar Datos</span>
                    </a>
                </li>
            </ul>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                        <ul class="navbar-nav mr-auto offset-md-5 mt-0">
                        </ul>
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-address-card" style="padding: 10px"></i>   
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Cliente</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Admin
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Configuracion
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <form action="./controlLogin" method="post">
                                        <input hidden="true" name="action" value="logout"/>
                                        <button type="submit"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                            Cerrar Sesion</button>                  
                                    </form>           
                                </a>
                            </div>
                        </li>
                    </nav>
                    <div>
                        <section class="col-xl-12 bg-white rounded">
                            <h2 class="text-center">Envios Realizados </h2>
                            <table class="table table-striped"id="listaenvios" class="table">
                                <thead  >
                                    <tr>
                                        <th>Nombre Envio</th>
                                        <th>Valor Ofertado</th>
                                        <th>Tipo Mercancia</th>
                                        <th>Estado</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        HttpSession session2 = request.getSession();
                                        UserVo usserloggued = (UserVo) session2.getAttribute("ussser_loggued");
                                        ClienteDao listaenvios = new ClienteDao();
                                        List<ClienteVo> list_envios = listaenvios.getInfoCliente(usserloggued.getIduser());
                                        Iterator<ClienteVo> intenvios = list_envios.iterator();

                                        ClienteVo enviovo = null;
                                        while (intenvios.hasNext()) {
                                            enviovo = intenvios.next();
                                            int inEnvio = enviovo.getId();
                                            String estadodes = enviovo.getEstado();
                                    %>
                                    <tr><td><%=enviovo.getNenvio()%></td><td><%=enviovo.getValor()%></td>
                                    <td><%=enviovo.getMercancia()%></td><td><%=enviovo.getEstado()%></td>

                                    <td>
                                    <%
                                        String name = enviovo.getEstado();
                                    %>
                                    <!--JSP IF implementation.-->
                                    <%
                                        if (name.equals("En Subasta")) {
                                    %>
                                        <button type="boutton" data-sentid="<%=enviovo.getId()%>" class="btn btn-primary show_modal_pujas">Ver ofertas</button>
                                    <%
                                        }
                                    %> 
                                    <%
                                        if (name.equals("En ruta")) {
                                    %>
                                        <button type="boutton" data-sentid="<%=enviovo.getId()%>" class="btn btn-success show_puja">Aprobada </button>
                                    <%
                                        }
                                    %> 
                                    </td></tr>
                                <%}%>

                                </tbody>
                            </table>            
                        </section>
                    </div>
                </div>
            </div>
            <div class="modal fade bd-example-modal-lg" id="registro" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h4 class="modal-title" id="myLargeModalLabel">Datos de Envio</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="ml-2 col-xl-8 col-lg-7">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold text-primary">Datos de Servicio</h6>
                                        </div>
                                    </div>
                                </div>
                                <section class=" ml-4 col-sm-10 col-md-7 offset-md-2 mt-1" >
                                    <form action="crearEnvioServlet" method="post" >
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" >Valor de la Oferta</label>
                                            <input type="ValorOferta" name="Voferta" class="form-control" id="exampleInputEmail1" placeholder="Valor de la Oferta">
                                        </div>  
                                        <div class="row">
                                            <div class="col-6">
                                                <label>Fecha Inicio Subasta</label>
                                                <input type="date" name="FechaInicio"class="form-control" placeholder="Peso">
                                            </div>
                                            <div class="col-6">
                                                <label>Fecha Fin Subasta</label>
                                                <input type="date" name="FechaFin" class="form-control" placeholder="Altura">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" >Nombre del Envio</label>
                                            <input type="NombreEnvio" name="NomEnvio" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Nombre del Envio">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleSelect1">Tipo de Mercancia</label>
                                            <select name="idMercancia" class="form-control" id="exampleSelect1">
                                                <%
                                                    TipoMercanciaDao tipomercancia = new TipoMercanciaDao();
                                                    List<TipoMercanciaVo> list = tipomercancia.getordenaPorId();
                                                    Iterator<TipoMercanciaVo> iter = list.iterator();
                                                    TipoMercanciaVo tm = null;
                                                    while (iter.hasNext()) {
                                                        tm = iter.next();
                                                %>
                                                <option value ="<%=tm.getIdTipoMercacia()%>"><%=tm.getDescripcionTipoMercancia()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <label>Peso</label>
                                                <input type="text" name="peso"class="form-control" placeholder="Peso">
                                            </div>
                                            <div class="col-3">
                                                <label>Altura</label>
                                                <input type="text" name="altura" class="form-control" placeholder="Altura">
                                            </div>
                                            <div class="col-3">
                                                <label>Anchura</label>
                                                <input type="text"  name="ancho" class="form-control" placeholder="Ancho">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleTextarea">Observaciones</label>
                                            <textarea class="form-control" name="observaciones" id="exampleTextarea" rows="2"></textarea>
                                        </div>
                                </section> 
                            </div>
                            <div class="row">
                                <div class="col-lg-5 mb-4 ">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Información de Recogida</h6>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="ml-3 col-lg-6 mb-4">
                                            <div class="form-group" >
                                                <label >Documento</label>
                                                <input style="width: 300px" type="Documento" class="form-control"aria-describedby="emailHelp" placeholder="Documento" name ="documentoRecogida">
                                                <br>
                                                <label >Nombre Contacto</label>
                                                <input style="width: 300px" type="NombreEnvio" class="form-control"aria-describedby="emailHelp" placeholder="Nombre" name="nombreRecogida">
                                                <label class="mt-3">Telefono</label>
                                                <input style="width: 300px" type="phone" class="form-control"aria-describedby="phone" placeholder="Telefono" name="telefonoRecogida">

                                                <div class="mt-3 form-group">
                                                    <label for="exampleSelect1">Departamento</label>
                                                    <select name="idDepartamentoRecogida"  style="width: 300px" class="form-control" id="exampleSelect1">
                                                        <%
                                                            DepartamentoDao departamento = new DepartamentoDao();
                                                            List<DepartamentoVo> listadepar = departamento.getobtDepartamento();
                                                            Iterator<DepartamentoVo> iteradordepar = listadepar.iterator();
                                                            DepartamentoVo departamentoveo = null;
                                                            while (iteradordepar.hasNext()) {
                                                                departamentoveo = iteradordepar.next();
                                                        %>
                                                        <option  value="<%=departamentoveo.getIdDepartamento()%>"><%=departamentoveo.getNombreDepartamento()%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleSelect1">Ciudad</label>
                                                    <select  name="idCiudadRecogida"  style="width: 300px" class="form-control" id="exampleSelect1">
                                                        <%
                                                            CiudadDao ciudaddao = new CiudadDao();
                                                            List<CiudadVo> lista = ciudaddao.getOrdenarId();
                                                            Iterator<CiudadVo> iterador = lista.iterator();
                                                            CiudadVo ciudadvo = null;
                                                            while (iterador.hasNext()) {
                                                                ciudadvo = iterador.next();
                                                        %>
                                                        <option value="<%=ciudadvo.getCiudad()%>"><%=ciudadvo.getNombreCiudad()%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Dirección</label>
                                                    <input style="width: 300px" type="NombreEnvio" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Dirección" name="direccionRecogida">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleTextarea">Observaciones</label>
                                                    <textarea style="width: 300px" class="form-control" id="exampleTextarea" rows="2" name="observacionesRecogida"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 mb-4"> </div>
                                        <div class="col-lg-6 mb-4">
                                            <div >
                                            </div>
                                        </div>    
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Información de Entrega</h6>
                                        </div>
                                        <div class="row">
                                            <div class="mt-4 ml-3 col-lg-6 mb-4">
                                                <div class="form-group" >
                                                    <label >Documento</label>
                                                    <input style="width: 300px" type="Documento" class="form-control"aria-describedby="emailHelp" placeholder="Documento" name="documentoEntrega">
                                                    <br>
                                                    <label>Nombre Contacto</label>
                                                    <input style="width: 300px" type="NombreEnvio" class="form-control"aria-describedby="emailHelp" placeholder="Nombre" name="nombreEntrega">
                                                    <label class="mt-3">Telefono</label>
                                                    <input style="width: 300px" type="phone" class="form-control"aria-describedby="phone" placeholder="Telefono" name="telefonoEntrega">
                                                    <div class="mt-3 form-group">
                                                        <label for="exampleSelect1">Departamento</label>
                                                        <select name="idDepartamentoEntrega"  style="width: 300px" class="form-control" id="exampleSelect1">
                                                            <%
                                                                List<DepartamentoVo> listadeparen = departamento.getobtDepartamento();
                                                                Iterator<DepartamentoVo> iteradordeparentre = listadeparen.iterator();
                                                                DepartamentoVo departamentoveoentre = null;
                                                                while (iteradordeparentre.hasNext()) {
                                                                    departamentoveoentre = iteradordeparentre.next();
                                                            %>
                                                            <option  value="<%=departamentoveoentre.getIdDepartamento()%>"><%=departamentoveoentre.getNombreDepartamento()%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleSelect1">Ciudad</label>
                                                        <select  name="idCiudadEntrega"  style="width: 300px" class="form-control" id="exampleSelect1">
                                                            <%

                                                                List<CiudadVo> listaentreg = ciudaddao.getOrdenarId();
                                                                Iterator<CiudadVo> iteradorentre = listaentreg.iterator();
                                                                CiudadVo ciudadvoentre = null;
                                                                while (iteradorentre.hasNext()) {
                                                                    ciudadvoentre = iteradorentre.next();
                                                            %>
                                                            <option value="<%=ciudadvoentre.getCiudad()%>"><%=ciudadvoentre.getNombreCiudad()%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Dirección</label>
                                                        <input style="width: 300px" type="NombreEnvio" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Dirección" name="direccionEntrega">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleTextarea">Observaciones</label>
                                                        <textarea style="width: 300px" class="form-control" id="exampleTextarea" rows="2" name="observacionesEntrega"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mb-4">
                                                <div >
                                                    <div >
                                                        <div class="text-white-50 small">#1cc88a</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mb-4">
                                            </div>    
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <center>
                                <button type="submit" class="btn btn-danger btn-lg btn-block" name="registrarEnvio1parte"  value="RegistrarEnvio"     style="WIDTH: 400px; HEIGHT: 40px">Guardar</button>
                            </center>
                            </form>      
                            <br>
                            <br>
                        </div>
                    </div>
                </div> 
            </div>

            <div class="modal fade bd-example-modal-lg" id="consultar" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h4 class="modal-title text-center" id="myLargeModalLabel">Ofertas</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="card" id= >
                                <div class="card-header">
                                    <table class="table">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th scope="col">Valor Puja</th>
                                                <th scope="col">Fecha Puja</th>
                                                <th scope="col">Comentario</th>
                                                <th scope="col">Opcion</th>

                                            </tr>
                                        </thead>
                                        <tbody id="body_table_pujas"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <script src="vendor/jquery/jquery.min.js"></script>
                        <script src="js/main.js"></script>
                        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
                        <script src="js/sb-admin-2.min.js"></script>
                        <script src="js/demo/adminclientes.js"></script>
                        <script src="js/Validador.js"></script>
                        <script src="js/bootstrap-datepicker.min.js"></script>

                        <<script>
                            $(document).ready(function ()
                            {
                                $('.show_modal_pujas').click(function () {
                                    var idEnvio = $(this).data("sentid");
                                    $('#body_table_pujas').empty();
                                    $.post('NewAjax',
                                            {
                                                idEnvio: idEnvio
                                            }, function (reponse) {

                                        var html = "";
                                        var e = 0;
                                        $(reponse).each(function (i, index) {
                                            console.log(i);
                                            console.log(index);
                                            html += "<tr><td>" + index.ValorPuja + "</td><td>" + index.FechaPuja + "</td>" + index.ValorPuja + "<td>" + index.Comentario + "</td><td><button  type='boutton' data-dEnvio=" + index.idenvio + " data-dPuja=" + index.idPuja + " class='btn btn-primary aprobarpuja'>Aprobar</button></td></tr>";
                                            e++;
                                        });
                                        if (e === 0) {
                                            html = "<tr><td colspan='4'><span class='col-md-12 d-flex justify-content-center'><b>No han realizado ofertas</b></span></td></tr>";
                                        }
                                        $('#body_table_pujas').append(html);
                                        load_out_dom();
                                        $('#consultar').modal();
                                    });
                                });

                                function load_out_dom()
                                {
                                    console.log("hola chiquito");
                                    $('.aprobarpuja').click(function () {
                                        var idEnvio = $(this).data("denvio");
                                        var idPuja = $(this).data("dpuja");
                                        $.post('CambioEstadoServlet',
                                                {
                                                    idEnvio: idEnvio,
                                                    idPuja: idPuja

                                                }, function (response) {
                                            if (response === 1) {
                                                alert("Puja finalizada");
                                                location.reload();
                                            } else {
                                                alert("Ocurrio un error");
                                                location.reload();
                                            }
                                        });
                                    });
                                }
                            });

                        </script>
                        </body>
                        </html>

