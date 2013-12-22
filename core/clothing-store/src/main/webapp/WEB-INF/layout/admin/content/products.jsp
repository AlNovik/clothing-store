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

            <p><a href="${pageContext.request.contextPath}/admin/product/add" class="btn btn-success"
                  data-toggle="modal"><i class="icon-plus icon-white"></i> Новый товар</a></p>

            <div class="modal hide fade" id="createProduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
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
                </table>

                <table class="table table-condensed table-striped table-hover table-bordered">
                    <thead>
                    <tr>
                        <th width="30%">ID</th>
                        <th width="20%">Модель</th>
                        <th width="18%">Брэнд</th>
                        <th width="20%">Категория</th>
                        <th width="12%">Опции</th>
                    </tr>
                    </thead>

                    <tfoot>
                    <tr>
                        <th width="30%">ID</th>
                        <th width="20%">Модель</th>
                        <th width="18%">Брэнд</th>
                        <th width="20%">Категория</th>
                        <th width="12%">Опции</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <%-- Вкладкв категорий --%>
        <div class="tab-pane fade" id="category">
            <h3>Категории </h3>

            <p><a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-success"
                  data-toggle="modal"><i class="icon-plus icon-white"></i> Новая категория</a></p>

            <div id="table_category"></div>
        </div>

        <%-- Вкаладка брэндов --%>
        <div class="tab-pane fade" id="brand">
            <h3>Брэнды </h3>

            <p><a href="${pageContext.request.contextPath}/admin/brand/add" class="btn btn-success"><i
                    class="icon-plus icon-white"></i> Новый производитель</a></p>
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

<script id="admin-table-category" type="text/x-handlebars-template">
    <table class="table table-bordered table-striped span8">
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