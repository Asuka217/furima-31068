
function calculatePrice() {

  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const totalProfit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    totalProfit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML)
  });
}

window.addEventListener('click', calculatePrice)