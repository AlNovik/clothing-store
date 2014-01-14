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
                    <img src="${pageContext.request.contextPath}/resources/img/assets_images_FANTAZIA_57_1.jpg"
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
        <div class="span7">
            <div class="pagination-line"></div>
        </div>
        <div class="span5">
            <div>
                <span>Сортировать по : </span>
                <div class='pagin-sort'></div>
                <span onclick="pagination({sortBy:'price'})">цене</span>
                <span onclick="pagination({sortBy:'title'})">модели</span>
                <br>
                <span>Количество : </span>
                <span onclick="pagination({size:16})">16</span>
                <span onclick="pagination({size:24})">24</span>
                <span onclick="pagination({size:32})">32</span>
            </div>
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

<script src="/resources/jQuery/js/bootstrap-paginator.min.js"></script>
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
            var pagin = {
                currentPage: json.currentPage,
                totalPages: json.totalPages,
                pageUrl: function (type, page, current) {
                    var curUrl = window.location.href;
                    var url = '';
                    if (curUrl.indexOf('page') + 1) {
                        var ind = curUrl.lastIndexOf('/');
                        console.info(ind);
                        url = curUrl.slice(0, ind + 1) + page;

                    } else {
                        url = curUrl + '/page/' + page;
                    }
                    return url;
                },
                tooltipTitles: function (type, page, current) {
                    switch (type) {
                        case "first":
                            return "Первая страница";
                        case "prev":
                            return "Предыдущая страница";
                        case "next":
                            return "Следующая страница";
                        case "last":
                            return "Последняя страница";
                        case "page":
                            return page === current ? "Текущая страница " + page : "Перейти на страницу " + page;
                    }
                },
                useBootstrapTooltip: true,
                size: 'small'
            };
            $('#products .pagination-line').bootstrapPaginator(pagin);
            App.Storage.get('paginationParam').order == "asc" ? $('#products .pagin-sort').html("<img src='/resources/img/sort-desc.png' onclick=pagination({order:'desc'})>") : $('#products .pagin-sort').html("<img src='/resources/img/sort-asc.png' onclick=pagination({order:'asc'})>");

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




