/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.negocio.servlets;

import co.edu.sena.ViaExpress.persistencia.dao.TipoDeVehiculoDao;
import co.edu.sena.ViaExpress.persistencia.dao.TipoMercanciaDao;
import co.edu.sena.ViaExpress.persistencia.vo.TipoDeVehiculoVo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Diego Alejandro
 */
public class TipoMercanciaServlet extends HttpServlet {
    String listar = "Vistas/VistaTipoMercancia.jsp";
    String editar ="Vistas/EditarMercancia.jsp";
    TipoDeVehiculoVo tipoDeVehiculoVo = new TipoDeVehiculoVo();
      TipoMercanciaDao tipoMercanciaDao = new TipoMercanciaDao();

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
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listar")) {
            acceso = listar;
            System.out.println("intento");
        }else if (action.equalsIgnoreCase("editar")){
        request.setAttribute("idMercancia", request.getParameter("id"));
        acceso = editar;
            System.out.println(" INGRESO HIZO LA VALIDACION");
        }else if (action.equalsIgnoreCase("Actualizar")){
            String descripcion = request.getParameter("descripcion");
            int id = Integer.parseInt(request.getParameter("id"));
            tipoMercanciaDao.modificarmercancia(descripcion, id);
            acceso=listar;
            System.out.println("se actualizo ");
        }else if (action.equalsIgnoreCase("eliminar")) {
        int id = Integer.parseInt(request.getParameter("id"));
        tipoMercanciaDao.eliminarmercancia(id);
        acceso = listar;
            System.out.println("se elimino");
        }
        
         RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
        
    }// finget 

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
        
         String registrar = request.getParameter("descripcion");
        
        if (tipoMercanciaDao.getcrearmercancia(registrar)) {
            response.sendRedirect("TipoMercanciaServlet?accion=listar");
            System.out.println("intento2");
        }else {
          response.sendRedirect("index.jsp");
            System.out.println(" fracaso");
        }
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
