window.addEventListener('load', function(){

  const calculatePrice = document.getElementById("item-price");

  calculatePrice.addEventListener('input', function(){
    let pricetax = calculatePrice.value * 0.1;
    document.getElementById("add-tax-price").innerHTML = pricetax;

    let priceprofit = calculatePrice.value * 0.9;
    document.getElementById("profit").innerHTML = priceprofit;

  });
});