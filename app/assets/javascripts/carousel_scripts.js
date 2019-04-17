$(document).ready(function() {
  function classString(list) {
    let returnString = ".";
    for (let i = 0; i < list.length; i++) {
      returnString += list[i] + ".";
    }
    return returnString;
  }

  function helperFunction(obj, apply) {
    let over_index = obj.index();
    let classesOver = classString(event.currentTarget.classList).substring(0, classString(event.currentTarget.classList).length - 1);
    $(classesOver).each(function(index) {
      index += 1;
      if (index < over_index) {
        apply.call($(this).context.classList, "spreadLeft");
      } else if (index > over_index) {
        apply.call($(this).context.classList, "spreadRight");
      }
    });
  }

  $(".carousel_element").mouseover(function() {
    helperFunction($(this), DOMTokenList.prototype.add);
  });

  $(".carousel_element").mouseout(function() {
    helperFunction($(this), DOMTokenList.prototype.remove);
  });

  // $(".carousel_element").mouseover(function() {
  //   console.log("over");
  //   console.log($(this));
  //   let over_index = $(this).index();
  //   let classesOver = classString(event.currentTarget.classList).substring(0, classString(event.currentTarget.classList).length - 1);
  //   $(classesOver).each(function(index) {
  //     let element_index = index + 1;
  //     if (element_index < over_index) {
  //       $(this).context.classList.add("spreadLeft");
  //     }
  //     if (element_index > over_index) {
  //       $(this).context.classList.add("spreadRight");
  //     }
  //   });
  // });
  //
  // $(".carousel_element").mouseout(function() {
  //   console.log("out");
  //   console.log($(this));
  //   leave_index = $(this).index();
  //   let classesLeave = classString(event.currentTarget.classList).substring(0, classString(event.currentTarget.classList).length - 1);
  //   $(classesLeave).each(function(index) {
  //     let i = $(this).index();
  //     if (i < leave_index) {
  //       $(this).context.classList.remove("spreadLeft");
  //     }
  //     if (i > leave_index) {
  //       $(this).context.classList.remove("spreadRight");
  //     }
  //   });
  // });
});

function carouselAlert() {
  alert('Vendor Card - Still in Progress');
}
