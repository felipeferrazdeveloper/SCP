/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Diretoria;
import model.Edital;

/**
 *
 * @author FelipeFerraz
 */
public class ManterEditalController extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String acao = request.getParameter("acao");
        if (acao.equals("confirmarOperacao")) {
            confirmarOperacao(request, response);
        } else {
            if (acao.equals("prepararOperacao")) {
                prepararOperacao(request, response);
            }
        }

    }

    protected void prepararOperacao(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String operacao = request.getParameter("operacao");
            request.setAttribute("operacao", operacao);
            request.setAttribute("editais", Edital.obterEditais());
            request.setAttribute("diretorias", Diretoria.obterDiretorias());
            if (!operacao.equals("Incluir")) {
                int idEdital = Integer.parseInt(request.getParameter("idEdital"));
                Edital edital = Edital.obterEdital(idEdital);
                request.setAttribute("edital", edital);
            }

            RequestDispatcher view = request.getRequestDispatcher("/manterEdital.jsp");
            view.forward(request, response);

        } catch (ServletException e) {
            throw e;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ManterAlunoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void confirmarOperacao(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, ServletException, IOException, SQLException, ClassNotFoundException {

        String operacao = request.getParameter("operacao");
        int idEdital = Integer.parseInt(request.getParameter("idEdital"));
        int numero = Integer.parseInt(request.getParameter("numero"));
        String inicio = request.getParameter("inicio");
        String fim = request.getParameter("fim");
        String descricao = request.getParameter("descricao");
        int idDiretoria = Integer.parseInt(request.getParameter("optDiretoria"));
        try {
            
             Diretoria diretoria = null;
            if (idDiretoria != 0) {
                diretoria = Diretoria.obterDiretoria(idDiretoria);
            }
            Edital edital = null;

            edital = new Edital(idEdital,diretoria,numero,inicio,fim,descricao);
            if (operacao.equals("Incluir")) {
                edital.gravar();
            } else {
                if (operacao.equals("Editar")) {
                    edital.editar();
                } else {
                    if (operacao.equals("Excluir")) {
                        edital.excluir();
                    }
                }
            }

            RequestDispatcher view
                    = request.getRequestDispatcher("PesquisarEditalController");
            view.forward(request, response);
        } catch (IOException e) {
            throw new ServletException(e);
        } catch (SQLException e) {
            throw new ServletException(e);
        } catch (ClassNotFoundException e) {
            throw new ServletException(e);
        } catch (ServletException e) {
            throw new ServletException(e);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ManterEditalController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterEditalController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ManterEditalController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterEditalController.class.getName()).log(Level.SEVERE, null, ex);
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
