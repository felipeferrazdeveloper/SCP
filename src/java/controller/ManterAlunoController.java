/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Aluno;
import model.Curso;

/**
 *
 * @author FelipeFerraz
 */
public class ManterAlunoController extends HttpServlet {

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
            request.setAttribute("alunos", Aluno.obterAlunos());
            request.setAttribute("cursos", Curso.obterCursos());
            if (!operacao.equals("Incluir")) {
                int idAluno = Integer.parseInt(request.getParameter("idAluno"));
                Aluno aluno = Aluno.obterAluno(idAluno);
                request.setAttribute("aluno", aluno);
            }

            RequestDispatcher view = request.getRequestDispatcher("/manterAluno.jsp");
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
        int idAluno = Integer.parseInt(request.getParameter("idAluno"));       
        String matricula = request.getParameter("matricula");
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        int idCurso = Integer.parseInt(request.getParameter("optCurso"));
        
        String naturalidade = request.getParameter("naturalidade");
        String nacionalidade = request.getParameter("nacionalidade");
        String estado = request.getParameter("estado");
        String cidade = request.getParameter("cidade");
        String cep = request.getParameter("cep");
        String rua = request.getParameter("rua");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String situacaoMilitar = request.getParameter("situacaoMilitar");
        String certidaoMilitar = request.getParameter("certidaoMilitar");
        String localTrabalho = request.getParameter("localTrabalho");
        String telefoneTrabalho = request.getParameter("telefoneTrabalho");
        String telefoneResidencial = request.getParameter("telefoneResidencial");
        String banco = request.getParameter("banco");
        String agencia = request.getParameter("agencia");
        String contaCorrente = request.getParameter("contaCorrente");
        String email = request.getParameter("email");
        String celular = request.getParameter("celular");
        String nascimento = request.getParameter("nascimento");
        String identidade = request.getParameter("identidade");
        
        try {

            Curso curso = null;
            if (idCurso != 0) {
                curso = Curso.obterCurso(idCurso);
            }
            
            Aluno aluno = null;
            aluno = new Aluno(idAluno,curso,nome,identidade,cpf,nascimento,matricula,naturalidade,nacionalidade,estado,cidade,cep,rua,numero,complemento,bairro,telefoneResidencial,celular,email,situacaoMilitar,certidaoMilitar,localTrabalho,telefoneTrabalho,banco,agencia,contaCorrente);
            if (operacao.equals("Incluir")) {
                aluno.gravar();
            } else {
                if (operacao.equals("Editar")) {
                    aluno.editar();
                } else {
                    if (operacao.equals("Excluir")) {
                        aluno.excluir();
                    }
                }
            }

            RequestDispatcher view
                    = request.getRequestDispatcher("PesquisarAlunoController");
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
            Logger.getLogger(ManterAlunoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterAlunoController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ManterAlunoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterAlunoController.class.getName()).log(Level.SEVERE, null, ex);
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
