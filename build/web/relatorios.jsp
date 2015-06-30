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
                
               <div align="left" class="tabela">
            <h3>Relatório sem parâmetro: </h3>
            <ul style="list-style-type:circle">
                <li><a href="RelatorioAlunoController">Aluno</a></li>
                <li><a href="RelatorioAlunoCursoController">Aluno / Curso</a></li>
                <li><a href="RelatorioDiretoriaController">Diretoria</a></li>
                <li><a href="RelatorioEditalController">Edital</a></li>
                <li><a href="RelatorioEditalDiretoriaController">Edital / Diretoria</a></li>
                <li><a href="RelatorioProjetoController">Projeto</a></li>
                <li><a href="RelatorioAreaController">Área</a></li>
                <li><a href="RelatorioCursoController">Curso</a></li>
                <li><a href="RelatorioProfessorController">Professor</a></li>
            </ul>
            <div class="row">
            <h3>Relatório com parâmetro: </h3>

            Reletório de 

            <select class="form-control input-sm col-md-4" id="combo1" onchange="alteraCombo2(this.value);">
                <option>Selecione...</option>
                <option value="Aluno">Alunos</option>
                <option value="Edital">Editais</option>
                <option value="Projeto">Projetos</option>
            </select>

            do
            <select class="form-control input-sm col-md-4" id="combo2" onchange="alteraCombo3(this.value);">

            </select>

            referente a

            <select class="form-control input-sm col-md-4" id="combo3" onchange="alteraLink(this.value);">

            </select>
               </div>
            <script type="text/javascript">
                function alteraCombo2(valor) {
                    document.getElementById("combo2").options.length = 0;
                    switch (valor) {

                        case "Aluno" :

                            var o = document.createElement("option");
                            o.setAttribute("value", "");
                            var t = document.createTextNode("Selecione...");
                            o.appendChild(t);
                            document.getElementById("combo2").appendChild(o);

                            var o = document.createElement("option");
                            o.setAttribute("value", "Curso");
                            var t = document.createTextNode("Curso");
                            o.appendChild(t);
                            document.getElementById("combo2").appendChild(o);

                            var o = document.createElement("option");
                            o.setAttribute("value", "Projeto");
                            var t = document.createTextNode("Projeto");
                            o.appendChild(t);
                            document.getElementById("combo2").appendChild(o);

                            break;

                        case "Projeto" :
                            var o = document.createElement("option");
                            o.setAttribute("value", "");
                            var t = document.createTextNode("Selecione...");
                            o.appendChild(t);
                            document.getElementById("combo2").appendChild(o);

                            var o = document.createElement("option");
                            o.setAttribute("value", "Edital");
                            var t = document.createTextNode("Edital");
                            o.appendChild(t);
                            document.getElementById("combo2").appendChild(o);

                            var o = document.createElement("option");
                            o.setAttribute("value", "Professor");
                            var t = document.createTextNode("Professor");
                            o.appendChild(t);
                            document.getElementById("combo2").appendChild(o);

                            var o = document.createElement("option");
                            o.setAttribute("value", "Aluno");
                            var t = document.createTextNode("Aluno");
                            o.appendChild(t);
                            document.getElementById("combo2").appendChild(o);
                            break;

                        case "Edital" :

                            var o = document.createElement("option");
                            o.setAttribute("value", "");
                            var t = document.createTextNode("Selecione...");
                            o.appendChild(t);
                            document.getElementById("combo2").appendChild(o);

                            var o = document.createElement("option");
                            o.setAttribute("value", "Diretoria");
                            var t = document.createTextNode("Diretoria");
                            o.appendChild(t);
                            document.getElementById("combo2").appendChild(o);

                            break;
                    }
                }


                function alteraCombo3(valor) {

                    document.getElementById("combo3").options.length = 0;
                    switch (valor) {

                        case "Curso" :

                            var a = document.createElement("option");
                            a.setAttribute("value", "");
                            var b = document.createTextNode("Selecione...");
                            a.appendChild(b);
                            document.getElementById("combo3").appendChild(a);

                <c:forEach items="${cursos}" var="curso">
                            var o = document.createElement("option");
                            o.setAttribute("value", "${curso.idCurso}");
                            var t = document.createTextNode("${curso.nome}");
                            o.appendChild(t);
                            document.getElementById("combo3").appendChild(o);
                </c:forEach>

                            break;

                        case "Projeto" :

                            var a = document.createElement("option");
                            a.setAttribute("value", "");
                            var b = document.createTextNode("Selecione...");
                            a.appendChild(b);
                            document.getElementById("combo3").appendChild(a);

                <c:forEach items="${projetos}" var="projeto">
                            var o = document.createElement("option");
                            o.setAttribute("value", "${projeto.idProjeto}");
                            var t = document.createTextNode("${projeto.nome}");
                            o.appendChild(t);
                            document.getElementById("combo3").appendChild(o);
                </c:forEach>

                            break;

                        case "Diretoria" :

                            var a = document.createElement("option");
                            a.setAttribute("value", "");
                            var b = document.createTextNode("Selecione...");
                            a.appendChild(b);
                            document.getElementById("combo3").appendChild(a);

                <c:forEach items="${diretorias}" var="diretoria">
                            var o = document.createElement("option");
                            o.setAttribute("value", "${diretoria.idDiretoria}");
                            var t = document.createTextNode("${diretoria.nome}");
                            o.appendChild(t);
                            document.getElementById("combo3").appendChild(o);
                </c:forEach>

                            break;

                        case "Edital" :

                            var a = document.createElement("option");
                            a.setAttribute("value", "");
                            var b = document.createTextNode("Selecione...");
                            a.appendChild(b);
                            document.getElementById("combo3").appendChild(a);

                <c:forEach items="${editais}" var="edital">
                            var o = document.createElement("option");
                            o.setAttribute("value", "${edital.idEdital}");
                            var t = document.createTextNode("${edital.numero}");
                            o.appendChild(t);
                            document.getElementById("combo3").appendChild(o);
                </c:forEach>

                            break;

                        case "Professor" :

                            var a = document.createElement("option");
                            a.setAttribute("value", "");
                            var b = document.createTextNode("Selecione...");
                            a.appendChild(b);
                            document.getElementById("combo3").appendChild(a);

                <c:forEach items="${professores}" var="professor">
                            var o = document.createElement("option");
                            o.setAttribute("value", "${professor.idProfessor}");
                            var t = document.createTextNode("${professor.siape}");
                            o.appendChild(t);
                            document.getElementById("combo3").appendChild(o);
                </c:forEach>

                            break;

                        case "Aluno" :

                            var a = document.createElement("option");
                            a.setAttribute("value", "");
                            var b = document.createTextNode("Selecione...");
                            a.appendChild(b);
                            document.getElementById("combo3").appendChild(a);

                <c:forEach items="${alunos}" var="aluno">
                            var o = document.createElement("option");
                            o.setAttribute("value", "${aluno.idAluno}");
                            var t = document.createTextNode("${aluno.matricula}");
                            o.appendChild(t);
                            document.getElementById("combo3").appendChild(o);
                </c:forEach>

                            break;

                    }
                }

                function alteraLink(valor) {

                    document.getElementById("link").href = "#";
                    var e = document.getElementById("combo2");
                    var PAR = e.options[e.selectedIndex].text;

                    var a = document.getElementById("combo1");
                    var relatorio = a.options[a.selectedIndex].value;

                    if (valor != null)
                        document.getElementById("link").href = "RelatorioParametro" + relatorio + "Controller?valorParametro=" + valor + "&PAR=id" + PAR;
                }

            </script>  
            <br/>
            <a name="link" id="link" href="#" class="btn btn-info">Gerar relatório</a>

        </div>
              
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
        

    </body>
</html>
