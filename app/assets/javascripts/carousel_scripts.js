$(document).ready(function() {
	$(".trial_button").mouseenter(function() {
		current_index = $(this).index();
		$(".trial_button").each(function(index){
			console.log(index);
			if (current_index < index) {
				document.getElementById($(this).text()).classList.add("spreadLeft"); 
			} else if (current_index > index) {
				document.getElementById($(this).text()).classList.add("spreadRight"); 
			}
		});
	});

	$(".trial_button").mouseleave(function() {
		current_index = $(this).index();
		$(".trial_button").each(function(index){
			if (current_index < index) {
				document.getElementById($(this).text()).classList.remove("spreadLeft"); 
			} else if (current_index > index) {
				document.getElementById($(this).text()).classList.remove("spreadRight"); 
			}
		});
	});

});