<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<script src="${staticInTomcat}/resources/bootstrap/js/bootstrap-spinedit.js"></script>
<link rel="stylesheet" href="${staticInTomcat}/resources/bootstrap/css/bootstrap-spinedit.css">
<h2>Оформление заказа</h2>

<div id="shopping"></div>

<script>
    var template;
    $(document).ready(function () {
        template = Handlebars.compile($("#shopping-table").html());
        initShoppingTable();
    });
</script>

<script id="shopping-table" type="text/x-handlebars-template">
    <table class="table table-condensed table-striped table-hover table-bordered" id="shopcart">
        <thead>
        <tr>
            <th>#</th>
            <th>Описание</th>
            <th>Кол-во</th>
            <th>Цена</th>
            <th>Сумма</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        {{#each items}}
        <tr>
            <td>{{math @index 1}}</td>
            <td>
                <strong>{{category}}, {{brand}}</strong><br>
                Модель : <span class="item-title">{{title}}</span> <br>
                Цвет : <br>
                Размер : <span class="item-size">{{size}}</span><br>
            </td>
            <td>
                <input type="text" name="quantity" value="{{quantity}}">
            </td>
            <td>
                {{price}}
            </td>
            <td>
                <span class="item-sum">{{math quantity "*" price}}</span>
            </td>
            <td>
                <button class="btn btn-link delete">Удалить</button>
            </td>
        </tr>
        {{/each}}
        </tbody>
        <tfoot>
        <tr>
            <th colspan="3">В корзине {{lengthArray items}} товаров</th>
            <th colspan="3">Итого: <span id="total-price"></span></th>
        </tr>
        </tfoot>
    </table>
</script>