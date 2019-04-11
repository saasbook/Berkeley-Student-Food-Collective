"use strict";

function confirmVendorCancel() {
	confirmGeneralCancel("vendor");
}

function confirmProductCancel() {
	confirmGeneralCancel("product");
}

function confirmGeneralCancel(input) {
    let cancel = confirm("Are you sure you want to cancel creating this " + input + "? The information will not be saved!");
    if (cancel) {
        window.location.href = "/" + input + "s"
    }
}

function addExistingTag() {
    let parent = $(event.target).parent();
    let selectedOption = parent.find("select option:selected");
    let tagName = selectedOption.text();
    let tagId = selectedOption.val();
    addNewSelect(tagName, tagId);
}

function addNewTag() {
    let parent = $(event.target).parent();
    let tagName = parent.find('input[type="text"]').val();
    addNewSelect(tagName, null);
}

function addNewSelect(tagName, tagId) {
    let parent = $(event.target).parent();
    let tagTypePlural = parent.attr("id").slice(4);
    let tagType = tagTypePlural.slice(0, -1);
    let tagsDiv = $(`#${tagTypePlural}`);
    let newTagNum = $("." + tagType).length;

    let formFor = $(document).find("form").attr("class").split("_")[1];  // Value is vendor or product
    let namePrefix = `${formFor}[${tagTypePlural}_attributes][${newTagNum}]`;
    let idPrefix = `${formFor}_${tagTypePlural}_attributes_${newTagNum}_`;

    let newDiv = $("<div>").attr({class: tagType});
    $("<input>").attr({size: 41, type: "text", value: tagName, name: namePrefix + "[name]", id: idPrefix + "name"}).appendTo(newDiv);
    $("<input>").attr({name: namePrefix + "[_destroy]", type: "hidden", value: 0}).appendTo(newDiv);
    $("<input>").attr({type: "checkbox", value: 1, name: namePrefix + "[_destroy]", id: idPrefix + "_destroy"}).appendTo(newDiv);
    $("<label>").attr({for: idPrefix + "_destroy"}).text("Remove Ownership Type").appendTo(newDiv);
    newDiv.appendTo(tagsDiv);

    if (tagId) {
        // Append to nested attributes
        $("<input>").attr({type: "hidden", value: tagId, name: namePrefix + "[id]", id: idPrefix + "id"}).insertAfter(newDiv);
        // Append ot list of tag ids (so we can add additional existing tags)
        $("<option>").attr({value: tagId, selected: "selected"}).appendTo($("#vendor_ownership_ids"));
    }
}

// function addNewSelect() {
//     var parent = $(event.target).parent();
//     var newValue = parent.find('input[type="text"]').val();
//     console.log(newValue);
//     var selectDivId = parent[0].id.substr(4);
//     console.log(selectDivId);
//     var select = $("#" + selectDivId + " > select");
//     var newOption = $("<option>").attr({selected: true}).text(newValue);
//     newOption.appendTo(select);
// }

// $(document).ready(function() {
//     $(".tag_submit").click(function() {
//         var parent = $(event.target).parent();
//         var tagName = parent.find('input[type="text"]').val();
//         var modelPlural = parent[0].id.slice(4);
//         var model = modelPlural.slice(0, -1);
//         var params = {};
//         params[model] = {'name': tagName};
//         $.post("/" + modelPlural, params, addNewSelect());
//     });
// });