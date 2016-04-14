<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<%--
  Created by IntelliJ IDEA.
  User: politecnico
  Date: 29/03/2016
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="../bootstrap/favicon.ico">
  <title><decorator:title default="Serviços" /></title>
  <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" media="all"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <%--<script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>--%>
  <decorator:head />

</head>
<body>
<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" style="padding: 0px;"><img src="imagens/aes-sul.jpg" alt="imagem" style="height:100%"></a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="carrega-mapa.html">Upload de Serviços</a></li>
        <li><a href="lista-servicos.html">Listar Serviços</a></li>
        <li><a href="mapa-servicos.html">Exibir Mapa</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>

<decorator:body />

</body>
</html>
