<%-- 
    Document   : EditarDocumento
    Created on : 25/08/2019, 04:44:43 PM
    Author     : Diego Alejandro
--%>

<%@page import="co.edu.sena.ViaExpress.persistencia.vo.TipoDocumentoVo"%>
<%@page import="co.edu.sena.ViaExpress.persistencia.dao.TipoDocumentoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Vehiculo </title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/stilos1.css">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <meta charset="utf-8">	
    </head>
    <body>
         <div>
            <%  
                TipoDocumentoDao tipodocumentodao = new TipoDocumentoDao();
                int id = Integer.parseInt((String) request.getAttribute("idDocumento"));
                TipoDocumentoVo  tipodocumentoveo = (TipoDocumentoVo) tipodocumentodao.gettipoDocumnetoById(id);
            %>
            
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
                        <div class=" container">
                            <div class="form-group" >
  <input type="hiden"  class="form-control" placeholder="id" name="iddocu" value="<%=tipodocumentoveo.getIdTipoDocumento()%>" style="WIDTH: 300px; HEIGHT: 40px">
                            </div>
                        </div>
                         <div class="col"> 
<input type="text" class="form-control" placeholder="tipo documento" name="descripcionDocu" value="<%=tipodocumentoveo.getDescripcionDocumento()%>" style="WIDTH: 300px; HEIGHT: 40px">
                        </div>
                <div class="mt-3">
                    <button class="btn btn-warning" name ="accion" value="Actualizar">Actualizar</button>
                    <a class="btn btn-danger" href="TipoDocumentoServlet?accion=listar">cancelar</a>
                </div>

                </form>
            </div>
        </div>

    </div>


</div>
        
    </body>
</html>
