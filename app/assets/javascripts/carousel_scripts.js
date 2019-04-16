$(document).ready(function() {
  function classString(list) {
		var returnString = ".";
		for (i = 0; i < list.length; i++) {
		  returnString += list[i] + ".";
		}
		return returnString;
  }
  $(".carousel_element").mouseover(function() {
		over_index = $(this).index();
		let classesOver = classString(event.currentTarget.classList).substring(0, classString(event.currentTarget.classList).length - 1);
		$(classesOver).each(function(index) {
	  	element_index = $(this).index();
	  	if (element_index < over_index) {
	  		$(this).context.classList.add("spreadLeft"); 
	  	} 
	  	if (element_index > over_index) {
				$(this).context.classList.add("spreadRight"); 
	  	}
	  });
	});
	$(".carousel_element").mouseleave(function() {
	  leave_index = $(this).index();
	  let classesLeave = classString(event.currentTarget.classList).substring(0, classString(event.currentTarget.classList).length - 1);
	  $(classesLeave).each(function(index){
		  i = $(this).index();
		  if (i < leave_index) {
				$(this).context.classList.remove("spreadLeft"); 
		  } 
		  if (i > leave_index) {
				$(this).context.classList.remove("spreadRight"); 
		  }
	  });
	});
});

function carouselAlert() {
  alert('Vendor Card - Still in Progress');
}