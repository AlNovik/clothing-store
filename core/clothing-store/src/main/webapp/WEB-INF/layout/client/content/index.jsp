<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<div id="slider" class="nivoSlider">
    <img src="${pageContext.request.contextPath}/resources/img/carousel/deprives-you-of-tangibility.jpg" alt=""/>
    <a href="http://dev7studios.com"><img src="${pageContext.request.contextPath}/resources/img/carousel/Holiday-Shopping-online.jpg" alt=""
                                          title="#htmlcaption"/></a>
    <img src="${pageContext.request.contextPath}/resources/img/carousel/promo-products-page-banner.gif" alt="" title="А у нас сегодня ОГРОМНЫЕ скидки"/>
</div>
<div id="htmlcaption" class="nivo-html-caption">
    Сегодня со скидкой можно купить <a href="${pageContext.request.contextPath}/clothing/262147">ЭТОТ</a> товар.
</div>

<script type="text/javascript">
    $(window).load(function () {
        $('#slider').nivoSlider({
            slices: 15,                     // For slice animations
            pauseTime: 5000,                // How long each slide will show
            directionNav: false,             // Next & Prev navigation
            controlNav: false               // 1,2,3... navigation
        });
    });
</script>

<div id="popular-product">

</div>

<div id="new-product">

</div>

<section class="our_client">
    <h4 class="title"><span class="text">Производители</span></h4>

    <div class="row">
        <div class="span2">
            <a href="#"><img alt="" src="${pageContext.request.contextPath}/resources/img/clients/30.png"></a>
        </div>
        <div class="span2">
            <a href="#"><img alt="" src="${pageContext.request.contextPath}/resources/img/clients/35.png"></a>
        </div>
        <div class="span2">
            <a href="#"><img alt="" src="${pageContext.request.contextPath}/resources/img/clients/11.png"></a>
        </div>
        <div class="span2">
            <a href="#"><img alt="" src="${pageContext.request.contextPath}/resources/img/clients/22.png"></a>
        </div>
        <div class="span2">
            <a href="#"><img alt="" src="${pageContext.request.contextPath}/resources/img/clients/8.png"></a>
        </div>
        <div class="span2">
            <a href="#"><img alt="" src="${pageContext.request.contextPath}/resources/img/clients/16.png"></a>
        </div>
    </div>
</section>

<script>
    $(document).ready(function () {
        App.Templates.promBlock = Handlebars.compile($("#promo-block").html());
        $.getJSON(App.Rest.link + '/clothing', function (data) {
            $("#popular-product").html(App.Templates.promBlock(data));
            $("#new-product").html(App.Templates.promBlock(data));
            paramPromo('popular-product', 'Популярные товары', 'popular-carousel');
            paramPromo('new-product', 'Новинки', 'new-carousel');
        });
    });

    function paramPromo(container, title, carousel) {
        $('#' + container + ' .title .text').html(title);
        $('#' + container + ' .title a').attr('href', '#' + carousel);
        $('#' + container + ' .carousel').attr('id', carousel);
        $('#' + carousel + ' .item:first').addClass('active');
    }
</script>

<script id="promo-block" type="text/x-handlebars-template">
    <h4 class="title">
        <span class="pull-left">
            <span class="text"></span>
        </span>
		<span class="pull-right">
			<a data-slide="prev" href="" class="left button"></a>
            <a data-slide="next" href="" class="right button"></a>
		</span>
    </h4>

    <div class="carousel slide" id="">
        <div class="carousel-inner">
            {{promo-product clothing}}
        </div>
    </div>
</script>