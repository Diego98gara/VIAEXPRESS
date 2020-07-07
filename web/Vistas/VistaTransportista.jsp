<%@page import="co.edu.sena.ViaExpress.persistencia.vo.VehiculoVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.VehiculoDao"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.EnvioVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.TipoDeVehiculoVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.TipoDeVehiculoDao"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.vo.TransportistaVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.TransportistaDao"%>
<%-- 
    Document   : VistaCliente
    Created on : 22/09/2019, 05:54:47 PM
    Author     : Diego Alejandro
--%>

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
    </head>

    <body id="page-top">
        <div id="wrapper">
            <ul class="navbar-nav nav2 sidebar sidebar-dark accordion" id="accordionSidebar">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                    <div class="sidebar-brand-icon">
                        <i class="fas fa-truck"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">ViaExpress</div>
                </a>
                <li class="nav-item">
                    <a data-toggle="modal" data-target="#registrot" class="nav-link collapsed" href="">
                        <i class="far fa-clipboard"></i>
                        <span>Registrar Vehículo</a></span>          
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar"> 
                    </div>
                </li>
                <li class="nav-item">
                    <a data-toggle="modal" data-target="#staticBackdrop" class="nav-link collapsed" href="">
                        <i class="far fa-clipboard"></i>
                        <span>Lista Vehiculos</a></span>          
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
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Transportista</span>
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
                            <div class="mt-3">
                                <h2 class="text-center">Envios Disponibles </h2>
                            </div>
                            <table class="table table-striped" id="listaenvios" class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Nombre Envio</th>
                                        <th>Peso</th>
                                        <th>Ancho</th>
                                        <th>Alto</th>
                                        <th>Valor oferta</th>
                                        <th>Tipo mercancia</th>
                                        <th>estado</th>
                                        <th>Ofertar</th>

                                    </tr>
                                </thead>

                                <tbody>
                                    <%
                                        //HttpSession session2=request.getSession();
                                        //UserVo usserloggued =(UserVo) session2.getAttribute("ussser_loggued");
                                        TransportistaDao listenvios = new TransportistaDao();
                                        EnvioVo enviVo = new EnvioVo();
                                        List<TransportistaVo> list_envios = listenvios.getInfoTrasportista();
                                        Iterator<TransportistaVo> intenvios = list_envios.iterator();
                                        TransportistaVo envio = null;
                                        while (intenvios.hasNext()) {
                                            envio = intenvios.next();
                                    %>
                                    <tr><td><%=envio.getNenvio()%></td><td><%=envio.getPeso()%></td>
                                        <td><%=envio.getAncho()%></td><td><%=envio.getAltura()%></td>

                                        <td><%=envio.getVoferta()%></td><td><%=envio.getMercancia()%></td>
                                        <td><%=envio.getSubasta()%></td>
                                        <td>                                          

                                            <button type="boutton" data-sentid="<%=envio.getId()%>" class="btn btn-primary show_modal_puja">Registrar Oferta</button>
                                        </td>
                                    </tr>
                                    <%}%>

                                </tbody>
                            </table>            
                        </section>
                    </div>
                </div>
            </div>
            <div class="modal fade bd-example-modal-lg " id="RegistroPuja" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content container">
                        <form action="PujaServlet"  method="post" class="m-5">  
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Valor puja</label>
                                    <input type="text" class="form-control" id="valor" name="ValorPuja" placeholder="valor">
                                </div>
                                <div class="form-group col-md-6">
                                    <label >fecha oferta</label>
                                    <input type="date" class="form-control" name="FechaPuja" placeholder="Peso">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputAddress">Comentario</label>
                                <input type="hidden" name="IdEnvioModal" id="IdEnvioModal" value="">
                                <input type="text" class="form-control" id="Comentario" name="Comentario" placeholder="1234 Main St">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary" name="RegistrarPuja" value="registrarPujo">Enviar</button>
                            </div>
                    </div>
                    </form>
                </div>
            </div>
            <div class="modal fade bd-example-modal-lg" id="registrot" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myLargeModalLabel">Datos del Vehículo</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="ml-2 col-xl-8 col-lg-7">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold text-primary">Registro de Vehículos</h6>
                                        </div>
                                    </div>
                                </div>
                                <section class=" ml-4 col-sm-10 col-md-7 offset-md-2 mt-1" >
                                    <form action="NuevoVehiculoServlet" method="post">
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleSelect1">Tipo de Vehículo</label>
                                            <select   name="TipoVehiculo" style="width: 370px "class="form-control" id="exampleSelect1">
                                                <%
                                                    TipoDeVehiculoDao tipodevehiculodao = new TipoDeVehiculoDao();
                                                    List<TipoDeVehiculoVo> list = tipodevehiculodao.getordenaPorId();
                                                    Iterator<TipoDeVehiculoVo> iter = list.iterator();
                                                    TipoDeVehiculoVo tv = null;
                                                    while (iter.hasNext()) {
                                                        tv = iter.next();
                                                %>
                                                <option value="<%= tv.getIdtipovehiculo()%>"><%=tv.getDespripcionVehiculo()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <label>Placa</label>
                                                <input type="text"  name="Placa" class="form-control" placeholder="Placa">
                                            </div>
                                            <div class="col-3">
                                                <label>Modelo</label>
                                                <input type="text" name="Modelo" class="form-control" placeholder="Modelo">
                                            </div>

                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleTextarea">Observaciones</label>
                                            <textarea style="width: 370px" class="form-control" id="exampleTextarea" rows="2"></textarea>
                                        </div>
                                        <button type="submit" name="RegistrarVehiculo" value="RegistarVehicula"class="btn btn-danger btn-lg btn-block" style="WIDTH: 200px; HEIGHT: 40px">Guardar</button>    
                                    </form>
                                </section> 
                            </div>
                        </div>
                    </div>
                </div>    
                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Lista de vehiculos</h5>
                            </div>
                            <div class="modal-body">
                                <table class="table table-striped table-dark">
                                    <thead>
                                        <tr>
                                            <th scope="col">Placa</th>
                                            <th scope="col">Tipo Vehiculo</th>
                                            <th scope="col">Handle</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <tbody>
                                        <%
                                            HttpSession session2 = request.getSession();
                                            UserVo usserloggued = (UserVo) session2.getAttribute("ussser_loggued");
                                            int idusuario = usserloggued.getIduser();
                                            VehiculoDao vehiculodao = new VehiculoDao();
                                            VehiculoVo vehiculovo = new VehiculoVo();
                                            List<VehiculoVo> vehiculo = vehiculodao.getvehiculoPorUsuario(idusuario);
                                            Iterator<VehiculoVo> iterador = vehiculo.iterator();
                                            VehiculoVo vehiculovod = null;
                                            while (iterador.hasNext()) {
                                                vehiculovod = iterador.next();
                                        %>
                                        <tr> 
                                            <td><%=vehiculovod.getPlaca()%></td>
                                            <td><%=vehiculovod.getTipoVehiculo()%></td>
                                            <td><%=vehiculovod.getModelo()%></td>

                                        </tr>
                                        <%}%>
                                    </tbody>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div> 
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
                <script src="js/sb-admin-2.min.js"></script>
                <script src="js/demo/adminclientes.js"></script>
                <script src="js/Validador.js"></script>
                <script src="js/bootstrap-datepicker.min.js"></script>
                <script>
                    $(document).ready(function () {
                        $('.show_modal_puja').click(function () {
                            console.log($(this).data('sentid'));
                            $('#IdEnvioModal').val($(this).data("sentid"));
                            $('#RegistroPuja').modal();
                        });
                    });
                </script>
                </body>
                </html>