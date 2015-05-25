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
                <h2 class="col-md-12">Edtal</h2>
            <form action="ManterEditalController?acao=confirmarOperacao&operacao=${operacao}" 
                  method="post" name="frmManterAluno" onSubmit="validarFormulario(this)">                
                    
                <div class="form-group col-md-4">         
                    <label class="control-label" for="idEdital" id="edital">ID Edital</label>     
                    <input class="form-control input-sm"  type="text" id="idEdital" name="idEdital" value="${edital.idEdital}" <c:if test="${operacao != 'Incluir'}"> readonly </c:if>/> 
                </div>
                <div class="form-group col-md-4">       
                    <label class="control-label" for="numed" id="numed">Numero do Edital:</label>
                    <input class="form-control input-sm"  type="text" id="numEdital" name="numero" value="${edital.numero}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                </div>   
                <div class="form-group col-md-4">  
                    <label class="control-label" for="diretorias" id="diretoria">Diretoria</label>
                    <select class="form-control input-sm" name="optDiretoria" id="diretorias">
                        <c:forEach items="${diretorias}" var="diretoria">
                            <option value="${diretoria.idDiretoria}" 
                                    <c:if test="${diretoria.idDiretoria == edital.diretoria.idDiretoria}"> selected </c:if>
                                    > ${diretoria.nome} </option>
                        </c:forEach>
                    </select>
                </div>  
                <div class="form-group col-md-2">     
                    <label class="control-label" for="inicio" id="datincio">Data de Inicio:</label>
                    <input class="form-control input-sm"  type="text" id="inicio" name="inicio" value="${edital.inicio}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                </div>
                <div class="form-group col-md-2">        
                    <label class="control-label" for="fim" id="datfim">Data de Final:</label>
                    <input  class="form-control input-sm" type="text" id="fim" name="fim" value="${edital.fim}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                </div>
                <div class="form-group col-md-8">       
                    <label class="control-label" for="descricao">Descrição:</label>
                    <textarea class="form-control input-sm" rows="15" name="descricao" id="descricao" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>${edital.descricao}</textarea>
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
      <script src="js/jquery-2.1.4.min.js"></script>

    <!-- Referência do arquivo JS do plugin após carregar o jquery -->
      <!-- Datepicker -->
      <script src="js/bootstrap-datepicker.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.maskedinput.min.js" type="text/javascript"></script>
    <script>
        
    </script>
    <script>
      $(document).ready(function () {
        $('#inicio, #fim').datepicker({
            format: "dd/mm/yyyy",
            language: "pt-BR"
        });
        
        $("#inicio, #fim").mask("99/99/9999");
        $("#idEdital").mask("9?99999");
        $("#numEdital").mask("9999"); 
      }); 
    </script>
  </body>
</html>