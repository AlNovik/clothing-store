<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<div class="tabbable">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#catalog" data-toggle="tab">Товары</a></li>
        <li><a href="#category" data-toggle="tab">Категории</a></li>
        <li><a href="#brand" data-toggle="tab">Брэнды</a></li>
    </ul>
    <div class="tab-content">
        <%-- Вкладка товаров --%>
        <div class="tab-pane fade active in" id="catalog">
            <h3>В каталоге всего N товаров</h3>
            <a href="#createProduct" class="btn btn-success" data-toggle="modal"><i class="icon-plus icon-white"></i> Новый товар</a>
            <p>Здесь будет список всех товаров</p>

            <div class="modal hide fade" id="createProduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">Новый товар</h3>
                </div>
                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Отменить</button>
                    <button class="btn btn-primary">Сохранить</button>
                </div>
            </div>

            <div class="span8">
                <table id="table_catalog">
                    <%--<thead>--%>
                    <%--<tr>--%>
                        <%--<th>Id</th>--%>
                        <%--<th>Модель</th>--%>
                        <%--<th>Производитель</th>--%>
                        <%--<th>Категория</th>--%>
                        <%--<th>Опции</th>--%>
                    <%--</tr>--%>
                    <%--</thead>--%>
                    <%--<tbody>--%>
                    <%--</tbody>--%>
                </table>
            </div>
        </div>

        <%-- Вкладкв категорий --%>
        <div class="tab-pane fade" id="category">
            <h3>Категории </h3>
            <a href="#createCategory" class="btn btn-success" data-toggle="modal"><i class="icon-plus icon-white"></i> Новая категория</a>
            <p>Зесь будет список категорий</p>
            <table id="table_category" class="table table-bordered table-striped span8">
                <thead>
                <tr>
                    <th class="span10">Категория</th>
                    <th class="span2">Опции</th>
                </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>

        <%-- Вкаладка брэндов --%>
        <div class="tab-pane fade" id="brand">
            <h3>Брэнды </h3>
            <button class="btn btn-success"><i class="icon-plus icon-white"></i> Новый производитель</button>
            <p>Зесь будет список брэндов</p>
            <table id="table_brand" class="table table-bordered table-striped span8">
                <thead>
                <tr>
                    <th class="span10">Брэнд</th>
                    <th class="span2">Опции</th>
                </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>

<script>
    var data_catalog_table = [];
    var table_catalog;
    var table_catalog_params = {
//        "sDom": "Iftrip",
        "aoColumns": [
            {
                "sTitle":"Id",
                "bSearchable": false,
                "bSortable": true
            },
            {
                "sTitle":"Модель",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "sTitle":"Брэнд",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "sTitle":"Категория",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "sTitle":"Опции",
                "bSearchable": false,
                "bSortable": false
            }
        ],
        "aaData": data_catalog_table,
//        "bProcessing": true,
//        "bServerSide": true,
//        "sAjaxSource": appLink + "/rest/tables/clothing",
        "sPaginationType": "full_numbers"
    };
    $(document).ready(function () {
        ititTables();

    });


    function ititTables() {
        <%--Таблица товаров--%>
        $.getJSON(appLink + '/rest/clothing', function (json) {
            $.each(json.clothings, function () {
                var item = [];
                item.push(this.id, this.model, this.brand.title, this.category.title, '<i class="icon-eye-open"></i> <i class="icon-search"></i> <i class="icon-remove"></i>');
                data_catalog_table.push(item);
//                $('#table_catalog tbody').append('<tr><td>' + this.id + '</td>' +
//                        '<td>' + this.model + '</td>' +
//                        '<td>' + this.brand.title + '</td>' +
//                        '<td>' + this.category.title + '</td>' +
//                        '<td><i class="icon-eye-open"></i> <i class="icon-search"></i> <i class="icon-remove"></i></td></tr>')
            });
            table_catalog = $('#table_catalog').dataTable(table_catalog_params);
        });

        <%-- Таблица категорий--%>
        $.getJSON(appLink + '/rest/category', function (json) {
            $.each(json.categories, function () {
                $('#table_category tbody').append('<tr><td>' + this.title + '</td><td><i class="icon-eye-open"></i> <i class="icon-search"></i> <i class="icon-remove"></i></td></tr>');
            });
        });
    }
</script>



<%--Модальное окно создания категории--%>
<div id="createCategory" class="modal hide fade" tabindex="-1" role="dialog"
     aria-labelledby="addCategoryLabel" aria-hidden="true">
    <div class="modal-header">
        <h3 id="addCategoryLabel">Добавить категорию</h3>
    </div>
    <form id="newCategoryForm">
        <fieldset>
            <div class="modal-body">
                <div class="control-group">
                    <label class="control-label" for="category_title">
                             Название
                    </label>

                    <div class="controls">
                        <input id="category_title"
                               class="input-block-level span10" type="text">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <input class="btn btn-success" type="submit" tdata-dismiss="modal"
                       value="Добавить">
                <input class="btn btn-warning" data-dismiss="modal" value="Отменить">
            </div>
        </fieldset>
    </form>
</div>