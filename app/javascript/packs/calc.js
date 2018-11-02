var loader = document.getElementById("loader-4");

var endDateElement = document.getElementById("rental_end_date");

endDateElement.addEventListener("input", function() {
  console.log("agreagamos clase");
  loader.classList.toggle("loader-4");
  setTimeout(function(){    
    var start_date = document.querySelector("#rental_start_date").value;
    var end_date = document.querySelector("#rental_end_date").value; 
    var newStart = new Date(start_date);
    var newEnd = new Date(end_date);
    var timeDiff = Math.abs(newEnd.getTime() - newStart.getTime());
    var diffDays = Math.ceil(timeDiff / (1000*3600 *24));
    var price = Number(document.querySelector("#space-price").innerText.replace( /,/, '' ));
    var totalPrice = diffDays * price;
    
    if (isNaN(totalPrice)) {
      var totalPriceFormatted = "Please choose a date range";
  } else {
      totalPriceFormatted
      var totalPriceFormatted = totalPrice.toLocaleString(
        'en-US', { minimumFractionDigits: 2 }
      );
      
  }
    
    var totalElement = document.getElementById("total");
    console.log("quitamos clase");
    loader.classList.toggle("loader-4");
    totalElement.innerHTML = `<strong><p>Total: $${totalPriceFormatted}</p></strong>`
    
   },2000);
});

