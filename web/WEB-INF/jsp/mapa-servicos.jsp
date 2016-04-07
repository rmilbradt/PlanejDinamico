<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
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
    <style type="text/css">
        .col-md-12 {margin-top: 50px;}
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
            z-index: 5;
            /*margin-left: -52px;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
            text-align: center;
            line-height: 30px;
            padding-left: 10px;*/
        }
        .col-xs-12, .col-sm-12, .col-lg-12 {
            margin-top: 50px;
        }


    </style>
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
                '<b>Data Realização: </b><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${servico.dataRealizacao}"/></br>' +
                '<b>Data Prazo: </b><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${servico.dataPrazo}"/></br>' +
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

</head>

<body>

<div class="container">
    <!-- Main component for a primary marketing message or call to action -->
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-lg-12">

            <div id="floating-panel">
                <form class="form-inline" role="form" action="mapa-servicos.html" method="get">
                    <div class="form-group">
                        <label><b>Filtre por data: </b></label>
                        <input type="date" name="data" value="${param.data}" class="form-control" id="data" />
                    </div>
                    <button type="submit" class="btn btn-primary">Filtrar</button><br/><br/>
                </form>
            </div>
        </div>
    </div>

</div> <!-- /container -->

<div id="map"></div><script src="https://maps.googleapis.com/maps/api/js?callback=initMap" async defer></script>

</body>


</html>