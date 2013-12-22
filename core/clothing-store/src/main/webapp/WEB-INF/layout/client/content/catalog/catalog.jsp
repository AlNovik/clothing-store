<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<div id="products">
</div>

<script id="product-list" type="text/x-handlebars-template">

    {{#if properties}}
    {{> products-group}}
    {{else}}
    <div class="breadcrumb"><span>Интернет магазин белорусской одежды. Брест / Беларусь.</span></div>
    {{/if}}

    {{> pagination-line}}

    <div class="thumbnails" id="items">
        {{#each clothings}}
        <div class="thumbnail span3">
            <a href="${pageContext.request.contextPath}/clothing/{{id}}">
                <img src="" alt="images"></a>
            <h6>{{title}}</h6>
            <span class="badge">{{price}} руб.</span>
            <dl class="dl-horizontal">
                <dt>Фирма :</dt>
                <dd>{{#if brand}}<a href="/catalog/brand/{{brand.id}}">{{brand.title}}</a>
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
        </div>
        {{/each}}
    </div>
    {{> pagination-line}}
</script>

<script id="pagination-line" type="text/x-handlebars-template">
    <div class="well well-small row pagination-sort" style="margin-left: 0">
        <div class="span6">
            {{paginationList totalPages currentPage}}
        </div>
        <div class="span6">
            <ul class="nav pull-right" style="margin-bottom: 0">
                <li>
                    <div class="btn-group" data-toggle="buttons-radio">
                        <button type="button" class="btn btn-mini" onclick="pagination({order:'desc'})"><i
                                class="icon-arrow-down"></i></button>
                        <button type="button" class="btn btn-mini" onclick="pagination({order:'asc'})"><i
                                class="icon-arrow-up"></i></button>
                    </div>
                </li>
                <li>
                    <select class="span12" style="margin-bottom: 0"
                            onchange="pagination({sortBy:this.options[this.selectedIndex].value})">
                        <option>Сортировка</option>
                        <option value="price">По цене</option>
                        <option>По новизне</option>
                        <option value="title">По модели</option>
                    </select>
                </li>
                <li>
                    <div class="btn-group" data-toggle="buttons-radio">
                        <button class="btn btn-mini" onclick="pagination({size:16})">16</button>
                        <button class="btn btn-mini" onclick="pagination({size:24})">24</button>
                        <button class="btn btn-mini" onclick="pagination({size:32})">32</button>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</script>

<script id="products-group" type="text/x-handlebars-template">
    <div class="well">
        <h4 align="center">{{properties.type}} : {{properties.description.title}}</h4>

        <b>Описание:</b>

        <p></p>
    </div>
</script>


<script>

    $(document).ready(function () {
        var template = Handlebars.compile($("#product-list").html());
        Handlebars.registerPartial("pagination-line", $("#pagination-line").html());
        Handlebars.registerPartial("products-group", $("#products-group").html());
        var data;
        paginationCheck();
        $.getJSON(restLink, $.evalJSON($.cookie('paginationParam')), function (json) {
            data = json;
            var render = template(data);
            $("#products").html(render);
        })
    });

    function paginationCheck() {
        var paginationParam;
        if ($.cookie('paginationParam') == null) {
            paginationParam = {
                "size": 16,
                "order": "asc",
                "sortBy": "price"
            };
        } else {
            paginationParam = $.evalJSON($.cookie('paginationParam'));
        }
        $.cookie('paginationParam', $.toJSON(paginationParam), { expires: 28, path: '/'});
    }

    function pagination(param) {
        var paginationParam;
        if ($.cookie('paginationParam') == null) {
            paginationParam = {
                "size": 16,
                "order": "asc",
                "sortBy": "price"
            };
        } else {
            paginationParam = $.evalJSON($.cookie('paginationParam'));
        }
        for (var key in param) {
            paginationParam[key] = param[key];
        }
        $.cookie('paginationParam', $.toJSON(paginationParam), { expires: 28, path: '/'});

        document.location = window.location.href;
    }
</script>




