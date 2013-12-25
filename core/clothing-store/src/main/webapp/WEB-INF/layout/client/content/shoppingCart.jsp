<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<script src="${staticInTomcat}/resources/bootstrap/js/bootstrap-formhelpers-phone.js"></script>
<script src="${staticInTomcat}/resources/bootstrap/js/bootstrap-spinedit.js"></script>
<link rel="stylesheet" href="${staticInTomcat}/resources/bootstrap/css/bootstrap-spinedit.css">
<h2>Оформление заказа</h2>

<div id="shopping"></div>
<div class="pull-right">
    <a href="#shopping-send" class="btn btn-success" data-toggle="modal">Оформить заказ</a>
</div>


<div class="modal hide fade" id="shopping-send" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3>Оформление заказа</h3>
    </div>
    <form class="form-horizontal" id="createOrder">
        <div class="modal-body well">

            <div class="control-group">
                <label class="control-label">ФИО</label>

                <div class="controls">
                    <input type="text" class="span9" name="contact.name">
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Адрес</label>

                <div class="controls controls-row">
                    <div style="margin-bottom: 10px" class="row-fluid">
                        <input type="text" placeholder="Город" name="contact.address.city" class="span4">
                        <input type="text" placeholder="улица" name="contact.address.street" class="span5">
                    </div>
                    <div class="row-fluid">
                        <input type="text" class="span2" name="contact.address.house" placeholder="д.">
                        <input type="text" class="span2" name="contact.address.building" placeholder="корп.">
                        <input type="text" class="span2" name="contact.address.flat" placeholder="кв.">
                        <span class="help-block"></span>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Телефон</label>

                <div class="controls">
                    <input type="text" class="form-control bfh-phone" data-format="+375 (dd) ddd-dddd"
                           name="contact.phone.number">
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Сообщение :</label>

                <div class="controls">
                    <textarea class="span9" rows="3" name="note"></textarea>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Отмена</button>
            <button class="btn btn-success" type="submit">Отправить</button>
        </div>
    </form>
</div>

<script>
    var template;
    $(document).ready(function () {
        template = Handlebars.compile($("#shopping-table").html());
        initShoppingTable();
        $('#createOrder').submit(function (e) {
            var order = form2js('createOrder', '.', true);
            order.items = JSON.parse(App.Storage.get('basketCart')).items;
            $.postJSON(App.Rest.link + '/order', order,function (response) {
            }).success(function () {
                        $('#createOrder').trigger('reset');
                        App.Storage.delete('basketCart');
                        basketCount();
                        $('#shopping-send').modal('hide');
                    })
                    .error(function (data, status, er) {
                        console.log("error: " + data + " status: " + status + " er:" + er);
                    })
                    .complete(function () {
                        alert("Завершение выполнения");
                    });

            e.preventDefault(); // prevent actual form submit and page reload
        });
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