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
            <p>
                <a href="#modal-product-add" class="btn btn-success" data-toggle="modal">
                    <i class="icon-plus icon-white"></i> Новый товар
                </a>
            </p>

            <div class="row-fluid">
                <div class="span8">
                    <table class="table table-condensed table-striped table-hover table-bordered" id="table_catalog">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Модель</th>
                            <th>Брэнд</th>
                            <th>Категория</th>
                            <th style="width: 10%">Опции</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Id</th>
                            <th>Модель</th>
                            <th>Брэнд</th>
                            <th>Категория</th>
                            <th>Опции</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
                <div class="span4" id="admin-select-table">
                    <div>
                        <h4>Категории</h4>
                        <select size="10" id="admin-select-category">
                        </select>
                    </div>
                    <div>
                        <h4>Брэнды</h4>
                        <select size="10" id="admin-select-brand">

                        </select>
                    </div>
                </div>
            </div>
        </div>

        <%-- Вкладкв категорий --%>
        <div class="tab-pane fade" id="category">
            <h3>Категории </h3>

            <p>
                <a href="#modal-category-add" class="btn btn-success" data-toggle="modal">
                    <i class="icon-plus icon-white"></i> Новая категория
                </a>
            </p>

            <div class="span8">
                <table class="table table-condensed table-striped table-hover table-bordered" id="table_category">
                    <thead>
                    <tr>
                        <th>Категория</th>
                        <th style="width:20%">Опции</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Категория</th>
                        <th style="width:20%">Опции</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <%-- Вкаладка брэндов --%>
        <div class="tab-pane fade" id="brand">
            <h3>Брэнды </h3>

            <p>
                <a href="#modal-brand-add" class="btn btn-success" data-toggle="modal">
                    <i class="icon-plus icon-white"></i> Новый производитель
                </a>
            </p>
            <table id="table_brand" class="table table-condensed table-striped table-hover table-bordered">
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

<script id="admin-table-category" type="text/x-handlebars-template">
    <table class="table table-condensed table-striped table-hover table-bordered span8">
        <thead>
        <tr>
            <th class="span10">Категория</th>
            <th class="span2">Опции</th>
        </tr>
        </thead>
        <tbody>
        {{#each categories}}
        <tr>
            <td>{{title}}</td>
            <td>
                <i class="icon-eye-open"></i>
                <i class="icon-search"></i>
                <i class="icon-remove"></i>
            </td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>

<%--Всплывающее окно подтверждения удаления--%>
<div class="modal hide fade" id="modal-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3>Удаление</h3>
    </div>
    <div class="modal-body">
        <p>Вы действительно хотите удалить этот товар?</p>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Отмена</button>
        <button class="btn btn-danger delete-item">Удалить</button>
    </div>
</div>

<%-- Модаьное окно добавления нового товара --%>
<jsp:include page="product.add.jsp"/>

<%-- Модальное окно добавления новой категории --%>
<jsp:include page="category.add.jsp"/>

<%-- Модальное окно добавления нового брэнда --%>
<jsp:include page="brand.add.jsp"/>