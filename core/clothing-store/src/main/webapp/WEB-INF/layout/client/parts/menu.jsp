<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<ul class="nav nav-list well" id="category">
    <li class="nav-header">Каталог одежды</li>
</ul>

<ul class="nav nav-list well" id="company">
    <li class="nav-header">Производители</li>
</ul>

<script>

    $.getJSON(appLink + '/rest/category', function (json) {
        $.each(json.categories, function () {
            $('#category').append('<li><a href="${pageContext.request.contextPath}/category/' + this.id +'">' + this.title + '</a></li>')
        })
    });
    $.getJSON(appLink + '/rest/brand', function (json) {
        $.each(json.brands, function () {
            $('#company').append('<li><a href="${pageContext.request.contextPath}/brand/' + this.id +'">' + this.title + '</a></li>')
        })
    });

</script>
        