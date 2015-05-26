<%-- 
    Document   : relatoriosParametro
    Created on : 11/03/2015, 08:30:05
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="csp_css.css" type="text/css" rel="stylesheet" />
        <title>SCP - Relatórios com Filtro</title>
    </head>
    <body>
        <h3>Relatórios com Filtro</h3>
            <form action="RelatorioController" method="post">
                Entre com o código do Aluno:
                <input type="text" name="txtCodCurso"/><br/>
                <input type="submit"/>
            </form>
            <form action="RelatorioController" method="post">
                Entre com o codigo do Aluno / Curos:
                <input type="text" name="txtCodCurso"/><br/>
                <input type="submit"/>
            </form>
            <form action="RelatorioController" method="post">
                Entre com o código da Diretoria:
                <input type="text" name="txtCodCurso"/><br/>
                <input type="submit"/>
            </form>
            <form action="RelatorioController" method="post">
                Entre com o código do Edital:
                <input type="text" name="txtCodCurso"/><br/>
                <input type="submit"/>
            </form>
            <form action="RelatorioController" method="post">
                Entre com o código do Edital / Diretoria:
                <input type="text" name="txtCodCurso"/><br/>
                <input type="submit"/>
            </form>
            <form action="RelatorioController" method="post">
                Entre com o código do Projeto Completo:
                <input type="text" name="txtCodCurso"/><br/>
                <input type="submit"/>
            </form>
            <form action="RelatorioController" method="post">
                Entre com o código do Projeto:
                <input type="text" name="txtCodCurso"/><br/>
                <input type="submit"/>
            </form>
            <form action="RelatorioController" method="post">
                Entre com o código do Área:
                <input type="text" name="txtCodCurso"/><br/>
                <input type="submit"/>
            </form>
            <form action="RelatorioController" method="post">
                Entre com o código do Curso:
                <input type="text" name="txtCodCurso"/><br/>
                <input type="submit"/>
            </form>
            <form action="RelatorioController" method="post">
                Entre com o código do Professor:
                <input type="text" name="txtCodCurso"/><br/>
                <input type="submit"/>
            </form>
    </body>
</html>
