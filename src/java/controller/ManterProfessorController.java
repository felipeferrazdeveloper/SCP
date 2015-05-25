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
import model.Professor;

/**
 *
 * @author FelipeFerraz
 */
public class ManterProfessorController extends HttpServlet {

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
            request.setAttribute("professoress", Professor.obterProfessores());
            if (!operacao.equals("Incluir")) {
                int idProfessor = Integer.parseInt(request.getParameter("idProfessor"));
                Professor professor = Professor.obterProfessor(idProfessor);
                request.setAttribute("professor", professor);
            }

            RequestDispatcher view = request.getRequestDispatcher("/manterProfessor.jsp");
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
        int idProfessor = Integer.parseInt(request.getParameter("idProfessor"));
        String siape = request.getParameter("siape");
        String Nome = request.getParameter("Nome");
        String CPF  = request.getParameter("CPF");
        String Data_Nascimento = request.getParameter("Data_Nascimento");
        String Nacionalidade = request.getParameter("Nacionalide");
        String Email = request.getParameter("Email");
        String HomePage = request.getParameter("HomePage");
        String Campus = request.getParameter("Campus");
        String Telefone_Residencial = request.getParameter("Telefone_Residencial");
        String Celular = request.getParameter("Celular");
        String Cidade = request.getParameter("Cidade");
        
        try {
           Professor professor = null;

            professor = new Professor(idProfessor, siape, Nome, CPF, Data_Nascimento, Nacionalidade, Email, HomePage, Campus, Telefone_Residencial, Celular, Cidade);
            if (operacao.equals("Incluir")) {
                professor.gravar();
            } else {
                if (operacao.equals("Editar")) {
                    professor.editar();
                } else {
                    if (operacao.equals("Excluir")) {
                        professor.excluir();
                    }
                }
            }

            RequestDispatcher view
                    = request.getRequestDispatcher("PesquisarProfessorController");
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
           Logger.getLogger(ManterProfessorController.class.getName()).log(Level.SEVERE, null, ex);
       } catch (ClassNotFoundException ex) {
           Logger.getLogger(ManterProfessorController.class.getName()).log(Level.SEVERE, null, ex);
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
           Logger.getLogger(ManterProfessorController.class.getName()).log(Level.SEVERE, null, ex);
       } catch (ClassNotFoundException ex) {
           Logger.getLogger(ManterProfessorController.class.getName()).log(Level.SEVERE, null, ex);
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
