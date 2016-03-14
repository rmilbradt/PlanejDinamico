<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: politecnico
  Date: 14/03/2016
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="carrega-mapa.html" method="post" enctype="multipart/form-data">
        Selecione o arquivo CSV:
        <input type="file" name="arquivoCSV" id="fileToUpload">
        <input type="submit" value="Enviar Arquivo" name="opcao">
    </form>
    <c:if test="${not empty servicos}" >
        ${fn:length(servicos)} serviços carregados com sucesso!
    </c:if>
</body>
</html>
