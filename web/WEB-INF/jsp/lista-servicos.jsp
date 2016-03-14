<%--
  Created by IntelliJ IDEA.
  User: 201420240
  Date: 14/03/2016
  Time: 09:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista Serviços</title>
</head>
<body>

<form action="carrega-mapa" method="post" enctype="multipart/form-data">
  Selecione o arquivo CSV:
  <input type="file" name="arquivoCSV" id="fileToUpload">
  <input type="submit" value="Enviar Arquivo" name="opcao">
</form>

<table border="1" style="">
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
  <c:forEach items="${servicos}" var="servico">
    <tr>
      <td>${servico.numOS}</td>
      <td>${servico.tipoOS}</td>
      <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${servico.dataRealizacao}"/></td>
      <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${servico.dataPrazo}"/></td>
      <td>${servico.localizacao.latitude}</td>
      <td>${servico.localizacao.longitude}</td>
      <td>${servico.tempoExecucao}</td>
      <td>${servico.grupo}</td>
      <td>${servico.regulada}</td>

    </tr>
  </c:forEach>
</table>

</body>
</html>
