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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../bootstrap/favicon.ico">
    <title>Mapa Serviços</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        #map {
            height: 100%;
        }
        #floating-panel {
            position: absolute;
            top: 10px;
            left: 25%;
            z-index: 5;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
            text-align: center;
            font-family: 'Roboto','sans-serif';
            line-height: 30px;
            padding-left: 10px;
        }
        #floating-panel {
            margin-left: -52px;
        }
    </style>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="all">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" media="all"/>

    <!-- Custom styles for this template -->
    <link href="navbar-fixed-top.css" rel="stylesheet">

</head>

<body>
<!-- Fixed navbar -->
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
            <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="dropdown-header">Nav header</li>
                        <li><a href="#">Separated link</a></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="../navbar/">Default</a></li>
                <li><a href="../navbar-static-top/">Static top</a></li>
                <li class="active"><a href="./">Fixed top <span class="sr-only">(current)</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container">

    <!-- Main component for a primary marketing message or call to action -->
    <div class="jumbotron">
        <h1>Navbar example</h1>
        <p>This example is a quick exercise to illustrate how the default, static and fixed to top navbar work. It includes the responsive CSS and HTML, so it also adapts to your viewport and device.</p>
        <p>To see the difference between static and fixed top navbars, just scroll.</p>
        <p>
            <a class="btn btn-lg btn-primary" href="../../components/#navbar" role="button">View navbar docs &raquo;</a>
        </p>
        <div class="map">
            <div id="floating-panel">
                <form action="mapa-servicos.html" method="get">
                    <input type="date" name="data" value="${param.data}">
                    <button type="submit">Filtrar</button>

                </form>
            </div>
        </div>
    </div>

</div> <!-- /container -->

</body>

<script>
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 12,
            center: {lat: -29.9158509, lng: -51.2495661}
        });
        setMarkers(map);
    }

    var pontos = [
        <c:forEach items="${servicos}" var="servico" varStatus="st">
        ['<b>OS: </b>${servico.numOS}</br>' +
        '<b>Tipo OS: </b>${servico.tipoOS}</br>' +
        '<b>Data Realização: </b>${servico.dataRealizacao}</br>' +
        '<b>Data Prazo: </b>${servico.dataPrazo}</br>' +
        '<b>Latitude: </b>${servico.localizacao.longitude}</br>' +
        '<b>Longitude: </b>${servico.localizacao.latitude}</br>' +
        '<b>Tempo Execução: </b>${servico.tempoExecucao}</br>' +
        '<b>Grupo: </b>${servico.grupo}</br>' +
        '<b>Regulada: </b>${servico.regulada}',
            ${servico.localizacao.longitude}, ${servico.localizacao.latitude}]
        <c:if test="${not st.last}">, </c:if>
        </c:forEach>
    ];

    function setMarkers(map) {
        var infoWindow = new google.maps.InfoWindow();
        for (var i = 0; i < pontos.length; i++) {
            var ponto = pontos[i];
            var marker = new google.maps.Marker({
                position: {lat: ponto[1], lng: ponto[2]},
                map: map,
                animation: google.maps.Animation.DROP,
                info: ponto[0]
            });

            marker.addListener('click', function() {
                infoWindow.setContent(this.info);
                infoWindow.open(map, this);
            });
        }
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?callback=initMap" async defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../bootstrap/js/ie10-viewport-bug-workaround.js"></script>
<div id="map"></div>

</html>