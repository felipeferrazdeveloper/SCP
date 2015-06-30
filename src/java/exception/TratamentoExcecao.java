package exception;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TratamentoExcecao extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Exception excecao = (Exception) request.getAttribute("javax.servlet.error.exception");
        Integer codigoStatus = (Integer) request.getAttribute("javax.servlet.error.status_code");
        String nomeServlet = (String) request.getAttribute("javax.servlet.error.servlet_name");
        String operacao = request.getParameter("operacao");
        String uriRequisicao = (String) request.getAttribute("javax.error.request_uri");
        System.out.println(excecao.getMessage());
        if (excecao.getClass().getName().equals("java.lang.NumberFormatException")) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            String titulo = "Informação de Exceção";
            String tipoDocto = "<!doctype html public \"-//w3c//dtd html 4.0 transitional//en\">\n";
            out.println(tipoDocto + "<html></head>\n<body>");
            out.println("<head><title>" + titulo + "</title>");
            out.println("<meta charset=\"utf-8\">");
            out.println("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
            out.println("<link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">");
            out.println(" <link href=\"css/style.css\" rel=\"stylesheet\">");
            out.println("<div class=\"container\">");
            out.println("<div class=\"title\"><h1>SCP - SISTEMA DE CONTROLE DE PROJETOS</h1></div>");
            out.println("<h2>Informação sobre a exceção</h2>");
            out.println("Código do status: " + codigoStatus + "</br></br>");
            out.println("Nome do servlet: " + nomeServlet + "</br></br>");
            out.println("URI da requisição: " + uriRequisicao + "</br></br>");
            out.println("Mensagem: Não a Dados Digitados!</br></br>");
            out.println("<button type=\"button\" class=\"btn btn-default\" onclick=\"window.history.go(-1)\">Voltar</button>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }

        if (excecao.getClass().getName().equals("org.hibernate.exception.ConstraintViolationException")) {
            if (operacao.equals("Incluir")) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                String titulo = "Informação de Exceção";
                String tipoDocto = "<!doctype html public \"-//w3c//dtd html 4.0 transitional//en\">\n";
                out.println(tipoDocto + "<html></head>\n<body>");
                out.println("<head><title>" + titulo + "</title>");
                out.println("<meta charset=\"utf-8\">");
                out.println("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">");
                out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
                out.println("<link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">");
                out.println(" <link href=\"css/style.css\" rel=\"stylesheet\">");
                out.println("<div class=\"container\">");
                out.println("<div class=\"title\"><h1>SCP - SISTEMA DE CONTROLE DE PROJETOS</h1></div>");
                out.println("<h2>Informação sobre a exceção</h2>");
                out.println("Código do status: " + codigoStatus + "</br></br>");
                out.println("Nome do servlet: " + nomeServlet + "</br></br>");
                out.println("URI da requisição: " + uriRequisicao + "</br></br>");
                out.println("Mensagem: Já existe um registro com este ID!</br></br>");
                out.println("<button type=\"button\" class=\"btn btn-default\" onclick=\"window.history.go(-1)\">Voltar</button>");
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            }if (operacao.equals("Excluir")) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                String titulo = "Informação de Exceção";
                String tipoDocto = "<!doctype html public \"-//w3c//dtd html 4.0 transitional//en\">\n";
                out.println(tipoDocto + "<html></head>\n<body>");
                out.println("<head><title>" + titulo + "</title>");
                out.println("<meta charset=\"utf-8\">");
                out.println("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">");
                out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
                out.println("<link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">");
                out.println(" <link href=\"css/style.css\" rel=\"stylesheet\">");
                out.println("<div class=\"container\">");
                out.println("<div class=\"title\"><h1>SCP - SISTEMA DE CONTROLE DE PROJETOS</h1></div>");
                out.println("<h2>Informação sobre a exceção</h2>");
                out.println("Código do status: " + codigoStatus + "</br></br>");
                out.println("Nome do servlet: " + nomeServlet + "</br></br>");
                out.println("URI da requisição: " + uriRequisicao + "</br></br>");
                out.println("Mensagem: Não é possével deletar esse registro! Há uma ligação de dependência com outro!</br></br>");
                out.println("<button type=\"button\" class=\"btn btn-default\" onclick=\"window.history.go(-1)\">Voltar</button>");
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            }

        }

//       response.setContentType("text/html");
//       PrintWriter out = response.getWriter();
//       String titulo = "Informação de Exceção";
//       String tipoDocto = "<!doctype html public \"-//w3c//dtd html 4.0 transitional//en\">\n";
//       out.println(tipoDocto + "<html>\n<head><title>"+titulo+"</title></head>\n<body>");
//       out.println("<h2>Informação sobre a exceção</h2>");
//       out.println("Código do status: "+codigoStatus+"</br></br>");
//       out.println("Nome do servlet: "+nomeServlet+"</br></br>");
//       out.println("Tipo de exceção: "+excecao.getClass().getName()+"</br></br>");
//       out.println("URI da requisição: "+uriRequisicao+"</br></br>");
//       out.println("Mensagem: "+excecao.getMessage());
//       out.println("</body>");
//       out.println("</html>");
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
        processRequest(request, response);
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
