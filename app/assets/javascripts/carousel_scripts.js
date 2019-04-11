$(document).ready(function() {
	$(".carousel_element").mouseenter(function() {
		current_index = $(this).index();
		$(".carousel_element").each(function(index){
			console.log(index);
			if (current_index < index) {
				document.getElementById($(this).text()).classList.add("spreadLeft"); 
				document.getElementById($(this).text()).classList.add("shade");
			} else if (current_index > index) {
				document.getElementById($(this).text()).classList.add("spreadRight"); 
				document.getElementById($(this).text()).classList.add("shade");

			}
		});
	});

	$(".carousel_element").mouseleave(function() {
		current_index = $(this).index();
		$(".carousel_element").each(function(index){
			if (current_index < index) {
				document.getElementById($(this).text()).classList.remove("spreadLeft"); 
								document.getElementById($(this).text()).classList.remove("shade");

			} else if (current_index > index) {
				document.getElementById($(this).text()).classList.remove("spreadRight");
								document.getElementById($(this).text()).classList.remove("shade");
 
			}
		});
	});

});