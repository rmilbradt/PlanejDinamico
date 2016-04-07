<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: 201420240
  Date: 14/03/2016
  Time: 09:33
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Lista Serviços</title>

    <style type="text/css">
      .col-md-12 {margin-top: 100px;}
    </style>
</head>
<body>

<div class="container">
  <!-- Main component for a primary marketing message or call to action -->
  <div class="row">

    <div class="col-md-12">
      <form class="form-inline" role="form" action="lista-servicos.html" method="get">
        <h2>Listar Serviços</h2><br/>
        <div class="form-group">
          <input type="date" name="data" value="${param.data}" class="form-control" id="data" />
        </div>
        <button type="submit" class="btn btn-primary">Filtrar</button> <br/><br/><br/>
      </form>

      <table class="table table-striped table-bordered table-responsive">
        <thead>
          <tr>
            <th>Número OS</th>
            <th>Tipo OS</th>
            <th>Data Realização</th>
            <th>Data Prazo</th>
            <th>Latitude</th>
            <th>Longitude</th>
            <th>Tempo Padrão</th>
            <th>Grupo</th>
            <th>Regulada</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${servicos}" var="servico">
          <tr>
            <td>${servico.numOS}</td>
            <td>${servico.tipoOS}</td>
            <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${servico.dataRealizacao}"/></td>
            <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${servico.dataPrazo}"/></td>
            <td>${servico.localizacao.longitude}</td>
            <td>${servico.localizacao.latitude}</td>
            <td>${servico.tempoExecucao}</td>
            <td>${servico.grupo}</td>
            <td>${servico.regulada}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>

    </div>
  </div>

</div>



</body>
</html>
