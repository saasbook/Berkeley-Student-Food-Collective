function confirmCancel(){
	cancel = confirm("Are you sure you want to cancel creating this vendor? The information will not be saved!")
	if (cancel) {
		alert("Canceling!")
		//window.location.replace("localhost:3000/vendors")
	} else {
		alert("Not Canceling!")
	}
}