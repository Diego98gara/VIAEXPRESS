/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.negocio.servlets;

import co.edu.sena.ViaExpress.persistencia.dao.RolDao;
import co.edu.sena.ViaExpress.persistencia.dao.UserDao;
import co.edu.sena.ViaExpress.persistencia.vo.RolVo;
import co.edu.sena.ViaExpress.persistencia.vo.UserVo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 *
 * @author Diego Alejandro
 */
public class ControladorRol extends HttpServlet {

    String consultar = "Vistas/CrearRol.jsp";
    String editar = "Vistas/EditarRol.jsp";
    RolVo  rolveo = new RolVo();
    RolDao roldao = new RolDao();

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
        PrintWriter out = response.getWriter();
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("consultar")) {
            acceso = consultar;
            System.out.println("PUTO");
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idRol", request.getParameter("id"));
            acceso = editar;
            System.out.println("ingreso");
        } else if (action.equalsIgnoreCase("Actualizar")) {
            String Descripcion = request.getParameter("desc");
            int id = Integer.parseInt(request.getParameter("id"));
            roldao.getActualizarRol(Descripcion, id);
            System.out.println("SE Actualizo Puto");
            acceso = consultar;
        }else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            roldao.getEliminarRol(id);
            acceso = consultar;
        }/*else if(action.equalsIgnoreCase("Crear")){
            String nombre = request.getParameter("Desc");
            roldao.getCrearRol(nombre);
            acceso = consultar;
        }*/
//fin if 

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }// fin do get 

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
        String action = request.getParameter("accion");
           if (action.equalsIgnoreCase("Crear")) {
            String nombre = request.getParameter("Desc");
            roldao.getCrearRol(nombre);
            acceso = consultar;
        } 
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