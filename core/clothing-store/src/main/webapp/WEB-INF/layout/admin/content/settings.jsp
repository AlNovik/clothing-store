<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<div class="tabbable">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#settings" data-toggle="tab">Настройки</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active fade in" id="settings">
            <form class="form-horizontal well">
                <legend>
                    Новая категория
                </legend>
                <h4>Настройки сайта</h4>
                <div class="control-group">
                    <label class="control-label" for="store-name">Название магазина</label>
                    <div class="controls">
                        <input type="text" id="store-name">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="store-org">Название организации</label>
                    <div class="controls">
                        <input type="text" id="store-org">
                    </div>
                </div>

                <h4>Контакты</h4>

                <h4>Изменить пароль администратора</h4>
                <div class="control-group">
                    <label class="control-label" for="old-password">Старый пароль</label>
                    <div class="controls">
                        <input type="text" id="old-password">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="new-password">Новый пароль</label>
                    <div class="controls">
                        <input type="text" id="new-password">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="confirm-password">Повторите пароль</label>
                    <div class="controls">
                        <input type="text" id="confirm-password">
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Сохранить</button>
                </div>
            </form>
        </div>
    </div>
</div>