<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>SCP - Pesquisar</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/style.css" rel="stylesheet">
      
  </head>
  <body>
    <div class="container">
        <div class="row">
        <div class="col-md-2 menu">
            <div class="btn-group-vertical">
                <a href="PesquisarAlunoController" class="btn btn-default btn-lg btn-block">Aluno</a>
                <a href="PesquisarAreaController" class="btn btn-default btn-lg btn-block">Área</a>
                <a href="PesquisarCursoController" class="btn btn-default btn-lg btn-block">Curso</a>
                <a href="PesquisarDiretoriaController" class="btn btn-default btn-lg btn-block">Diretoria</a>
                <a href="PesquisarEditalController" class="btn btn-default btn-lg btn-block">Edital</a>
                <a href="PesquisarProfessorController" class="btn btn-default btn-lg btn-block">Professor</a>
                <a href="PesquisarProjetoController" class="btn btn-default btn-lg btn-block">Projeto</a>
                <a href="RelatorioController" class="btn btn-default btn-lg btn-block">Relatórios</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="title"><h1>SCP - SISTEMA DE CONTROLE DE PROJETOS</h1></div>
            <div class="conteudo"> 
                <br>
                <form action="ManterProfessorController?acao=prepararOperacao&operacao=Incluir" method="post">       
                    <input type="submit" name="btnIncluir" value="Incluir Professor" class="btn btn-success" >
                </form>
                <br>
                <div class="inner-addon left-addon">
                    <i class="glyphicon glyphicon-search"></i>
                    <input type="text" class="form-control" id="search" placeholder="Buscar" />
                </div>
               <table class="table table-striped table-hover "id="table">
                   <thead>
                       <tr>
                        <th>Matricula Professor</th>
                        <th>Nome Professor</th>
                        <th colspan="2">Ação</th>
                    </tr>
                   </thead>
                   <tbody>
                    <c:forEach items="${professores}" var="professor">
                        <tr>
                            <td><c:out value="${professor.getSiape()}"/></td>
                            <td><c:out value="${professor.getNome()}"/></td>
                            <td><a href="ManterProfessorController?acao=prepararOperacao&operacao=Editar&idProfessor=<c:out value="${professor.getIdProfessor()}"/>" class="btn btn-warning btn-xs"> Editar</a></td>
                            <td><a href="ManterProfessorController?acao=prepararOperacao&operacao=Excluir&idProfessor=<c:out value="${professor.getIdProfessor()}"/>" class="btn btn-danger btn-xs">Excluir</a></td>       
                        </tr>
                    </c:forEach>
                   </tbody>
                        
                </table>
                </div>
        </div>
        </div>
      <div class="row rodape">
          &#169; Desenvolvido por: Felipe Cintra Ferraz &amp; Pedro Augusto de A. S. Veloso
      </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>  
        var $rows = $('#table tbody tr');
        //var $rows = $('#table tr');
        $('#search').keyup(function() {
        var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

        $rows.show().filter(function() {
            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
            return !~text.indexOf(val);
        }).hide();
        });
    </script>  
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
