<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>


<div class="modal hide fade modal-admin" id="modal-category-add" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3>Добавить новую категорию</h3>
    </div>

    <form class="form-horizontal" id="newCategory">

        <div class="modal-body well">

            <div class="row-fluid">
                <div class="span9">
                    <div class="control-group">
                        <input class="span12" type="text" name="title" placeholder="Название">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="offset1 span2">
                    <div class="control-group">
                        <label class="checkbox">
                            <input type="checkbox" id="visible" value="true" name="properties.visible">Отображать
                        </label>
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span6">
                    <h4>Свойства страницы</h4>

                    <div class="control-group">
                        <label class="control-label">URL</label>

                        <div class="controls">
                            <label class="span3">/category/</label>
                            <input type="text" class="offset3 span9" id="url-category" name="properties.url">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Title</label>

                        <div class="controls">
                            <input type="text" id="title-page">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Keywords</label>

                        <div class="controls">
                            <input type="text" id="keywords">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Описание</label>

                        <div class="controls">
                            <input type="text" id="properties-page">
                        </div>
                    </div>
                </div>
                <%--<div class="span6">--%>
                    <%--<h4>Картинки</h4>--%>

                    <%--<div style="padding:20px">--%>

                        <%--<input id="fileupload" type="file" name="files[]" data-url="rest/file/upload" multiple>--%>

                        <%--<div id="dropzone">Drop files here</div>--%>

                        <%--<div id="progress">--%>
                            <%--<div style="width: 0%;"></div>--%>
                        <%--</div>--%>

                        <%--<table id="uploaded-files">--%>
                            <%--<tr>--%>
                                <%--<th>File Name</th>--%>
                                <%--<th>File Size</th>--%>
                                <%--<th>File Type</th>--%>
                                <%--<th>Download</th>--%>
                            <%--</tr>--%>
                        <%--</table>--%>

                    <%--</div>--%>
                <%--</div>--%>
            </div>


            <div class="control-group">
                <h4>Описание</h4>
                <textarea class="span10" placeholder="Описание..." style="height: 200px"
                          name="description"></textarea>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Отмена</button>
            <button class="btn btn-success" type="submit">Добавить</button>
        </div>
    </form>
</div>