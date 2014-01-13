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

    <ul class="thumbnails listing-products" id="items">
        {{#each clothings}}
        <li class="span3">
            <div class="product-box"><span class="sale_tag"></span>
                <a href="${pageContext.request.contextPath}/clothing/{{id}}">
                    <img src="${pageContext.request.contextPath}/resources/img/assets_images_FANTAZIA_57_1.jpg.ce19723794696a7d450fc4850919c696.jpg"
                         alt="images"></a><br>
                <a class="title" href="${pageContext.request.contextPath}/clothing/{{id}}">{{title}}</a><span> , {{brand.title}}</span><br>
                <a class="category" href="#">{{category.title}}</a>

                <p class="price">{{price}} руб.</p>
            </div>
        </li>
        {{/each}}
    </ul>
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
        $.getJSON(restLink, App.Storage.get('paginationParam'), function (json) {
            data = json;
            var render = template(data);
            $("#products").html(render);
        })
    });

    function paginationCheck() {
        var paginationParam;
        if (App.Storage.get('paginationParam') == null) {
            paginationParam = {
                "size": 16,
                "order": "asc",
                "sortBy": "price"
            };
        } else {
            paginationParam = App.Storage.get('paginationParam');
        }
        App.Storage.save('paginationParam', paginationParam);
    }

    function pagination(param) {
        var paginationParam;
        if (App.Storage.get('paginationParam') == null) {
            paginationParam = {
                "size": 16,
                "order": "asc",
                "sortBy": "price"
            };
        } else {
            paginationParam = App.Storage.get('paginationParam');
        }
        for (var key in param) {
            paginationParam[key] = param[key];
        }
        App.Storage.save('paginationParam', paginationParam);
        document.location = window.location.href;
    }
</script>




