<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>


<ul class="nav nav-pills nav-stacked">
    <li>
        <a href="${pageContext.request.contextPath}/admin/products">Каталог</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/admin/orders">Заказы</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/admin/import">Импорт/Экспорт</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/admin/statistics">Статистика</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/admin/settings">Настройки</a>
    </li>
</ul>