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