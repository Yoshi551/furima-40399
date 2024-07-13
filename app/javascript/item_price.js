const price = () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  const taxPrice = Math.floor(inputValue / 10);
  addTaxDom.innerHTML = taxPrice;

  const profit = Math.floor(inputValue - taxPrice);
  profitDom.innerHTML = profit;
})
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);