$(document).ready(function(){
	function classString(list){
		var returnString = ".";
		for (i = 0; i < list.length; i++) {
			returnString += list[i] + ".";
		}
		return returnString;
	}
	$(".carousel_element").mouseover(function() {
		hovered_index = $(this).index();
		let classes = classString(event.currentTarget.classList).substring(0, classString(event.currentTarget.classList).length - 1);
		$(classes).each(function(index){
			element_index = $(this).index();
			if (element_index < hovered_index) {
				$(this).context.classList.add("spreadLeft"); 
			} 
			if (element_index > hovered_index) {
				$(this).context.classList.add("spreadRight"); 
				//document.getElementById($(this).find("td").context.innerText).classList.add("spreadRight"); 
			}
		});
	});
	$(".carousel_element").mouseleave(function() {
		hovered_index = $(this).index();
		classes = classString(event.currentTarget.classList).substring(0, classString(event.currentTarget.classList).length - 1);
		$(classes).each(function(index){
			element_index = $(this).index();
			if (element_index < hovered_index) {
				$(this).context.classList.remove("spreadLeft"); 
			} 
			if (element_index > hovered_index) {
				$(this).context.classList.remove("spreadRight"); 
			}
		});
	});
});




