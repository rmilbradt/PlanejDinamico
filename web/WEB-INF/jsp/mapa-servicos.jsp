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
    <title>Mapa Serviços</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
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

</head>

<body>

<div id="floating-panel">
    <form action="mapa-servicos.html" method="get">
        <input type="date" name="data" value="${param.data}">
        <button type="submit">Filtrar</button>

    </form>

</div>
<div id="map"></div>

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

</html>