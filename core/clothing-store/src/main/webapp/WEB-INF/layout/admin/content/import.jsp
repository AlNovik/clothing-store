<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<div class="tabbable">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#import" data-toggle="tab">Импорт</a></li>
        <li><a href="#export" data-toggle="tab">Экспорт</a></li>
        <li><a href="#backup" data-toggle="tab">Резерваня копия</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="import">
            <p>Импорт из файла</p>
        </div>
        <div class="tab-pane" id="export">
            <p>Экспорт в файл</p>
        </div>
        <div class="tab-pane" id="backup">
            <p>Резервные копии</p>
        </div>
    </div>
</div>