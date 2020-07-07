/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.negocio.servlets;

import co.edu.sena.ViaExpress.persistencia.dao.PujaDao;
import co.edu.sena.ViaExpress.persistencia.vo.UserVo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diego Alejandro
 */
@WebServlet(name = "PujaServlet", urlPatterns = {"/PujaServlet"})
public class PujaServlet extends HttpServlet {

    PujaDao puejadao = new PujaDao();

    String Vista = "Vistas/VistaTransportista.jsp";

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
        String action = request.getParameter("RegistrarPuja");
        HttpSession session2 = request.getSession();
        UserVo usserloggued = (UserVo) session2.getAttribute("ussser_loggued");
        System.err.println("logueado en el envio " + usserloggued.getApellido());
        String ValorPuja = request.getParameter("ValorPuja");
        String FechaPuja = request.getParameter("FechaPuja");
        String Cometario = request.getParameter("Comentario");
        int idEnvio = Integer.parseInt(request.getParameter("IdEnvioModal"));
        int idusuario = usserloggued.getIduser();
        if (action.equalsIgnoreCase("registrarPujo")) {
            puejadao.GetCrearPuja(ValorPuja, FechaPuja, Cometario, idEnvio, idusuario);
            acceso = Vista;
        }
        request.setAttribute("numbermambo5", 12);
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
