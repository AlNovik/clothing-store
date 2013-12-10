<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<script src="${pageContext.request.contextPath}/resources/js/helpers.js"></script>

<div>
    <div class="breadcrumb"><span>Интернет магазин белорусской одежды. Брест / Беларусь.</span></div>

    <div id="products">

    </div>
</div>


<script>
    $(document).ready(function () {
        var page = $("#product-page").html();
        var template = Handlebars.compile(page);
        var data;

        $.getJSON(restLink, function (json) {
            data = json;
            var render = template(data);
            $("#products").html(render);
        })
    });
</script>

<script id="product-page" type="text/x-handlebars-template">
    <div class="well well-small row pagination-sort" style="margin-left: 0">
        <div class="span6">
            {{paginationList totalPages currentPage}}
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
                        <a href="/clothing/page/{{currentPage}}?size=16" class="btn btn-small">16</a>
                        <a href="/clothing/page/{{currentPage}}?size=24" class="btn btn-small">24</a>
                        <a href="/clothing/page/{{currentPage}}?size=32" class="btn btn-small">32</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div class="thumbnails" id="items">
        {{#each clothings}}
        <div class="thumbnail span3">
            <a href="/clothing/{{id}}">
                <img src="" alt="images"></a>
            <h6>{{title}}</h6>
            <span class="badge">{{price}} руб.</span>
            <dl class="dl-horizontal">
                <dt>Фирма :</dt>
                <dd>{{#if brand}}<a href="/brand/{{brand.id}}">{{brand.title}}</a>
                    {{else}}не указано{{/if}}
                </dd>
                <dt>Размер :</dt>
                <dd>{{#if size}}{{#each size}}{{this}},{{/each}}
                    {{else}}не указано{{/if}}
                </dd>
                <dt>Тип :</dt>
                <dd> {{#if category}}{{category.title}}
                    {{else}}не указано{{/if}}
                </dd>
            </dl>
            <%--<p>--%>
            <%--<input type="text" class="input-mini">--%>
            <%--<a class="btn btn-mini btn-primary" href="#"><i class="icon-plus icon-white"></i> В корзину</a>--%>
            <%--<a class="btn btn-mini" href="#">Подробнее</a>--%>
            <%--</p>--%>
        </div>
        {{/each}}
    </div>

    <div class="well well-small row pagination-sort" style="margin-left: 0">
        <div class="span6">
            {{paginationList totalPages currentPage}}
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
                        <a href="/clothing/page/{{currentPage}}?size=16" class="btn btn-small">16</a>
                        <a href="/clothing/page/{{currentPage}}?size=24" class="btn btn-small">24</a>
                        <a href="/clothing/page/{{currentPage}}?size=32" class="btn btn-small">32</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>

</script>



