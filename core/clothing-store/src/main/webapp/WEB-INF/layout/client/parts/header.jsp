<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<div id="top-bar" class="container-fluid">
    <div id="logo">
        <a href="${pageContext.request.contextPath}/index">
            <img src="/resources/img/brand.png">
        </a>
    </div>
    <div class="row-fluid">
        <div id="search-line">
            <form class="form-search" id="search-title">
                <div class="input-append span12">
                    <input type="text" class="span10 search-query" id="title" autocomplete="off" name="title">
                    <button type="submit" class="btn btn-warning">Найти</button>
                </div>
            </form>
        </div>
        <div id="links-bar">
            <ul class="nav nav-pills pull-right">
                <li><a href="${pageContext.request.contextPath}/admin/products">Админка</a></li>
            </ul>
        </div>
        <div id="cart">
            <a href="${pageContext.request.contextPath}/shopping">
                <span id="cart-total"> 0 товаров - 0 руб.</span>
            </a>
        </div>
    </div>
</div>
<div class="clearfix"></div>
<div class="navbar">
    <div class="navbar-inner">
        <a class="brand pull-left" href="${pageContext.request.contextPath}/index">ClothingStore</a>
        <ul class="nav pull-right">
            <li><a href="${pageContext.request.contextPath}/index">На главную</a></li>
            <li><a href="${pageContext.request.contextPath}/catalog">Каталог</a></li>
            <li><a href="${pageContext.request.contextPath}/about">О компании</a></li>
            <li><a href="${pageContext.request.contextPath}/information">Информация</a></li>
            <li><a href="${pageContext.request.contextPath}/contacts">Контакты</a></li>
        </ul>
    </div>
</div>

