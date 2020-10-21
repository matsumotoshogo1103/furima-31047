function price() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener("input", () => {
    const priceValue = itemPrice.value;
    addTaxPrice.innerHTML = Math.floor( priceValue / 10 ); 
    profit.innerHTML = priceValue - addTaxPrice.innerHTML
  });
}

window.addEventListener("load", price);