/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.negocio.servlets;

import co.edu.sena.ViaExpress.persistencia.dao.DetalleEnvioDao;
import co.edu.sena.ViaExpress.persistencia.dao.EnvioDao;
import co.edu.sena.ViaExpress.persistencia.vo.EnvioVo;
import co.edu.sena.ViaExpress.persistencia.vo.UserVo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diego Alejandro
 */
public class crearEnvioServlet extends HttpServlet {

    EnvioDao enviodao = new EnvioDao();
    EnvioVo enviovo = new EnvioVo();

    DetalleEnvioDao detalleenviodao = new DetalleEnvioDao();
    String vistaCliente = "Vistas/VistaCliente.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("registrarEnvio1parte");
        //Capturar la sesion del usuario 
        HttpSession session2=request.getSession();
        UserVo usserloggued =(UserVo) session2.getAttribute("ussser_loggued");
        System.err.println("logueado en el envio "+usserloggued.getApellido());
        // //////////////////////////////////informacion de envio 
        int idusuario =usserloggued.getIduser();
        String nombreEnvio = request.getParameter("NomEnvio");
        float peso = Integer.parseInt(request.getParameter("peso"));
        float ancho = Integer.parseInt(request.getParameter("ancho"));
        float alto = Integer.parseInt(request.getParameter("altura"));
        String observaciones = request.getParameter("observaciones");
        int valorOferta = Integer.parseInt(request.getParameter("Voferta"));
        int tipoMercancia = Integer.parseInt(request.getParameter("idMercancia"));
        int estado = 2;//  se guarda por defecto estado subasta
        String  Fechainicio = request.getParameter("FechaInicio");
        String  FechaFin = request.getParameter("FechaFin");

        ////////////////////// informacion de recogida 
        int documentoRecogida = Integer.parseInt(request.getParameter("documentoRecogida"));
        String nombreRecogida = request.getParameter("nombreRecogida");
        String TelefonoRecogida = request.getParameter("telefonoRecogida");
        int departamentoRecogida = Integer.parseInt(request.getParameter("idDepartamentoRecogida"));
        int ciudadRecogida = Integer.parseInt(request.getParameter("idCiudadRecogida"));
        String direccionRecogida = request.getParameter("direccionRecogida");
        String observacionesRecogida = request.getParameter("observacionesRecogida");
        int Recogida = 1;
       
        ///////////////////////////informacion entrega
        int documentoEntrega = Integer.parseInt(request.getParameter("documentoEntrega"));
        String nombreEntrega = request.getParameter("nombreEntrega");
        String telefonoEntrega = request.getParameter("telefonoEntrega");
        int departamentoEntrega = Integer.parseInt(request.getParameter("idDepartamentoEntrega"));
        int ciudadEntrega = Integer.parseInt(request.getParameter("idCiudadEntrega"));
        String direccionEntrega = request.getParameter("direccionEntrega");
        String observacionesEntrega = request.getParameter("observacionesEntrega");
        int Entrega = 2;
        
        
        System.out.println("ingreso Servlet ");
        if (action.equalsIgnoreCase("RegistrarEnvio")) {
            System.out.println("ingreso  if ");
    enviodao.GetCrearEnvio(idusuario, nombreEnvio, peso, ancho, alto, observaciones, valorOferta, tipoMercancia, estado,Fechainicio,FechaFin);
            System.out.println("este es el ultimo id " + enviodao.getUltimoID());
            int idEnvio = enviodao.getUltimoID();
   detalleenviodao.GetCrearDetalle(documentoRecogida, nombreRecogida, TelefonoRecogida, departamentoRecogida, ciudadRecogida, direccionRecogida, observacionesRecogida,Recogida,idEnvio );
   detalleenviodao.GetCrearDetalle(documentoEntrega, nombreEntrega, telefonoEntrega, departamentoEntrega, ciudadEntrega, direccionEntrega, observacionesEntrega, Entrega, idEnvio);

            acceso = vistaCliente;
        }
        
        request.setAttribute("numbermambo5",12);
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
