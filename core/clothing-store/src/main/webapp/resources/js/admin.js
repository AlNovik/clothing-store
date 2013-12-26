$(document).ready(function () {
    ititTables();
    initTemplate();
    submitForm();
    textareaDescription();

    $('#modal-category-add input[name=title]').syncTranslit({destination: "url-category"});
    $('#modal-product-add input[name=title]').syncTranslit({destination: "url-product"});
    $('#modal-brand-add input[name=title]').syncTranslit({destination: "url-brand"});
});

function ititTables() {
    var table_catalog_params = {
        "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span4'i><'span8'p>>",
        "oLanguage": {
            "sUrl": App.link + '/resources/i18n/datatables_ru.json'
        },
        "aoColumns": [
            {
                "mData": "id",
                "bSearchable": false,
                "bSortable": true
            },
            {
                "mData": "title",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "mData": "brand.title",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "mData": "category.title",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "mData": null,
                "bSearchable": false,
                "bSortable": false
            }
        ],
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": App.Rest.link + "/table/clothing",
        "fnServerData": function (sSource, aoData, fnCallback) {
            $.postJSON(sSource, aoData_modify(aoData), function (res) {
                fnCallback(res);
            });
        },
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            if (aData.properties.visible) {
                $(nRow).find('td:last').html('<i class="icon-eye-open"></i> <i class="icon-edit"></i> <i class="icon-remove"></i>');
            } else {
                $(nRow).find('td:last').html('<i class="icon-eye-close"></i> <i class="icon-edit"></i> <i class="icon-remove"></i>');
            }
            $(nRow).find('td:last').attr("data-id", aData.id);
        },
        "fnInitComplete": function (oSettings, json) {
            $('#table_catalog').find('.icon-eye-open').tooltip({title: 'Скрыть'});
            $('#table_catalog').find('.icon-eye-close').tooltip({title: 'Отобразить'});
            $('#table_catalog').find('.icon-edit').tooltip({title: 'Редактировать'});
            $('#table_catalog').find('.icon-remove').tooltip({title: 'Удалить'});
        },
        "sPaginationType": "bootstrap"
    };
    var table_category_params = {
        "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span4'i><'span8'p>>",
        "oLanguage": {
            "sUrl": App.link + '/resources/i18n/datatables_ru.json'
        },
        "aoColumns": [
            {
                "mData": "title",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "mData": null,
                "bSearchable": false,
                "bSortable": false
            }
        ],
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": App.Rest.link + "/table/category",
        "fnServerData": function (sSource, aoData, fnCallback) {
            $.postJSON(sSource, aoData_modify(aoData), function (res) {
                fnCallback(res);
            });
        },
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            if (aData.properties.visible) {
                $(nRow).find('td:last').html('<i class="icon-eye-open"></i> <i class="icon-edit"></i> <i class="icon-remove"></i>');
            } else {
                $(nRow).find('td:last').html('<i class="icon-eye-close"></i> <i class="icon-edit"></i> <i class="icon-remove"></i>');
            }
            $(nRow).find('td:last').attr("data-id", aData.id);

        },
        "fnInitComplete": function (oSettings, json) {
            $('#table_category .icon-eye-open').tooltip({title: 'Скрыть'});
            $('#table_category .icon-eye-close').tooltip({title: 'Отобразить'});
            $('#table_category .icon-edit').tooltip({title: 'Редактировать'});
            $('#table_category .icon-remove').tooltip({title: 'Удалить'});
        },
        "sPaginationType": "bootstrap"
    };
    var table_brand_params = {
        "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span4'i><'span8'p>>",
        "oLanguage": {
            "sUrl": App.link + '/resources/i18n/datatables_ru.json'
        },
        "aoColumns": [
            {
                "mData": "title",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "mData": null,
                "bSearchable": false,
                "bSortable": false
            }
        ],
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": App.Rest.link + "/table/brand",
        "fnServerData": function (sSource, aoData, fnCallback) {
            $.postJSON(sSource, aoData_modify(aoData), function (res) {
                fnCallback(res);
            });
        },
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            if (aData.properties.visible) {
                $(nRow).find('td:last').html('<i class="icon-eye-open"></i> <i class="icon-edit"></i> <i class="icon-remove"></i>');
            } else {
                $(nRow).find('td:last').html('<i class="icon-eye-close"></i> <i class="icon-edit"></i> <i class="icon-remove"></i>');
            }
            $(nRow).find('td:last').attr("data-id", aData.id);
        },
        "fnInitComplete": function (oSettings, json) {
            $('#table_brand .icon-eye-open').tooltip({title: 'Скрыть'});
            $('#table_brand .icon-eye-close').tooltip({title: 'Отобразить'});
            $('#table_brand .icon-edit').tooltip({title: 'Редактировать'});
            $('#table_brand .icon-remove').tooltip({title: 'Удалить'});
        },
        "sPaginationType": "bootstrap"
    };

    //    Строим таблицу и навешиваем события на колонку опций
    $('#table_catalog').dataTable(table_catalog_params).click(function (e) {
        var clicked = $(e.target);
        var id = clicked.closest('tr').find('td:first').html();
        var link = App.Rest.link + '/clothing/';
        tableEventHandler(clicked, id, link);
    });
    $('#table_category').dataTable(table_category_params).click(function (e) {
        var clicked = $(e.target);
        var id = clicked.closest('tr').find('td:last').data('id');
        var link = App.Rest.link + '/category/';
        tableEventHandler(clicked, id, link);
    });
    $('#table_brand').dataTable(table_brand_params).click(function (e) {
        var clicked = $(e.target);
        var id = clicked.closest('tr').find('td:last').data('id');
        var link = App.Rest.link + '/brand/';
        tableEventHandler(clicked, id, link);
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
        "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
        "sPaginationType": "full_numbers"
    });
