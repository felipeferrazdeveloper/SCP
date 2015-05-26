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
import model.Aluno;
import model.Edital;
import model.Professor;
import model.Projeto;

/**
 *
 * @author FelipeFerraz
 */
public class ManterProjetoController extends HttpServlet {

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
            request.setAttribute("projetos", Projeto.obterProjetos());
            request.setAttribute("editais", Edital.obterEditais());
            request.setAttribute("professores", Professor.obterProfessores());
            request.setAttribute("alunos", Aluno.obterAlunos());
            if (!operacao.equals("Incluir")) {
                int idProjeto = Integer.parseInt(request.getParameter("idProjeto"));
                Projeto projeto = Projeto.obterProjeto(idProjeto);
                request.setAttribute("projeto", projeto);
            }

            RequestDispatcher view = request.getRequestDispatcher("/manterProjeto.jsp");
            view.forward(request, response);

        } catch (ServletException e) {
            throw e;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ManterProjetoController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    private void confirmarOperacao(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, ServletException, IOException, SQLException, ClassNotFoundException {

        String operacao = request.getParameter("operacao");
        int idProjeto = Integer.parseInt(request.getParameter("idProjeto"));       
        String nome = request.getParameter("nome");
        String palavraChave = request.getParameter("palavraChave");
        String areaConhecimento = request.getParameter("areaConhecimento");        
        String descricao = request.getParameter("descricao");
        String situacao = request.getParameter("situacao");
        String caracterizacaoProblema = request.getParameter("caracterizacaoProblema");
        String referencialTeorico = request.getParameter("referencialTeorico");
        String objetivos = request.getParameter("objetivos");
        String metodologia = request.getParameter("metodologia");
        String resultadoEsperado = request.getParameter("resultadoEsperado");
        String inicio = request.getParameter("inicio");
        String fim = request.getParameter("fim");
        String orcamento = request.getParameter("orcamento");
        String referenciasBibliograficas = request.getParameter("referenciasBibliograficas");
        
        int idEdital = Integer.parseInt(request.getParameter("optEdital"));
        int idProfessor = Integer.parseInt(request.getParameter("optProfessor"));
        int idAluno = Integer.parseInt(request.getParameter("optAluno"));
        
        try {

            Edital edital = null;
            if (idEdital != 0) {
                edital = Edital.obterEdital(idEdital);
            }
            
            Professor professor = null;
            if (idProfessor != 0) {
                professor = Professor.obterProfessor(idProfessor);
            }
            
            Aluno aluno = null;
            if (idAluno != 0) {
                aluno = Aluno.obterAluno(idAluno);
            }
            
            Projeto projeto = null;
            projeto = new Projeto(idProjeto,aluno,edital,professor,nome,palavraChave,areaConhecimento,descricao,situacao,caracterizacaoProblema,referencialTeorico,objetivos,metodologia,resultadoEsperado,inicio,fim,orcamento,referenciasBibliograficas);
            if (operacao.equals("Incluir")) {
                projeto.gravar();
            } else {
                if (operacao.equals("Editar")) {
                    projeto.editar();
                } else {
                    if (operacao.equals("Excluir")) {
                        projeto.excluir();
                    }
                }
            }

            RequestDispatcher view
                    = request.getRequestDispatcher("PesquisarProjetoController");
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
            Logger.getLogger(ManterProjetoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterProjetoController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ManterProjetoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterProjetoController.class.getName()).log(Level.SEVERE, null, ex);
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
