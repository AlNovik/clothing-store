$(document).ready(function () {
    ititTables();
    initTemplate();
    submitForm();

    $('#modal-category-add input[name=title]').syncTranslit({destination: "url-category"});
    $('#modal-product-add input[name=title]').syncTranslit({destination: "url-product"});
    $('#modal-brand-add input[name=title]').syncTranslit({destination: "url-brand"});
});

function ititTables() {
    var data_catalog_table = [];
    var table_catalog_params = {
        "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
        "aoColumns": [
            {
                "sTitle": "Id",
                "bSearchable": false,
                "bSortable": true
            },
            {
                "sTitle": "Модель",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "sTitle": "Брэнд",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "sTitle": "Категория",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "sTitle": "Опции",
                "bSearchable": false,
                "bSortable": false
            }
        ],
        "aaData": data_catalog_table,
//        "bProcessing": true,
//        "bServerSide": true,
//        "sAjaxSource": appLink + "/rest/tables/clothing",
        "sPaginationType": "full_numbers"
    };
    App.Rest.clothing.done(function (data) {
        console.time('clothing list');
        $.each(data.clothings, function () {
            var item = [];
            var option = null;
            if (this.properties.visible) {
                option = '<i class="visible icon-eye-open"></i> <i class="icon-search"></i> <i class="icon-remove"></i>';
            } else {
                option = '<i class="visible icon-eye-close"></i> <i class="icon-search"></i> <i class="icon-remove"></i>';
            }
            item.push(this.id, this.title, this.brand.title, this.category.title, option);
            data_catalog_table.push(item);
        });
        console.timeEnd('clothing list');
        $('#table_catalog').dataTable(table_catalog_params);
    });

//    Навешиваем события на элементы таблицы
    $('#table_catalog').click(function (e) {
        var clicked = $(e.target);
        var id = clicked.closest('tr').find('td:first').html();
        switch (true) {
            case clicked.hasClass('icon-eye-open'):
                $.getJSON(App.Rest.link + '/clothing/' + id, function (data) {
                    data.properties.visible = false;
                    $.putJSON(App.Rest.link + '/clothing/' + id, $.toJSON(data));
                });
                clicked.removeClass('icon-eye-open');
                clicked.addClass('icon-eye-close');
                break;
            case clicked.hasClass('icon-eye-close'):
                $.getJSON(App.Rest.link + '/clothing/' + id, function (data) {
                    data.properties.visible = true;
                    $.putJSON(App.Rest.link + '/clothing/' + id, $.toJSON(data));
                });
                clicked.removeClass('icon-eye-close');
                clicked.addClass('icon-eye-open');
                break;
            case clicked.hasClass('icon-remove'):
                $('#modal-delete').modal();
                $("#modal-delete .delete-item").click(function () {
                    $.deleteItem(App.Rest.link + '/clothing/' + id);
                    $('#modal-delete').modal('hide');
                });
                break;
        }
    });

    $('#admin-select-table').click(function (e) {
        var clicked = $(e.target);
        if (clicked.hasClass('option')) {
            var clickEnter = jQuery.Event("keyup", { keyCode: 13 });
            $('#table_catalog_filter input').val(clicked.val()).trigger(clickEnter);
            $('#admin-select-table option:selected').each(function () {
                if (this != clicked) {
                    this.selected = false;
                }
            });
        }
    });
    $('#order-new').dataTable({
        "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
        "aaData": data_catalog_table,
//        "bProcessing": true,
//        "bServerSide": true,
//        "sAjaxSource": appLink + "/rest/tables/clothing",
        "sPaginationType": "full_numbers"
    });
// Таблица категорий
    $.getJSON(App.Rest.link + '/category', function (data) {
        var categories = '';
        $.each(data.categories, function () {
            $('#table_category tbody').append('<tr><td>' + this.title + '</td><td><i class="icon-eye-open"></i> <i class="icon-edit"></i> <i class="icon-remove"></i></td></tr>');
            categories += '<option class="option">' + this.title + '</option>';
        });
        $('#admin-select-category').html(categories);

    });

    $.getJSON(App.Rest.link + '/brand', function (data) {
        var brands = '';
        $.each(data.brands, function () {
            brands += '<option class="option">' + this.title + '</option>';
        });
        $('#admin-select-brand').html(brands);
    });
}

function submitForm() {
    // Save Person AJAX Form Submit
    $('#newProduct').submit(function (e) {
        // will pass the form data using the jQuery serialize function
        $.post(restAPI + '/clothing', $(this).serialize(),function (response) {
//                $('#personFormResponse').text(response);
        }).success(function () {
                alert("Успешное выполнение");
            })
            .error(function () {
                alert("Ошибка выполнения");
            })
            .complete(function () {
                alert("Завершение выполнения");
            });

        e.preventDefault(); // prevent actual form submit and page reload
    });

    $('#newCategory').submit(function (e) {
        var formData = form2js('newCategory', '.', true);
        delete formData._wysihtml5_mode;
        console.log('formData - ' + formData);
        console.log(formData);
        var send = $.toJSON(formData);
        console.log('send - ' + send);
        console.log(send);
        $.postJSON(restAPI + '/category', send,function (response) {
        }).success(function () {
                $('#newCategory').trigger('reset');
                alert("Успешное выполнение");
            })
            .error(function (data, status, er) {
                console.log("error: " + data + " status: " + status + " er:" + er);
            })
            .complete(function () {
                alert("Завершение выполнения");
            });

        e.preventDefault(); // prevent actual form submit and page reload
    });

    $('#newBrand').submit(function (e) {
        $.post(restAPI + '/brand', $(this).serialize(),function (response) {
        }).success(function () {
                $('#newBrand').trigger('reset');
                alert("Успешное выполнение");
            })
            .error(function (data, status, er) {
                console.log("error: " + data + " status: " + status + " er:" + er);
            })
            .complete(function () {
                alert("Завершение выполнения");
            });

        e.preventDefault(); // prevent actual form submit and page reload
    });
}

function textareaDescription() {
    $('#modal-category-add textarea[name=description]').wysihtml5({
        "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
        "emphasis": true, //Italics, bold, etc. Default true
        "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
        "html": true, //Button which allows you to edit the generated HTML. Default false
        "link": true, //Button to insert a link. Default true
        "image": true, //Button to insert an image. Default true,
        "color": true //Button to change color of font
    });
    $('#modal-product-add textarea[name=description]').wysihtml5({
        "font-styles": true,
        "emphasis": true,
        "lists": true,
        "html": true,
        "link": true,
        "image": true,
        "color": true
    });
    $('#modal-brand-add textarea[name=description]').wysihtml5({
        "font-styles": true,
        "emphasis": true,
        "lists": true,
        "html": true,
        "link": true,
        "image": true,
        "color": true
    });
}

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
                        .append($('<td/>').html("<a href='/rest/file/get/" + index + "'>Click</a>"))
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

function initTemplate() {
    var selectBrand = Handlebars.compile($('#selected-brand').html());
    var selectCategory = Handlebars.compile($('#selected-category').html());
    var selectSize = Handlebars.compile($('#selected-size').html());
    $('#select-size .controls').html(selectSize);
    $.getJSON(restAPI + '/brand', function (data) {
        $('#select-brand .controls').html(selectBrand(data));
    });
    $.getJSON(restAPI + '/category', function (data) {
        $('#select-category .controls').html(selectCategory(data));
    });
}

