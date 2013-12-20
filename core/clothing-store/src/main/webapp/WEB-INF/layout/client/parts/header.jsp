<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<div class="navbar">
    <div class="navbar-inner">
        <ul class="nav">
            <li><a href="${pageContext.request.contextPath}/index">На главную</a></li>
            <li><a href="${pageContext.request.contextPath}/catalog">Каталог</a></li>
            <li><a href="${pageContext.request.contextPath}/about">О компании</a></li>
            <li><a href="${pageContext.request.contextPath}/information">Информация</a></li>
            <li><a href="${pageContext.request.contextPath}/contacts">Контакты</a></li>
        </ul>
        <ul class="nav pull-right">
            <li><a href="${pageContext.request.contextPath}/admin/products">Админка</a></li>
            <li><a href="${pageContext.request.contextPath}/shopping">Корзина <span class="badge badge-info"></span></a></li>
        </ul>

    </div>
</div>

