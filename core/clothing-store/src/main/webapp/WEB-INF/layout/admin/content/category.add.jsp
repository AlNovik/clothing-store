<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<link rel="stylesheet" href="${staticInTomcat}/resources/bootstrap/css/bootstrap-wysihtml5.css">

<script src="${staticInTomcat}/resources/js/wysihtml5-0.3.0.js"></script>
<script src="${staticInTomcat}/resources/bootstrap/js/bootstrap-wysihtml5.js"></script>
<script src="${staticInTomcat}/resources/jQuery/js/jquery.ui.widget.js"></script>
<script src="${staticInTomcat}/resources/jQuery/js/jquery.iframe-transport.js"></script>
<script src="${staticInTomcat}/resources/jQuery/js/jquery.fileupload.js"></script>

<a href="/admin/products" class="btn"> << Назад</a>
<%--<div class="row-fluid">--%>
<%--<div class="span8 offset2">--%>
<form class="form-horizontal well">
    <legend>
        Новая категория
    </legend>
    <div class="row-fluid">
        <div class="span9">
            <div class="control-group">
                <input class="span12" type="text" id="title" placeholder="Название">
                <span class="help-block"></span>
            </div>
        </div>

        <div class="offset1 span2">
            <div class="control-group">
                <label class="checkbox">
                    <input type="checkbox" id="visible" value="true">Отображать
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
                    <input type="text" class="offset3 span9" id="url">
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
                    <input type="text" id="description-page">
                </div>
            </div>
        </div>
        <div class="span6">
            <h4>Картинки</h4>
            <div style="padding:20px">

                <input id="fileupload" type="file" name="files[]" data-url="rest/file/upload" multiple>

                <div id="dropzone">Drop files here</div>

                <div id="progress">
                    <div style="width: 0%;"></div>
                </div>

                <table id="uploaded-files">
                    <tr>
                        <th>File Name</th>
                        <th>File Size</th>
                        <th>File Type</th>
                        <th>Download</th>
                    </tr>
                </table>

            </div>
        </div>
    </div>


    <div class="control-group">
        <h4>Описание</h4>
        <textarea class="span10" id="description" placeholder="Описание..." style="height: 200px"></textarea>
    </div>

    <div class="form-actions">
        <button type="submit" class="btn btn-primary">Сохранить</button>
        <button type="button" class="btn">Отменить</button>
    </div>
</form>
<%--</div>--%>
<%--</div>--%>


<script>
    $('#description').wysihtml5({
        "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
        "emphasis": true, //Italics, bold, etc. Default true
        "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
        "html": true, //Button which allows you to edit the generated HTML. Default false
        "link": true, //Button to insert a link. Default true
        "image": true, //Button to insert an image. Default true,
        "color": true //Button to change color of font
    });
</script>
<script>
    $(function () {
        $('#fileupload').fileupload({
            dataType: 'json',

            done: function (e, data) {
                $("tr:has(td)").remove();
                $.each(data.result, function (index, file) {

                    $("#uploaded-files").append(
                            $('<tr/>')
                                    .append($('<td/>').text(file.fileName))
                                    .append($('<td/>').text(file.fileSize))
                                    .append($('<td/>').text(file.fileType))
                                    .append($('<td/>').html("<a href='rest/controller/get/"+index+"'>Click</a>"))
                    )//end $("#uploaded-files").append()
                });
            },

            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .bar').css(
                        'width',
                        progress + '%'
                );
            },

            dropZone: $('#dropzone')
        });
    });
</script>
<style>
    #dropzone {
        background: #ccc;
        width: 150px;
        height: 50px;
        line-height: 50px;
        text-align: center;
        font-weight: bold;
    }
    #dropzone.in {
        width: 600px;
        height: 200px;
        line-height: 200px;
        font-size: larger;
    }
    #dropzone.hover {
        background: lawngreen;
    }
    #dropzone.fade {
        -webkit-transition: all 0.3s ease-out;
        -moz-transition: all 0.3s ease-out;
        -ms-transition: all 0.3s ease-out;
        -o-transition: all 0.3s ease-out;
        transition: all 0.3s ease-out;
        opacity: 1;
    }
</style>