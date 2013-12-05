<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>


<div>
    <div class="breadcrumb"><span>Интернет магазин белорусской одежды. Брест / Беларусь.</span></div>
    <div class="thumbnails" id="items"></div>
</div>

<script>
    $.getJSON(restLink, function (json) {
        catalog(json, '${pageContext.request.contextPath}');
        <%--var rowCount = 0;--%>
        <%--$.each(json.clothings, function (i, book) {--%>
            <%--if (rowCount == 0) {--%>
                <%--$('#items').append('<div class="row-fluid"></div>');--%>
            <%--}--%>
            <%--var item = '<div class="thumbnail span3">' +--%>
                    <%--'<a href="${pageContext.request.contextPath}/clothing/' + this.id + '">' +--%>
                    <%--'<img class="test" src="' + this.images[0].link + '" alt=""></a>' +--%>
                    <%--'<h6>' + this.title + '</h6>' +--%>
                    <%--'<span class="badge">' + this.price + ' руб.</span>' +--%>
                    <%--'<dl class="dl-horizontal">' +--%>
                    <%--'<dt>Фирма :</dt><dd>' + '<a href="${pageContext.request.contextPath}/company/' + this.brand.id + '">' + this.brand.title + '</a></dd>' +--%>
                    <%--'<dt>Размер :</dt><dd>' + arrayToSting(this.size) + '</dd>' +--%>
                    <%--'<dt>Тип :</dt><dd>' + this.category.title + '</dd>' +--%>
                    <%--'</dl><p>' +--%>
                    <%--'<input type="text" class="input-mini">' +--%>
                    <%--'<a class="btn btn-mini btn-primary" href="#"><i class="icon-plus icon-white"></i> В корзину</a>' +--%>
                    <%--'<a class="btn btn-mini" href="#">Подробнее</a>' +--%>
                    <%--'</p></div>';--%>
            <%--if (rowCount < 4) {--%>
                <%--$('#items .row-fluid:last-child').append(item);--%>
                <%--rowCount++;--%>
                <%--if (rowCount == 4) rowCount = 0;--%>
            <%--}--%>
        <%--});--%>
    });



</script>

<style type="text/css">
    .st2 {
        width: 150px;
        height: 150px;
    }

    .st2  img {
        width: 150px;
        height: 150px;
        position: absolute;
        z-index: 150;
    }

    .st2:hover {
        width: 150px;
        height: 150px;
        overflow: visible;
    }

    .st2:hover img {
        visibility: visible;
        position: absolute;
        z-index: 150;
    }
</style>

<script type="text/javascript">
    $(function () {
        $('.thumbnail').hover(function () {
            $(this).children('img').stop().animate({width: "300px", height: "300px"}, 400);
        }, function () {
            $(this).children('img').stop().animate({width: "150px", height: "150px"}, 400);
        });
    });

</script>
<%--<div class="st2">--%>
<%--<div class="img2">--%>
<%--<img src="http://4.bp.blogspot.com/-MMqXthpCFcI/UIfAX1IGRmI/AAAAAAAAB68/v9A7-fSMtQg/s1600/a_bae1912d.jpg"--%>
<%--width="150" height="150"/>--%>
<%--</div>--%>
<%--</div>--%>


