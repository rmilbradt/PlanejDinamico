<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: politecnico
  Date: 14/03/2016
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Upload de Serviços</title>
    <style type="text/css">
        .col-md-12 {margin-top: 100px;}
    </style>
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form class="form-inline" action="carrega-mapa.html" method="post" enctype="multipart/form-data" role="form">
                    <h2>Upload de Serviços</h2><br/>
                    <label for="fileToUpload">Selecione o arquivo CSV:</label>
                    <input class="form-control" type="file" name="arquivoCSV" id="fileToUpload">
                    <button type="submit" class="btn btn-primary">Enviar Arquivo</button>
                </form>

                <c:if test="${not empty servicos}" >
                    <h4>${fn:length(servicos)} serviços carregados com sucesso!</h4>
                </c:if>
            </div>
        </div>

    </div>
</body>
</html>
