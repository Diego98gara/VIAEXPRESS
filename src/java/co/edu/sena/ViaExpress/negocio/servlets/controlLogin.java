/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mtimote
 */
public class controlLogin extends HttpServlet {

    String Superadministrador = "Vistas/SuperAdmin.jsp";
    String index = "index.jsp";
    String cliente = "Vistas/VistaCliente.jsp";
    String Transportista = "Vistas/VistaTransportista.jsp";

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
        String action = request.getParameter("action");
        String acceso = "";

        if (action.equalsIgnoreCase("logout")) {
            HttpSession session2 = request.getSession();
            session2.invalidate();
            acceso = index;
        } else {
            HttpSession session = request.getSession(true);
            processRequest(request, response);
            String correo = request.getParameter("email");
            String password = request.getParameter("pass");
            String passwordToHash = request.getParameter("pass");
            PasswordEncrypt pe = new PasswordEncrypt();

            String securePassword = pe.getMD5EncryptedValue(password);
            System.out.println(securePassword + "esta es la contraseña");

            UserDao co = new UserDao();
            UserVo uservo = co.validar(correo, securePassword);
            System.out.println("este es user " + uservo.getIduser());
            if (uservo.getIduser() == 0) {
                acceso = index;
                System.err.println("guarda nada");
            } else 
            {
                switch (uservo.getRol()) {
                    case "1":
                        acceso = Superadministrador;
                        break;
                    case "2":
                        acceso = cliente;
                        break;
                    case "3":
                        acceso = Transportista;
                        break;
                    default:
                        acceso = index;
                        break;
                }
                session.setAttribute("ussser_loggued", uservo);
                HttpSession session2 = request.getSession();
                UserVo usserloggued = (UserVo) session2.getAttribute("ussser_loggued");
                System.err.println("logueado es " + usserloggued.getApellido());

            }

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
