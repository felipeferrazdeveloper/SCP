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
    <link href="css/bootstrap-datepicker.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/style.css" rel="stylesheet">
  </head>
  <body>
     
<!--<input type="text" class="form-control" id="date">-->

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
                <h2 class="col-md-12">Professor</h2>
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#dados" data-toggle="tab">Dados Pessoais</a></li>
                    <li><a href="#contatos" data-toggle="tab">Contatos</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active in" id="dados">
                        <h5>Dados pessoais:</h5>
                        <div class="row">
                            <form action="ManterProfessorController?acao=confirmarOperacao&operacao=${operacao}" 
                                  method="post" name="frmManterProfessor" >
                                
                            <div class="form-group col-md-4">
                                <label class="control-label" for="idProfessor" id="id">idProfessor:</label>
                                <input class="form-control input-sm" type="text" id="idProfessor" name="idProfessor" value="${professor.idProfessor}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>/>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="siape" id="sape">Siape:</label>
                                <input class="form-control input-sm" type="text" id="siape" name="siape" value="${professor.siape}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="CPF"  id="cpf">CPF:</label>
                                <input class="form-control input-sm" type="text" id="CPF" name="CPF" value="${professor.cpf}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="control-label" for="Nome" id="nome">Nome:</label>
                                <input class="form-control input-sm" type="text" id="Nome" name="Nome" value="${professor.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="data_nascimento" id="dataNascimento">Data de Nascimento:</label>
                                <input placeholder="__/__/____" class="form-control input-sm" type="text" id="Data_Nascimento" name="Data_Nascimento" value="${professor.dataNascimento}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                            </div>                          
                            <div class="form-group col-md-4">
                                <label class="control-label" for="Nacionalidade" id="nacionalide">Nacionalidade:</label>
                                <input class="form-control input-sm" type="text" id="Nacionalide" name="Nacionalide" value="${professor.nacionalide}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="Cidade" id="cidade">Cidade:</label>
                                <input class="form-control input-sm" id="Cidade" type="text" name="Cidade" value="${professor.cidade}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            </div>
                        </div> 
                    </div>
                    <div class="tab-pane fade" id="contatos">
                        <h5>Contatos:</h5>
                        <div class="form-group col-md-8">
                            <label class="control-label" for="HomePage" id="homePage">Home page do curriculo lattes:</label>
                            <input class="form-control input-sm" type="text" id="HomePage" name="HomePage" value="${professor.homePage}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label" for="Campus" id="campus">Campus:</label>
                            <input class="form-control input-sm" type="text" id="Campus" name="Campus" value="${professor.campus}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>                            
<!--                            <select class="form-control input-sm" id="Campus" value="${professor.campus}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>>
                                    <option <c:if test="${professor.campus == 'juizDeFora'}"> selected </c:if> value="juizDeFora">Juiz de Fora</option>
                                    <option <c:if test="${professor.campus == 'rioPomba'}"> selected </c:if> value="rioPomba">Rio Pomba</option>
                                    <option <c:if test="${professor.campus == 'saoJoaoDelRei'}"> selected </c:if> value="saoJoaoDelRei">São João Del Rey</option>
                                    <option <c:if test="${professor.campus == 'muriae'}"> selected </c:if> value="muriae">Muriaé</option>
                                    <option <c:if test="${professor.campus == 'santosDumont'}"> selected </c:if> value="santosDumont">Santos Dumont</option>
                            </select>-->
                            <!--<input class="form-control input-sm" type="text" id="Campus" name="Campus" value="${professor.campus}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>-->
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label" for="Email" id="email">Email:</label>
                            <input class="form-control input-sm" type="text" id="Email" name="Email" value="${professor.email}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                        </div>
                        
                        <div class="form-group col-md-4">                                               
                            <label class="control-label" for="Telefone_Residencial" id="residencial">Residencial:</label>
                            <input class="form-control input-sm" type="text" id="Telefone_Residencial" name="Telefone_Residencial" value="${professor.telefoneResidencial}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label" for="Celular" id="ceular">Celular:</label>
                            <input class="form-control input-sm" type="text" id="Celular" name="Celular" value="${professor.celular}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>/>
                        </div>
                    </div>
                    <button type="button" class="btn btn-default" onclick="window.history.go(-1)">Cancelar</button>
                    <input type="submit" value="${operacao}" 
                        <c:if test="${operacao == 'Excluir'}">class="btn btn-danger"</c:if>
                        <c:if test="${operacao == 'Incluir'}">class="btn btn-success"</c:if>
                        <c:if test="${operacao == 'Editar'}">class="btn btn-warning"</c:if>
                    </input>
                </form>
                </div>
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
        $('#Data_Nascimento').datepicker({
            format: "dd/mm/yyyy",
            language: "pt-BR"
        });
        $("#Telefone_Residencial, #Celular").mask("(00) 0000-00009", {clearIfNotMatch: true});
        $("#Data_Nascimento").mask("00/00/0000", {clearIfNotMatch: true});
        $("#CPF").mask("000.000.000-00", {clearIfNotMatch: true});
        $("#idProfessor").mask("999999");
        $("#siape").mask("000000", {clearIfNotMatch: true});
        
      });
       
    </script>
      
  </body>
</html>
                        