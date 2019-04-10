"use strict";

function confirmVendorCancel() {
	confirmGeneralCancel("vendor");
}

function confirmProductCancel() {
	confirmGeneralCancel("product");
}

function confirmGeneralCancel(input) {
    var cancel = confirm("Are you sure you want to cancel creating this " + input + "? The information will not be saved!");
    if (cancel) {
        window.location.href = "/" + input + "s"
    }
}

function addNewSelect() {
    var parent = $(event.target).parent();
    var newValue = parent.find('input[type="text"]').val();
    var selectDivId = parent[0].id.substr(4);
    console.log(selectDivId);
    var select = $("#" + selectDivId + " > select");
    var newOption = $("<option>").attr({selected: true}).text(newValue);
    newOption.appendTo(select);
}

$(document).ready(function() {
    $(".tag_submit").click(function() {
        var parent = $(event.target).parent();
        var tagName = parent.find('input[type="text"]').val();
        var modelPlural = parent[0].id.slice(4);
        var model = modelPlural.slice(0, -1);
        var params = {};
        params[model] = {'name': tagName};
        $.post("/" + modelPlural, params, addNewSelect());
    });
});