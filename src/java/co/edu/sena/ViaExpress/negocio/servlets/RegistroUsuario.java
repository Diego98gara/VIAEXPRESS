/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.negocio.servlets;

import co.edu.sena.ViaExpress.persistencia.conexion.PasswordEncrypt;
import co.edu.sena.ViaExpress.persistencia.dao.UserDao;
import co.edu.sena.ViaExpress.persistencia.vo.UserVo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLDataException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Diego Alejandro
 */
public class RegistroUsuario extends HttpServlet {

    String consultar = "Vistas/VistaRegistroExitoso.jsp";
    UserDao userdao = new UserDao();
    UserVo userveo = new UserVo();

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
        String action = request.getParameter("accion");
        int tipoDocumento = Integer.parseInt(request.getParameter("idTdocu"));
        String documento = request.getParameter("txtdocumento");
        String nombre = request.getParameter("txtnombre").toUpperCase();
        String apellido = request.getParameter("txtapellido").toUpperCase();
        String telefono = request.getParameter("txttelefono");
        String direccion = request.getParameter("txtdireccion").toUpperCase();
        String correo = request.getParameter("txtcorreo");
        String contraseña = request.getParameter("txtpasword");
        int rol = Integer.parseInt(request.getParameter("idrol"));
        PasswordEncrypt  ps = new PasswordEncrypt ();
        String securePassword = ps.getMD5EncryptedValue(contraseña);
        if (action.equalsIgnoreCase("Registrar")) {
     userdao.getcrearusuer(tipoDocumento, documento, nombre, apellido, telefono, direccion, correo, securePassword, rol);
            acceso=consultar;
            System.out.println("se agrego puto " + consultar);
        } else {
            System.out.println("error no se ejecuto la sentencia");
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }// fin metodo post 

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
