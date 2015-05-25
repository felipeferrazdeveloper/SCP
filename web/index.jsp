<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <form class="form-horizontal">
                    <fieldset class="formularioLogin">
                        <legend>Seja bem vindo!</legend>
                        
                        <div class="form-group">
                            <label for="inputEmail" class="col-lg-2 control-label">Login</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" id="inputEmail" placeholder="Login">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword" class="col-lg-2 control-label">Senha</label>
                            <div class="col-lg-4">
                                <input type="password" class="form-control" id="inputPassword" placeholder="Senha">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <button type="submit" class="btn btn-primary">Entrar</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        </div>
      <div class="row rodape">
          &#169; Desenvolvido por: Felipe Cintra Ferraz &amp; Pedro Augusto de A. S. Veloso
      </div>
    </div>
      
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
