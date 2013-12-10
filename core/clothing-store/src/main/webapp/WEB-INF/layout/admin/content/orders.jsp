<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<div class="tabbable">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#new" data-toggle="tab">Новые</a></li>
        <li><a href="#accepted" data-toggle="tab">Принятые</a></li>
        <li><a href="#executed" data-toggle="tab">Выполненные</a></li>
        <li><a href="#canceled" data-toggle="tab">Отмененные</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active fade in" id="new">
            <p>Новые, неподтвержденные заказы</p>
        </div>
        <div class="tab-pane fade" id="accepted">
            <p>Подтвержденные, недоставленные</p>
        </div>
        <div class="tab-pane fade" id="executed">
            <p>Выполненные заказы</p>
        </div>
        <div class="tab-pane fade" id="canceled">
            <p>Отмененные заказы</p>
        </div>
    </div>
</div>