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
    <title>SCP</title>
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
                <h2 class="col-md-12">Área</h2>
            <form action="ManterAreaController?acao=confirmarOperacao&operacao=${operacao}" 
                  method="post" name="frmManterArea" onSubmit="validarFormulario(this)">
                    
                    <div class="form-group col-md-6">
                        <label class="control-label" for="idArea" id="codigoArea">Codigo:</label>    
                        <input class="form-control input-sm" type="text" id="idArea" name="idArea" value="${area.idArea}" <c:if test="${operacao != 'Incluir'}"> readonly </c:if>/>        
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label" for="nome" id="nome">Nome:</label> 
                        <input class="form-control input-sm" type="text" id="nome" name="nome" value="${area.nome}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                    </div>
                    <div class="form-group col-md-12">
                        <button type="button" class="btn btn-default" onclick="window.history.go(-1)">Cancelar</button>
                        <input type="submit" value="${operacao}" 
                            <c:if test="${operacao == 'Excluir'}">class="btn btn-danger"</c:if>
                            <c:if test="${operacao == 'Incluir'}">class="btn btn-success"</c:if>
                            <c:if test="${operacao == 'Editar'}">class="btn btn-warning"</c:if>
                        </input>
                    </div>
            </form>
        </div>
        </div>
      <div class="row rodape">
          &#169; Desenvolvido por: Felipe Cintra Ferraz &amp; Pedro Augusto de A. S. Veloso
      </div>
    </div>
      </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->
    <script src="js/jquery-2.1.4.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.maskedinput.min.js" type="text/javascript"></script>
    <script>
        
    </script>
    <script>
      $(document).ready(function () {
        $("#idArea").mask("999999");  
      });
    </script>
  </body>
</html>