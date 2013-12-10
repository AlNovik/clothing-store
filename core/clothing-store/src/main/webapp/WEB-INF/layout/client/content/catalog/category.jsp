<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>


<div class="well">
    <h4 align="center">Категория : </h4>

    <b>Описание:</b>

    <p></p>
</div>

<div class="thumbnails" id="items"></div>

<script>
    $.getJSON(restLink, function (json) {
        buildCatalog(json, '${pageContext.request.contextPath}');
    });
</script>