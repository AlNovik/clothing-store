<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>


<div>
    <div class="breadcrumb"><span>Интернет магазин белорусской одежды. Брест / Беларусь.</span></div>

    <div class="well well-small row pagination-sort" style="margin-left: 0"></div>

    <div class="thumbnails" id="items"></div>
</div>


<script>
    $(document).ready(function () {
        var pagination = $("#pagination-sort").html();
        var template = Handlebars.compile(pagination);
        var paginationData;

        $.getJSON(restLink, function (json) {
            paginationData = json;
            var html = template(paginationData);
        })
    });
</script>


<script id="product-item" type="text/x-handlebars-template">
    <div class="thumbnail span3">
        <a href="/clothing/{{id}}">
            <img class="test" src="" alt=""></a>
        <h6>{{title}}</h6>
        <span class="badge">{{price}} руб.</span>
        <dl class="dl-horizontal">
            <dt>Фирма :</dt>
            <dd><a href="/brand/{{brand.id}}">{{brand.title}}</a></dd>
            <dt>Размер :</dt>
            <dd> arrayToSting(this.size)</dd>
            <dt>Тип :</dt>
            <dd> {{category.title}}</dd>
        </dl>
        <p>
            <input type="text" class="input-mini">
            <a class="btn btn-mini btn-primary" href="#"><i class="icon-plus icon-white"></i> В корзину</a>
            <a class="btn btn-mini" href="#">Подробнее</a>
        </p></div>
</script>

<script id="pagination-sort" type="text/x-handlebars-template">
    <div class="span6">
        <div class="pagination pagination-small">
            <ul class="nav">
                <li><a href="/clothing/page/{{currentPage-1}}">Prev</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="/clothing/page/{{currentPage+1}}">Next</a></li>
            </ul>
        </div>
    </div>
    <div class="span6">
        <ul class="nav pull-right" style="margin-bottom: 0">
            <li>
                <div class="btn-group" data-toggle="buttons-radio">
                    <button type="button" class="btn btn-small"><i class="icon-arrow-up"></i></button>
                    <button type="button" class="btn btn-small"><i class="icon-arrow-down"></i></button>
                </div>
            </li>
            <li>
                <select class="span12" style="margin-bottom: 0">
                    <option>По цене</option>
                    <option>По новизне</option>
                    <option>По модели</option>
                </select>
            </li>
            <li>
                <div class="btn-group" data-toggle="buttons-radio">
                    <button type="button" class="btn btn-small">16</button>
                    <button type="button" class="btn btn-small">24</button>
                    <button type="button" class="btn btn-small">32</button>
                </div>
            </li>
        </ul>
    </div>
</script>



