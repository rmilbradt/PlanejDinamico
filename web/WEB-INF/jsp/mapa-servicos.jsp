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
        De <input type="date" name="data" value="${param.data}">
        <%--Para <input type="date" name="dataFinal" value="${param.dataFinal}">--%>
        <button type="submit">Filtrar</button>
        <button id="drop" onclick="drop()">Exibir Marcadores</button>
    </form>

</div>
<div id="map"></div>

    <script>

    // If you're adding a number of markers, you may want to drop them on the map
    // consecutively rather than all at once. This example shows how to use
    // window.setTimeout() to space your markers' animation.

    /*var pontos = [
        <%--<c:forEach items="${servicos}" var="servico" varStatus="st">
        {lat: ${servico.localizacao.latitude}, lng: ${servico.localizacao.longitude}}
        <c:if test="${not st.last}">, </c:if>
        </c:forEach>--%>
    ];

    var map;

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 5,
            center: {lat: -51.16895, lng: -29.9408}
        });
        setMarkers(map);
        function setMarkers() {

            for (var i = 0; i < pontos.length; i++) {
                var p = pontos[i];
                var marker = new google.maps.Marker({
                    position: {lat: p[0], lng: p[1]},
                    map: map
                });
            }
        }
    }*/


    var pontos = [
        <c:forEach items="${servicos}" var="servico" varStatus="st">
        {lat: ${servico.localizacao.longitude}, lng: ${servico.localizacao.latitude}}
        <c:if test="${not st.last}">, </c:if>
        </c:forEach>
    ];

    var markers = [];
    var map;

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 15,
            center: {lat: -29.9408, lng: -51.16895}
        });
    }

    function drop() {
        clearMarkers();
        for (var i = 0; i < pontos.length; i++) {
            addMarkerWithTimeout(pontos[i], i);
        }
    }

    function addMarkerWithTimeout(position, timeout) {
        window.setTimeout(function() {
            markers.push(new google.maps.Marker({
                position: position,
                map: map,
                animation: google.maps.Animation.DROP
            }));
        }, timeout);
    }

    function clearMarkers() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap();
        }
        markers = [];
    }

</script>
<script src="https://maps.googleapis.com/maps/api/js?callback=initMap" async defer></script>


</body>
</html>