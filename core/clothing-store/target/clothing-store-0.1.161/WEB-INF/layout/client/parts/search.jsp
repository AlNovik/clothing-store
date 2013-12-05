<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<style>
    .search-size-item {
        float: left;
        width: 40px;
        margin: 1px;
    }

    .search-company-item, .search-category-item {
        float: left;
        width: 140px;
        margin: 1px;
    }
    .search-category-checkbox{
        margin-top: 1px;
    }
</style>

<form class="form-search" method="POST">
    <label for="search-model"> Модель </label>

    <div class="input-append">
        <input type="text" class="span6 search-query" id="search-model">
        <button type="submit" class="btn">Найти</button>
    </div>
</form>

<div class="breadcrumb"><span>Расширенный поиск</span></div>
<div class="search-box">
    <form method="POST">
        <div class="search-size-block">
            <div class="">
                <span>Размеры</span>
                <div class="btn-group pull-right" data-toggle="buttons-radio">
                    <button type="button" class="btn btn-mini" name="radio-size" id="size-all" value="all">Все</button>
                    <button type="button" class="btn btn-mini" name="radio-size" id="size-select" value="select">Выбрать
                    </button>
                </div>
            </div>
            <div class="search-size-checkbox">
            </div>
        </div>
        <div class="search-height-block">
            <div class="">Рост</div>
            <div class="height-checkbox">
                <label class="checkbox inline">
                    <input class="height_ch" type="checkbox" value="height_164" name="height_164">164
                </label>
                <label class="checkbox inline">
                    <input class="height_ch" type="checkbox" value="height_170" name="height_170">170
                </label>
            </div>
        </div>
        <div class="search-category-block">
            <div class="">
                <span>Тип одежды</span>
                <div class="btn-group pull-right" data-toggle="buttons-radio">
                    <button type="button" class="btn btn-mini" name="radio-category" id="category-all" value="all">Все
                    </button>
                    <button type="button" class="btn btn-mini" name="radio-category" id="category-select" value="select">
                        Выбрать
                    </button>
                </div>
            </div>

            <div class="search-category-checkbox"></div>
        </div>
        <div class="search-brand-block">
            <div class="">
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

            <div class="search-brand-checkbox"></div>
        </div>
        <button type="submit" class="btn btn-block">Искать</button>
    </form>
</div>


<script>
    for (var i = 36; i <= 76; i += 2) {
        $('.search-size-checkbox').append('<label class="search-size-item">' +
                '<input class="size_ch" type="checkbox" value="size_' + i + '" name="size_' + i + '">' + i +
                '</label>')
    }

    $.getJSON(appLink + '/rest/category', function (json) {
        $.each(json.categories, function () {
            $('.search-category-checkbox').append('<label class="search-category-item">' +
                    '<input class="category_ch" type="checkbox" value="category_' + this.id + '" name="category_' + this.id + '">' + this.title +
                    '</label>')
        })
    });
    $.getJSON(appLink + '/rest/brand', function (json) {
        $.each(json.brands, function () {
            $('.search-brand-checkbox').append('<label class="search-brand-item">' +
                    '<input class="brand_ch" type="checkbox" value="brand_' + this.id + '" name="brand_' + this.id + '">' + this.title +
                    '</label>')
        })
    });
</script>