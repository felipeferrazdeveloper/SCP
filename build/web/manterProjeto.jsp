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
                <form action="ManterProjetoController?acao=confirmarOperacao&operacao=${operacao}" 
                      method="post" name="frmManterAluno" onSubmit="validarFormulario(this)">                   
                    
                    <div class="form-group col-md-4">   
                        <label class="control-label" id="idAluno">ID Projeto</label>    
                        <input class="form-control input-sm" type="text" id="idProjeto" name="idProjeto" value="${projeto.idProjeto}" <c:if test="${operacao != 'Incluir'}"> readonly </c:if>/> 
                    </div>  
                    <div class="form-group col-md-4">        
                        <label class="control-label">Inicio: </label>
                        <input placeholder="__/__/____" class="form-control input-sm" type="text" id="inicio" name="inicio" value="${projeto.inicio}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                    </div>     
                    <div class="form-group col-md-4">       
                        <label class="control-label">Fim: </label>
                        <input placeholder="__/__/____" class="form-control input-sm" type="text" id="fim" name="fim" value="${projeto.fim}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                    </div>   
                    <div class="form-group col-md-12">            
                        <label class="control-label" id="matricula">Nome</label>
                        <input class="form-control input-sm" type="text" id="nome"  name="nome" value="${projeto.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/> 
                    </div>     
                     <div class="form-group col-md-6">       
                        <label class="control-label" id="curso">Matricula Aluno: </label>
                        <select class="form-control input-sm" name="optAluno" >
                            <c:forEach items="${alunos}" var="aluno">
                                <option value="${aluno.idAluno}" value="${aluno.nome}" 
                                        <c:if test="${aluno.idAluno == projeto.aluno.idAluno}"> selected </c:if>
                                        > ${aluno.matricula} - ${aluno.nome}
                                </option>
                            </c:forEach>
                        </select>
                    </div>   
                    <div class="form-group col-md-6">       
                        <label class="control-label" id="curso">SIAPE Professor: </label>
                        <select class="form-control input-sm" name="optProfessor" >
                            <c:forEach items="${professores}" var="professor">
                                <option value="${professor.idProfessor}" 
                                        <c:if test="${professor.idProfessor == projeto.professor.idProfessor}"> selected </c:if>
                                        > ${professor.siape} - ${professor.nome} 
                                </option>
                            </c:forEach>
                        </select>
                    </div> 
                    <div class="form-group col-md-3">       
                        <label class="control-label" id="curso">Numero do Edital: </label>
                        <select class="form-control input-sm" name="optEdital" >
                            <c:forEach items="${editais}" var="edital">
                                <option value="${edital.idEdital}" 
                                    <c:if test="${edital.idEdital== projeto.edital.idEdital}"> selected </c:if>
                                    > ${edital.numero}
                                </option>
                            </c:forEach>
                        </select>
                    </div> 
                         
                    <div class="form-group col-md-3">        
                        <label class="control-label" id="nome">Palavra Chave</label>
                        <input class="form-control input-sm" type="text" id="palavraChave"   name="palavraChave" value="${projeto.palavraChave}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                    </div>     
                    <div class="form-group col-md-3">  
                        <label class="control-label" id="nasc">Área do Conhecimento: </label>
                        <input class="form-control input-sm" type="text" id="areaConhecimento" name="areaConhecimento" value="${projeto.areaConhecimento}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                    </div>     
                    <div class="form-group col-md-3">        
                        <label class="control-label" id="nacio">Situação: </label>
                        <!--<input class="form-control input-sm" type="text" id="situacao" name="situacao" value="${projeto.situacao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>-->
                        <select class="form-control input-sm" id="situacao" name="situacao" value="${projeto.situacao}">                                
                            <option <c:if test="${projeto.situacao == 'Aberto'}"> selected </c:if> value="Aberto">Aberto</option>
                            <option <c:if test="${projeto.situacao == 'Em Andamento'}"> selected </c:if> value="Em Andamento">Em Andamento</option>
                            <option <c:if test="${projeto.situacao == 'Encerrado'}"> selected </c:if> value="Encerrado">Encerrado</option>
                        </select>
                    </div>     
                    
                    
                    <div class="form-group col-md-6">
                        <label class="control-label" for="descricao">Descrição:</label>
                        <textarea class="form-control input-sm" rows="8" name="descricao" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>${projeto.descricao} </textarea>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label" for="caracterizacaoProblema">Caracterização do Problema: </label>
                        <textarea class="form-control input-sm" rows="8" name="caracterizacaoProblema" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>${projeto.caracterizacaoProblema} <c:if test="${operacao == 'Excluir'}"> </c:if></textarea>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label" for="referencialTeorico">Referencial Teórico: </label>
                            <textarea class="form-control input-sm" rows="8" name="referencialTeorico" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>${projeto.referencialTeorico} <c:if test="${operacao == 'Excluir'}"> </c:if></textarea>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label" for="objetivos">Objetivos:</label>
                            <textarea class="form-control input-sm" rows="8" name="objetivos" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>${projeto.objetivos} <c:if test="${operacao == 'Excluir'}"> </c:if></textarea>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label" for="metodologia">Metodologia</label>
                            <textarea class="form-control input-sm" rows="8" name="metodologia" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>${projeto.metodologia} <c:if test="${operacao == 'Excluir'}"> </c:if></textarea>
                    </div>                           
                    <div class="form-group col-md-6">
                        <label class="control-label" for="resultadoEsperado">Resultado Esperado:</label>
                            <textarea class="form-control input-sm" rows="8" name="resultadoEsperado" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>${projeto.resultadoEsperado} <c:if test="${operacao == 'Excluir'}"> </c:if></textarea>
                    </div>
                                
                    <div class="form-group col-md-6">
                        <label class="control-label" for="orcamento">Orçamento: </label>
                            <textarea class="form-control input-sm" rows="8" name="orcamento" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>${projeto.orcamento} <c:if test="${operacao == 'Excluir'}"> </c:if></textarea>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label" for="referenciasBibliograficas">Referências bibliográficas: </label>
                            <textarea class="form-control input-sm" rows="8"  name="referenciasBibliograficas" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>${projeto.referenciasBibliograficas} <c:if test="${operacao == 'Excluir'}"> </c:if></textarea>
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
        </div>
        <div class="row rodape">
          &#169; Desenvolvido por: Felipe Cintra Ferraz &amp; Pedro Augusto de A. S. Veloso
        </div>
    </div>
                       
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->
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
        $("#inicio, #fim").mask("00/00/0000",{clearIfNotMatch: true});
        $("#idProjeto").mask("999999"); 
      });
       
    </script>
  </body>
</html>

