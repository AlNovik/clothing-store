<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<form method="POST" id="search-param">
    <div class="block search-block">
        <h4 class="title"><span class="text">Расширенный поиск</span></h4>

        <div class="block">
            <h4 class="title">
            <span class="pull-left">
                <span class="text">Размеры</span>
            </span>

                <div class="btn-group pull-right" data-toggle="buttons-radio">
                    <button type="button" class="btn btn-mini" name="radio-size" id="size-all" value="all">Все</button>
                    <button type="button" class="btn btn-mini" name="radio-size" id="size-select" value="select">Выбрать
                    </button>
                </div>
            </h4>
            <div id="search-size-checkbox" class="control-group checkbox-block">

            </div>
        </div>
        <div class="block">
            <h4 class="title">
                <span class="text"> Рост  </span>
            </h4>

            <div class="height-checkbox checkbox-block">
                <label class="checkbox check-item">
                    <input class="height_ch" type="checkbox" value="164" name="height[]">164
                </label>
                <label class="checkbox check-item">
                    <input class="height_ch" type="checkbox" value="170" name="height[]">170
                </label>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="block">
            <h4 class="title">
            <span class="pull-left">
                <span class="text">Тип одежды</span>
            </span>

                <div class="btn-group pull-right" data-toggle="buttons-radio">
                    <button type="button" class="btn btn-mini" name="radio-category" id="category-all" value="all">Все
                    </button>
                    <button type="button" class="btn btn-mini" name="radio-category" id="category-select"
                            value="select">
                        Выбрать
                    </button>
                </div>
            </h4>
            <div id="search-category-checkbox" class="checkbox-block"></div>
        </div>
        <div class="block">
            <h4 class="title">
            <span class="pull-left">
                <span class="text">Производители</span>
            </span>

                <div class="btn-group pull-right" data-toggle="buttons-radio">
                    <button type="button" class="btn btn-mini" name="radio-brand" id="brand-all" value="all">
                        Все
                    </button>
                    <button type="button" class="btn btn-mini" name="radio-brand" id="brand-select" value="select">
                        Выбрать
                    </button>
                </div>
            </h4>
            <div id="search-brand-checkbox" class="checkbox-block"></div>
        </div>
        <button type="submit" class="btn btn-block btn-warning">Искать</button>
    </div>
</form>


<%-- Шаблоны --%>
<script id="search-size-checkbox-block" type="text/x-handlebars-template">
        {{select-size-checkbox}}
</script>

<script id="search-category-checkbox-block" type="text/x-handlebars-template">
    {{#each categories}}
    <label class="checkbox check-item">
        <input class="category_ch" type="checkbox" value="{{id}}" name="category[]">{{title}}
    </label>
    {{/each}}
    <div class="clearfix"></div>
</script>

<script id="search-brand-checkbox-block" type="text/x-handlebars-template">
    {{#each brands}}
    <label class="check-item">
        <input class="brand_ch" type="checkbox" value="{{id}}" name="brand[]"> {{title}}
    </label>
    {{/each}}
    <div class="clearfix"></div>
</script>