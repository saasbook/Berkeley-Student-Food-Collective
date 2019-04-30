"use strict";

function routeToPage(input) {
    window.location.href = "/" + input;
}

function routeToPageDirectly(input) {
    window.location.href = input;
}

function confirmVendorCancel() {
  confirmGeneralCancel("admin/vendors");
}

function confirmProductCancel() {
  confirmGeneralCancel("admin/products");
}

function confirmGeneralCancel(input) {
  let cancel = confirm("Are you sure you want to discard these changes?");
  if (cancel) {
      routeToPage(input);
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
  $("<label>").attr({for: idPrefix + "_destroy"}).text("Remove " + tagType.charAt(0).toUpperCase() + tagType.slice(1) + " Type").appendTo(newDiv);
  newDiv.appendTo(tagsDiv);

  if (tagId) {
    // Append to nested attributes
    $("<input>").attr({type: "hidden", value: tagId, name: namePrefix + "[id]", id: idPrefix + "id"}).insertAfter(newDiv);
    // Append ot list of tag ids (so we can add additional existing tags)
    $("<option>").attr({value: tagId, selected: "selected"}).appendTo($(`#${formFor}_${tagType}_ids`));
  }
}
