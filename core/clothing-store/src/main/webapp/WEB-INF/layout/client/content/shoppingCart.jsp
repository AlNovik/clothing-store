<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>


<h2>Оформление заказа</h2>

<div id="shopping"></div>

<script>
    $(document).ready(function () {
        var template = Handlebars.compile($("#shopping-table").html());
        var data = {items: []};

        var basketItems = $.evalJSON($.cookie('basketCart'));
        var titles = [];
        $.each(basketItems.items, function () {
            titles.push(this.title);
        });
        $.getJSON(restAPI + '/search/clothing', {titles: titles}, function (json) {
            console.log(json);
            $.each(json.products, function (i) {
                var item = {};
                item.price = this.price;
                item.brand = this.brand.title;
                item.category = this.category.title;
                item.title = basketItems.items[i].title;
                item.size = basketItems.items[i].size;
                item.quantity = basketItems.items[i].quantity;
                data.items.push(item);
            });
            var render = template(data);
            $('#shopping').html(render);
        });
    });
</script>

<script id="shopping-table" type="text/x-handlebars-template">
    <table class="table table-condensed table-striped table-hover table-bordered">
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
                Модель : {{title}} <br>
                Цвет : <br>
                Размер : {{size}}<br>
            </td>
            <td>
                <input type="text" value="{{quantity}}">
            </td>
            <td>
                {{price}}
            </td>
            <td>
                {{math quantity "*" price}}
            </td>
            <td></td>
        </tr>
        {{/each}}
        </tbody>
        <tfoot>
        <tr>
            <th colspan="3">В корзине {{lengthArray items}} товаров</th>
            <th colspan="3">Итого:</th>
        </tr>
        </tfoot>
    </table>

</script>