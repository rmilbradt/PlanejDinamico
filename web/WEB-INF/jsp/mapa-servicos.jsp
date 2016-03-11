<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: politecnico
  Date: 10/06/2015
  Time: 10:24
  To change this template use File | Settings | File Templates.

  leitura.jsp

--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="carrega-mapa" method="post" enctype="multipart/form-data">
    Selecione o arquivo CSV:
    <input type="file" name="arquivoCSV" id="fileToUpload">
    <input type="submit" value="Enviar Arquivo" name="opcao">
</form>

<table>
    <tr>
        <td>Número OS</td>
        <td>Tipo OS</td>
        <td>Data Realização</td>
        <td>Data Prazo</td>
        <td>Latitude</td>
        <td>Longitude</td>
        <td>Tempo Padrão</td>
        <td>Grupo</td>
        <td>Regulada</td>
    </tr>
    <tr>
        <c:forEach items="${servicos}" var="servico">
            <td>${servico.numOS}</td>
            <td>${servico.tipoOS}</td>
            <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${servico.dataRealizacao}"/></td>
            <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${servico.dataPrazo}"/></td>
            <td>${servico.localizacao.latitude}</td>
            <td>${servico.localizacao.longitude}</td>
            <td>${servico.tempoExecucao}</td>
            <td>${servico.grupo}</td>
            <td>${servico.regulada}</td>
        </c:forEach>
    </tr>
</table>

</body>
</html>