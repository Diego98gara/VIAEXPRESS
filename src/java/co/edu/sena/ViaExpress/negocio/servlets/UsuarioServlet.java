/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.negocio.servlets;

import co.edu.sena.ViaExpress.persistencia.dao.UserDao;
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
public class UsuarioServlet extends HttpServlet {

    String listar = "Vistas/VistaConsultar.jsp";
    String editar = "Vistas/EditarUsuario.jsp";
    UserVo userveo = new UserVo();
    UserDao userdao = new UserDao();

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
        if (action.equalsIgnoreCase("listar")) {
            acceso = listar;
            System.out.println("PUTO");
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idUsuario", request.getParameter("id"));
            acceso = editar;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String documento = request.getParameter("docu");
            String nombre = request.getParameter("nom");
            String Apellido = request.getParameter("ape");
            String Telefono = request.getParameter("tel");
            String Direccion = request.getParameter("dire");
            String Correo = request.getParameter("cor");
            String Password = request.getParameter("pass");
           String rol = request.getParameter("rol");
           
           userdao.modificarusuario(1, documento, nombre, Apellido, Telefono, Direccion, Correo, Password,1,id );
            acceso = listar;
            System.out.println("SE Actualizo Puto");
        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            userdao.eliminarUsuario(id);
            acceso = listar;
            System.out.println("SE ELIMINO PUTO");

        }// fin if

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
       //String tipoDocumento = request.getParameter("tdoc");
        String documento = request.getParameter("docu");
        String nombre = request.getParameter("nom").toUpperCase();
        String Apellido = request.getParameter("ape").toUpperCase();
        String Telefono = request.getParameter("tel");
        String Direccion = request.getParameter("dire");
        String Correo = request.getParameter("cor");
        String Password = request.getParameter("pass");
        String rol = request.getParameter("rol");
        int id = Integer.parseInt(request.getParameter("id"));
        int idrol = Integer.parseInt(request.getParameter("idRol"));
        if (userdao.getcrearusuer(id, documento, nombre, Apellido, Telefono, Direccion, Correo, Password,idrol)) {
            response.sendRedirect("UsuarioServlet?accion=listar");
            System.out.println("se agrego puto");
        } else {
            response.sendRedirect("index.jsp");
            System.out.println("no se agrego");
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
