function confirmVendorCancel(){
	confirmGeneralCancel("vendor")
}

function confirmProductCancel(){
	confirmGeneralCancel("product")
}

function confirmGeneralCancel(input){
    cancel = confirm("Are you sure you want to cancel creating this " + input + "? The information will not be saved!")
    if (cancel) {
        alert("Canceling!")
        window.location.replace("/" + input + "s")
    } else {
        alert("Not Canceling!")
    }
}