// Таблица категорий
    $.getJSON(App.Rest.link + '/category', function (data) {
        var categories = '';
        $.each(data.categories, function () {
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

function tableEventHandler(clicked, id, link) {
    switch (true) {
        case clicked.hasClass('icon-eye-open'):
            $.getJSON(link + id, function (data) {
                data.properties.visible = false;
                $.putJSON(link + id, data);
            });
            clicked.removeClass('icon-eye-open');
            clicked.addClass('icon-eye-close');
            break;
        case clicked.hasClass('icon-eye-close'):
            $.getJSON(link + id, function (data) {
                data.properties.visible = true;
                $.putJSON(link + id, data);
            });
            clicked.removeClass('icon-eye-close');
            clicked.addClass('icon-eye-open');
            break;
        case clicked.hasClass('icon-remove'):
            $('#modal-delete').modal();
            $("#modal-delete .delete-item").click(function () {
                $.deleteItem(link + id);
                $('#modal-delete').modal('hide');
            });
            break;
        case clicked.hasClass('icon-edit'):
            switch (clicked.closest('.table').attr('id')) {
                case 'table_catalog':
                    var productModal = $('#modal-product-add');
                    productModal.modal();
                    productModal.find('.modal-header h3').html('Редактировать');
                    productModal.find('button[type="submit"]').html('Редактировать');
                    $.getJSON(link + id, function (data) {
                        js2form(document.getElementById('modal-product-add'), data);
                    });
                    break;
                case 'table_category':
                    var categoryModal = $('#modal-category-add');
                    categoryModal.modal();
                    categoryModal.find('.modal-header h3').html('Редактировать');
                    categoryModal.find('button[type="submit"]').html('Редактировать');
                    $.getJSON(link + id, function (data) {
                        js2form(document.getElementById('modal-category-add'), data);
                    });
                    break;
                case 'table_brand':
                    var brandModal = $('#modal-brand-add');
                    brandModal.modal();
                    brandModal.find('.modal-header h3').html('Редактировать');
                    brandModal.find('button[type="submit"]').html('Редактировать');
                    $.getJSON(link + id, function (data) {
                        js2form(document.getElementById('modal-brand-add'), data);
                    });
                    break;
            }
            break;
    }
}

function submitForm() {
    $('#newProduct').submit(function (e) {
        sendForm('newProduct', App.Rest.link + '/clothing');
        e.preventDefault();
    });

    $('#newCategory').submit(function (e) {
        sendForm('newCategory', App.Rest.link + '/category');
        e.preventDefault();
    });

    $('#newBrand').submit(function (e) {
        sendForm('newBrand', App.Rest.link + '/brand');
        e.preventDefault();
    });
}

function sendForm(idForm, link) {
    var formData = form2js(idForm, '.', true);
    delete formData._wysihtml5_mode;
    if ($('#' + idForm + ' input[name=id]').val() == '') {
        $.postJSON(link, formData, function () {
            $('#' + idForm).closest('.modal').modal('hide');
            $('.callback').addClass('text-success').html('Операция выполнена успешно!').fadeOut(3000, function () {
                $(this).removeClass('text-success');
            });
            cleanForm(idForm);
        })
            .error(function (data, status, er) {
                console.log("error: " + data + " status: " + status + " er:" + er);
            });
    } else {
        $.putJSON(link + '/' + $('#' + idForm + ' input[name=id]').val(), formData, function () {
            $('#' + idForm).closest('.modal').modal('hide');
            $('.callback').addClass('text-success').html('Операция выполнена успешно!').fadeOut(3000, function () {
                $(this).removeClass('text-success');
            });
            cleanForm(idForm);
        })
            .error(function () {
                alert("Ошибка выполнения");
            });
    }
}

function textareaDescription() {
    $('#modal-category-add textarea[name=description]').wysihtml5({
        "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
        "emphasis": true, //Italics, bold, etc. Default true
        "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
        "html": true, //Button which allows you to edit the generated HTML. Default false
        "link": true, //Button to insert a link. Default true
        "image": true, //Button to insert an image. Default true,
        "color": true, //Button to change color of font
        "stylesheets": false
    });
    $('#modal-product-add textarea[name=description]').wysihtml5({
        "font-styles": true,
        "emphasis": true,
        "lists": true,
        "html": true,
        "link": true,
        "image": true,
        "color": true,
        "stylesheets": false
    });
    $('#modal-brand-add textarea[name=description]').wysihtml5({
        "font-styles": true,
        "emphasis": true,
        "lists": true,
        "html": true,
        "link": true,
        "image": true,
        "color": true,
        "stylesheets": false
    });
}

function openModal(id) {
    $('#' + id).modal();
    $('#' + id).find('.modal-header h3').html('Добавить');
    $('#' + id).find('button[type="submit"]').html('Сохранить');
    cleanForm($('#' + id).find('form').attr('id'));
}

function cleanForm(id) {
    $('#' + id).trigger('reset');
    $('#' + id + ' .bootstrap-tagsinput span').remove();
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
                );//end $("#uploaded-files").append()
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

var aoData_modify = function (aoData) {
    var result = {};
    var modifiers = ['mDataProp_', 'sSearch_', 'iSortCol_', 'bSortable_', 'bRegex_', 'bSearchable_', 'sSortDir_'];
    jQuery.each(aoData, function (idx, obj) {
        if (obj.name) {
            for (var i = 0; i < modifiers.length; i++) {
                if (obj.name.substring(0, modifiers[i].length) == modifiers[i]) {
                    var index = parseInt(obj.name.substring(modifiers[i].length));
                    var key = 'a' + modifiers[i].substring(0, modifiers[i].length - 1);
                    if (!result[key]) {
                        result[key] = [];
                    }
                    result[key][index] = obj.value;
                    return;
                }
            }
            result[obj.name] = obj.value;
        }
        else {
            result[idx] = obj;
        }
    });
    return result;
};

/* API method to get paging information */
$.fn.dataTableExt.oApi.fnPagingInfo = function (oSettings) {
    return {
        "iStart": oSettings._iDisplayStart,
        "iEnd": oSettings.fnDisplayEnd(),
        "iLength": oSettings._iDisplayLength,
        "iTotal": oSettings.fnRecordsTotal(),
        "iFilteredTotal": oSettings.fnRecordsDisplay(),
        "iPage": oSettings._iDisplayLength === -1 ?
            0 : Math.ceil(oSettings._iDisplayStart / oSettings._iDisplayLength),
        "iTotalPages": oSettings._iDisplayLength === -1 ?
            0 : Math.ceil(oSettings.fnRecordsDisplay() / oSettings._iDisplayLength)
    };
};

/* Bootstrap style pagination control */
$.extend($.fn.dataTableExt.oPagination, {
    "bootstrap": {
        "fnInit": function (oSettings, nPaging, fnDraw) {
            var oLang = oSettings.oLanguage.oPaginate;
            var fnClickHandler = function (e) {
                e.preventDefault();
                if (oSettings.oApi._fnPageChange(oSettings, e.data.action)) {
                    fnDraw(oSettings);
                }
            };

            $(nPaging).addClass('pagination').append(
                '<ul>' +
                    '<li class="prev disabled"><a href="#">&larr; ' + oLang.sPrevious + '</a></li>' +
                    '<li class="next disabled"><a href="#">' + oLang.sNext + ' &rarr; </a></li>' +
                    '</ul>'
            );
            var els = $('a', nPaging);
            $(els[0]).bind('click.DT', { action: "previous" }, fnClickHandler);
            $(els[1]).bind('click.DT', { action: "next" }, fnClickHandler);
        },

        "fnUpdate": function (oSettings, fnDraw) {
            var iListLength = 5;
            var oPaging = oSettings.oInstance.fnPagingInfo();
            var an = oSettings.aanFeatures.p;
            var i, j, sClass, iStart, iEnd, iHalf = Math.floor(iListLength / 2);

            if (oPaging.iTotalPages < iListLength) {
                iStart = 1;
                iEnd = oPaging.iTotalPages;
            }
            else if (oPaging.iPage <= iHalf) {
                iStart = 1;
                iEnd = iListLength;
            } else if (oPaging.iPage >= (oPaging.iTotalPages - iHalf)) {
                iStart = oPaging.iTotalPages - iListLength + 1;
                iEnd = oPaging.iTotalPages;
            } else {
                iStart = oPaging.iPage - iHalf + 1;
                iEnd = iStart + iListLength - 1;
            }

            for (i = 0, iLen = an.length; i < iLen; i++) {
                // Remove the middle elements
                $('li:gt(0)', an[i]).filter(':not(:last)').remove();

                // Add the new list items and their event handlers
                for (j = iStart; j <= iEnd; j++) {
                    sClass = (j == oPaging.iPage + 1) ? 'class="active"' : '';
                    $('<li ' + sClass + '><a href="#">' + j + '</a></li>')
                        .insertBefore($('li:last', an[i])[0])
                        .bind('click', function (e) {
                            e.preventDefault();
                            oSettings._iDisplayStart = (parseInt($('a', this).text(), 10) - 1) * oPaging.iLength;
                            fnDraw(oSettings);
                        });
                }

                // Add / remove disabled classes from the static elements
                if (oPaging.iPage === 0) {
                    $('li:first', an[i]).addClass('disabled');
                } else {
                    $('li:first', an[i]).removeClass('disabled');
                }

                if (oPaging.iPage === oPaging.iTotalPages - 1 || oPaging.iTotalPages === 0) {
                    $('li:last', an[i]).addClass('disabled');
                } else {
                    $('li:last', an[i]).removeClass('disabled');
                }
            }
        }
    }
});

