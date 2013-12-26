<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<c:set var="staticInApache" value="http://${pageContext.request.serverName}" scope="application"/>
<c:set var="staticInTomcat" value="${pageContext.request.contextPath}" scope="application"/>

<!DOCTYPE html>
<html>
<head>
    <title>Магазин одежды // <tiles:insertAttribute name="title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="properties" content="">
    <meta name="author" content="">
    <meta charset="utf-8">

    <script>
        var appLink = window.location.origin + '${pageContext.request.contextPath}';
        var restLink = window.location.href.replace(window.location.origin + '${pageContext.request.contextPath}', window.location.origin + '${pageContext.request.contextPath}/rest');
        var restAPI = appLink + '/rest';
    </script>

    <link rel="stylesheet" href="${staticInTomcat}/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet"
          href="${staticInTomcat}/resources/bootstrap/css/bootstrap-responsive.css">
    <link rel="stylesheet" href="${staticInTomcat}/resources/css/style.css">
    <link rel="stylesheet" href="${staticInTomcat}/resources/bootstrap/css/bootstrap-spinedit.css">
    <link rel="stylesheet" href="${staticInTomcat}/resources/jQuery/css/jquery.jqzoom.css">

    <script src="${staticInTomcat}/resources/jQuery/js/jquery-1.7.2.min.js"></script>
    <script src="${staticInTomcat}/resources/jQuery/js/jquery.cookie.js"></script>
    <script src="${staticInTomcat}/resources/jQuery/js/form2js.js"></script>
    <script src="${staticInTomcat}/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="${staticInTomcat}/resources/bootstrap/js/bootstrap-spinedit.js"></script>
    <script src="${staticInTomcat}/resources/js/handlebars-v1.1.2.js"></script>
    <script src="${staticInTomcat}/resources/js/helpers.js"></script>
    <script src="${staticInTomcat}/resources/js/script.js"></script>
    <script src="${staticInTomcat}/resources/js/rest.js"></script>

</head>
<body>

<div class="page-wrapper">
    <div class="container-fluid">
        <tiles:insertAttribute name="header"/>
        <div class="row-fluid">
            <!-- Menu -->
            <div class="span2 left_content">
                <tiles:insertAttribute name="menu"/>
            </div>

            <!-- Content -->
            <div class="span7 content">
                <tiles:insertAttribute name="content"/>
            </div>

            <!-- Search parameters -->
            <div class="span3 right_content">
                <tiles:insertAttribute name="search"/>
            </div>
        </div>
    </div>

    <tiles:insertAttribute name="footer"/>
</div>
</body>
</html>