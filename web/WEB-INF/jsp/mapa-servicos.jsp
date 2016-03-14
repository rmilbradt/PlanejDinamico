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
    </style>

</head>

<body>
<div id="map"></div>
<script>
    function initMap() {
        var myLatLng = { - 29.6876491, -
        53.8150466
        <%--<c:forEach items="${servicos}" var="servico">
    {${servico.localizacao.latitude},${servico.localizacao.longitude}}
        </c:forEach>
        <c:if test="${not servico.last}">, </c:if>--%>
    };

        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 4,
            center: myLatLng
        });

        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: 'Hello World!'
        });
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?callback=initMap" async defer></script>

<%--
<c:forEach items="${servicos}" var="servico">
    ${servico.id}, ${servico.localizacao.latitude}, ${servico.localizacao.longitude}<br/>
</c:forEach>
--%>

</body>
</html>