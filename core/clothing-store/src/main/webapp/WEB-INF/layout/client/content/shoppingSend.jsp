<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>
<script src="${staticInTomcat}/resources/bootstrap/js/bootstrap-formhelpers-phone.js"></script>

<form class="form-horizontal well" id="createOrder">
    <legend>
        Оформление заказа
    </legend>

    <div class="control-group">
        <label class="control-label">ФИО</label>

        <div class="controls">
            <input type="text" name="contact.name">
            <span class="help-block"></span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">Адрес</label>

        <div class="controls controls-row">
            <input type="text" class="span3" name="contact.address.city" placeholder="Город">
            <input type="text" class="span3" name="contact.address.street" placeholder="улица">
            <input type="text" class="span2" name="contact.address.house" placeholder="д.">
            <input type="text" class="span2" name="contact.address.building" placeholder="корп.">
            <input type="text" class="span2" name="contact.address.flat" placeholder="кв.">
            <span class="help-block"></span>
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
            <textarea rows="3" name="note"></textarea>
        </div>
    </div>

    <div class="form-actions">
        <button type="submit" class="btn btn-primary pull-right">Отправить</button>
    </div>
</form>

<script>
    $(document).ready(function () {
        $('#createOrder').submit(function (e) {
            var order = form2js('createOrder', '.', true);
            order.items = $.evalJSON($.cookie('basketCart')).items;
            var send = $.toJSON(order);
            $.postJSON(restAPI + '/order', send,function (response) {
            }).success(function () {
                        $('#createOrder').trigger('reset');
                        alert("Успешное выполнение");
                        $.cookie('basketCart', null, {path: '/'});
                        basketCount();
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