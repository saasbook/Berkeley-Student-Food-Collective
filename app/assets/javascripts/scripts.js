function confirmVendorCancel(){
	cancel = confirm("Are you sure you want to cancel creating this vendor? The information will not be saved!")
	if (cancel) {
		alert("Canceling!")
		window.location.replace("/vendors")
	} else {
		alert("Not Canceling!")
	}
}

function confirmProductCancel(){
	cancel = confirm("Are you sure you want to cancel creating this product? The information will not be saved!")
	if (cancel) {
		alert("Canceling!")
		window.location.replace("/products")
	} else {
		alert("Not Canceling!")
	}
}

function selectVendor(setValue){
	document.getElementById("product_vendor_id").value = setValue
	alert(document.getElementById("product_vendor_id"))
	//alert(document.getElementById("product_form_id").elements["products[vendor_id]"])
}