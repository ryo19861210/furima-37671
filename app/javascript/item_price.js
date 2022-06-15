window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     const addTaXDom = document.getElementById("add-tax-price");
     addTaXDom.innerHTML = (Math.floor(inputValue*0.1));
     const profitValue = document.getElementById("profit");
     const taxValue = (inputValue * 0.1);
     profitValue.innerHTML = (Math.floor(inputValue - taxValue));
  })});