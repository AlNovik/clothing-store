<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<form class="form-search" id="search-title">
    <label for="title"> Модель </label>

    <div class="input-append">
        <input type="text" class="span6 search-query" id="title" autocomplete="off" name="title">
        <button type="submit" class="btn">Найти</button>
    </div>
</form>

<form method="POST">
    <div class="breadcrumb"><span>Расширенный поиск</span></div>
    <div class="search-box">

        <div class="search-size-block">
            <div class="well well-small search-block-header">
                <span>Размеры</span>

                <div class="btn-group pull-right" data-toggle="buttons-radio">
                    <button type="button" class="btn btn-mini" name="radio-size" id="size-all" value="all">Все</button>
                    <button type="button" class="btn btn-mini" name="radio-size" id="size-select" value="select">Выбрать
                    </button>
                </div>
            </div>
            <div id="search-size-checkbox" class="control-group checkbox-block">

            </div>
        </div>
        <div class="search-height-block">
            <div class="well well-small search-block-header">
                <span>Рост</span>
            </div>
            <div class="height-checkbox checkbox-block">
                <label class="checkbox inline">
                    <input class="height_ch" type="checkbox" value="height_164" name="height_164">164
                </label>
                <label class="checkbox inline">
                    <input class="height_ch" type="checkbox" value="height_170" name="height_170">170
                </label>
            </div>
        </div>
        <div class="search-category-block">
            <div class="well well-small search-block-header">
                <span>Тип одежды</span>

                <div class="btn-group pull-right" data-toggle="buttons-radio">
                    <button type="button" class="btn btn-mini" name="radio-category" id="category-all" value="all">Все
                    </button>
                    <button type="button" class="btn btn-mini" name="radio-category" id="category-select"
                            value="select">
                        Выбрать
                    </button>
                </div>
            </div>

            <div id="search-category-checkbox" class="checkbox-block"></div>
        </div>
        <div class="search-brand-block">
            <div class="well well-small search-block-header">
                <span>Производители</span>

                <div class="btn-group pull-right" data-toggle="buttons-radio">
                    <button type="button" class="btn btn-mini" name="radio-brand" id="brand-all" value="all">
                        Все
                    </button>
                    <button type="button" class="btn btn-mini" name="radio-brand" id="brand-select" value="select">
                        Выбрать
                    </button>
                </div>
            </div>

            <div id="search-brand-checkbox" class="checkbox-block"></div>
        </div>
        <button type="submit" class="btn btn-block">Искать</button>
    </div>
</form>


<script>
    $(document).ready(function () {
        searchBar();
        searchModel();
    });

    function searchBar() {
        <%-- Блок выбора размеров--%>
        var sizeBlock = $("#search-size-checkbox-block").html();
        var templateSizeBlock = Handlebars.compile(sizeBlock);
        $('#search-size-checkbox').html(templateSizeBlock);
        <%-- Блок выбора категорий --%>
        var categoryBlock = $('#search-category-checkbox-block').html();
        var templateCategoryBlock = Handlebars.compile(categoryBlock);
        var categoryData;
        $.getJSON(appLink + '/rest/category', function (data) {
            categoryData = data;
            var renderCategory = templateCategoryBlock(categoryData);
            $('#search-category-checkbox').html(renderCategory);
        });
        <%-- Блок выбора производителя --%>
        var brandBlock = $('#search-brand-checkbox-block').html();
        var templateBrandBlock = Handlebars.compile(brandBlock);
        var brandData;
        $.getJSON(appLink + '/rest/brand', function (data) {
            brandData = data;
            var renderBrand = templateBrandBlock(brandData);
            $('#search-brand-checkbox').html(renderBrand);
        });
    }

    function searchModel() {
        var form = $('#search-title').serialize();
        var options = {
            url: restLink + '/search'
        };
        $("#search-title").submit(function () {
            var param = $('#search-title').serialize();
            var url = '${pageContext.request.contextPath}/rest/search';
            $.get(url, param,
                    function (items) {
                        alert(items.clothing.length);
//                    window.location.replace(appLink + "/clothing/" + item.clothing[0].id);
                    },
                    'json'
            );
        });
        $('#title').typeahead({
            source: function (title, process) {
                return $.get('${pageContext.request.contextPath}/rest/search/model', { title: title }, function (data) {
                    return process(data.title);
                });
            },
            //вывод данных в выпадающем списке
            //действие, выполняемое при выборе елемента из списка
            updater: function (title) {
                $.get('${pageContext.request.contextPath}/rest/search', {'title': title},
                        function (item) {
                            window.location.replace(appLink + "/clothing/" + item.clothing[0].id);
                        },
                        'json'
                );
            }
            //действие, выполняемое при выборе елемента из списка
        });
    }
</script>


<%-- Шаблоны --%>
<script id="search-size-checkbox-block" type="text/x-handlebars-template">
    <div class="controls">
        {{select-size-checkbox}}
    </div>
</script>

<script id="search-category-checkbox-block" type="text/x-handlebars-template">
    {{#each categories}}
    <label class="checkbox check-item">
        <input class="category_ch" type="checkbox" value="category_{{id}}" name="category_{{id}}">{{title}}
    </label>
    {{/each}}
    <div class="clearfix"></div>
</script>

<script id="search-brand-checkbox-block" type="text/x-handlebars-template">
    {{#each brands}}
    <label class="check-item">
        <input class="brand_ch" type="checkbox" value="brand_{{id}}" name="brand_{{id}}"> {{title}}
    </label>
    {{/each}}
    <div class="clearfix"></div>
</script>