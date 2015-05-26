<%-- 
    Document   : adicionarBolsa
    Created on : 07/09/2014, 20:36:11
    Author     : Pedro
--%>
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
                <h2 class="col-md-12">Aluno</h2>
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#dados" data-toggle="tab">Dados Pessoais</a></li>
                    <li><a href="#endereco" data-toggle="tab">Endereço</a></li>
                    <li><a href="#contatos" data-toggle="tab">Contatos</a></li>
                    <li><a href="#documentos" data-toggle="tab">Documentos</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active in" id="dados">
                        <h5>Dados pessoais:</h5>
                        <div class="row">
                        
                            <form action="ManterAlunoController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterAluno" onSubmit="validarFormulario(this)">
                               <div class="form-group col-md-2">
                                   <label class="control-label" for="idAluno">ID Aluno:</label>
                                   <input class="form-control input-sm" type="text" id="idAluno" name="idAluno" value="${aluno.idAluno}" <c:if test="${operacao != 'Incluir'}"> readonly </c:if>/>
                                </div> 
                                <div class="form-group col-md-2">
                                    <label class="control-label" for="matricula">Matricula:</label>
                                    <input class="form-control input-sm" type="text" id="matricula"  name="matricula" value="${aluno.matricula}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if> />
                                </div>
                                <div class="form-group col-md-8">
                                    <label class="control-label" for="curso">Curso:</label>
                                    <select class="form-control input-sm" name="optCurso" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>>
                                    <c:forEach items="${cursos}" var="curso">
                                        <option value="${curso.idCurso}" 
                                            <c:if test="${curso.idCurso == aluno.curso.idCurso}"> selected </c:if>
                                        > ${curso.nome} </option>
                                    </c:forEach>    
                                    </select>
                                </div>
                                <div class="form-group col-md-10">
                                    <label class="control-label" for="nome">Nome:</label>
                                    <input class="form-control input-sm" type="text" id="nome" name="nome" value="${aluno.nome}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>>
                                </div>
                                <div class="form-group col-md-2">
                                    <label class="control-label" for="nasc">Data Nascimento:</label>
                                    <input placeholder="__/__/____" class="form-control input-sm" type="text" id="nasc" name="nascimento" value="${aluno.nascimento}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label" for="natu">Naturalidade:</label>
                                    <input class="form-control input-sm" type="text" id="natu" name="naturalidade" value="${aluno.naturalidade}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                                </div>
                                 <div class="form-group col-md-6">
                                    <label class="control-label" for="nacio">Nacionalidade:</label>
                                    <input class="form-control input-sm" type="text" id="nacio" name="nacionalidade" value="${aluno.nacionalidade}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                                </div>
                                
                            
                        </div>
                    </div>
                    <div class="tab-pane fade" id="endereco">
                        <h5>Endereço:</h5>
                        
                        
                            <div class="form-group col-md-2">
                            <label class="control-label" for="cep">CEP:</label>
                            <input class="form-control input-sm" type="text" id="input-cep" name="cep" value="${aluno.cep}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label" for="end">Logradouro:</label>
                            <input class="form-control input-sm" data-cep="logradouro" type="text" id="end" name="rua" value="${aluno.rua}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                        </div>
                        <div class="form-group col-md-2">
                            <label class="control-label" for="num">Número:</label>
                            <input class="form-control input-sm"  type="text" id="num" name="numero" value="${aluno.numero}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                        </div>
                        <div class="form-group col-md-2">
                            <label class="control-label" for="compl">Complemento:</label>
                            <input class="form-control input-sm" type="text" id="compl" name="complemento" value="${aluno.complemento}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                        </div>
                        
                         <div class="form-group col-md-4">
                            <label class="control-label" for="bairro">Bairro:</label>
                            <input class="form-control input-sm" data-cep="bairro" type="text" id="bairro" name="bairro" value="${aluno.bairro}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label" for="cid">Cidade:</label>
                            <input class="form-control input-sm" data-cep="cidade" type="text" id="cid" name="cidade" value="${aluno.cidade}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label" for="estado">UF:</label>
                            <input type="text" class="form-control input-sm" data-cep="uf" id="estado" name="estado" value="${aluno.estado}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>>                                
                                
                        </div>
                            
                        


                    </div>
                    <div class="tab-pane fade" id="contatos">
                        <h5>Contatos:</h5>
                        
                                <div class="form-group col-md-6">
                                    <label class="control-label" for="email">E-mail:</label>
                                    <input class="form-control input-sm" type="text" id="email" name="email"  value="${aluno.email}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                                </div>
                            <div class="form-group col-md-6">
                                <label class="control-label" for="localTrabalho">Local de Trabalho:</label>
                                <input class="form-control input-sm" type="text" id="localTrabalho" name="localTrabalho"  value="${aluno.localTrabalho}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="telefoneResidencial">Telefone Residencial:</label>
                                <input placeholder="(__) ____-____" class="form-control input-sm telefone" type="text" id="telefoneResidencial" name="telefoneResidencial" value="${aluno.telefoneResidencial}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="cel">Telefone Celular:</label>
                                <input placeholder="(__) ____-____" class="form-control input-sm telefone" type="text" id="cel" name="celular"  value="${aluno.celular}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="telefoneTrabalho">Telefone Comercial:</label>
                                <input placeholder="(__) ____-____" class="form-control input-sm telefone" type="text" id="telefoneTrabalho" name="telefoneTrabalho" value="${aluno.telefoneTrabalho}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                            </div>
                        
                    </div>
                    <div class="tab-pane fade" id="documentos">
                        <h5>Documentos:</h5>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="cpf">CPF:</label>
                                <input class="form-control input-sm" type="text" id="cpf" name="cpf"  value="${aluno.cpf}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="res">Identidade:</label>
                                <input class="form-control input-sm" type="text" id="res" name="identidade"  value="${aluno.identidade}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="situacaoMilitar">Situação Militar:</label>
                                <input class="form-control input-sm" type="text" id="situacaoMilitar" name="situacaoMilitar" value="${aluno.situacaoMilitar}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="certidaoMilitar">Certidão Militar:</label>
                                <input class="form-control input-sm" type="text" id="certidaoMilitar" name="certidaoMilitar" value="${aluno.certidaoMilitar}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                            </div><br>
                            <div class="form-group col-md-8">
                                <label class="control-label" for="banco">Banco:</label>
                                <input class="form-control input-sm" ttype="text" id="banco" name="banco" value="${aluno.banco}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="agencia">Agência:</label>
                                <input class="form-control input-sm" type="text" id="agencia" name="agencia" value="${aluno.agencia}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
                            </div>
                            <div class="form-group col-md-8">
                                <label class="control-label" for="contaCorrente">Conta:</label>
                                <input class="form-control input-sm" type="text" id="contaCorrente" name="contaCorrente" value="${aluno.contaCorrente}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>/>
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
      
   <script src="js/jquery-2.1.4.min.js"></script>

    <!-- Referência do arquivo JS do plugin após carregar o jquery -->
      <!-- Datepicker -->
      <script src="js/bootstrap-datepicker.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.maskedinput.min.js"></script>
    <script src="js/jquery.cep.min.js"></script>
    <script>
      $(document).ready(function () {
        $('#nasc').datepicker({
            format: "dd/mm/yyyy",
            language: "pt-BR"
        });
        $(".telefone").mask("(00) 0000-00009", {clearIfNotMatch: true});
        $("#nasc").mask("00/00/0000", {clearIfNotMatch: true});
        $("#cpf").mask("999.999.999-99");
        $("#idAluno").mask("999999");
        $("#matricula").mask("000000", {clearIfNotMatch: true});
        $('#input-cep').cep();
      }); 
    </script>
  </body>
</html>

