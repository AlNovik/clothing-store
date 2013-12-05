<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<%@ taglib prefix="datatables" uri="http://github.com/tduchateau/DataTables-taglib" %>


<link rel="stylesheet"
      href="http://${pageContext.request.serverName}/resources/jQuery/css/jquery.dataTables.css">

<script src="http://${pageContext.request.serverName}/resources/jQuery/js/jquery.dataTables.min.js"></script>


<datatables:table htmlTableId="myTable" data="${clothings}" dataObjectId="">
    <datatables:column ></datatables:column>
</datatables:table>