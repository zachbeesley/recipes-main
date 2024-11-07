// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"
import "vanilla-nested"


document.addEventListener("turbo:load", () => {
    const batchSizeSelector = document.getElementById("batch-size");
    const servingSizeElement = document.getElementById("serving-size");
    const originalServingSize = parseFloat(servingSizeElement.textContent);
  
    const ingredientElements = document.querySelectorAll(".single-ingredient");
  
    function updateAmounts() {
      const batchSize = parseInt(batchSizeSelector.value) || 1;
  
      // Update serving size
      const adjustedServingSize = (originalServingSize * batchSize).toFixed(0);
      servingSizeElement.textContent = adjustedServingSize;
  
      // Update each ingredient amount
      ingredientElements.forEach(item => {
        const amountElement = item.querySelector(".ingredient-amount");
        const originalAmount = parseFloat(item.getAttribute("data-amount"));
        const adjustedAmount = (originalAmount * batchSize).toFixed(2);
  
        amountElement.textContent = adjustedAmount;
      });
    }
  
    batchSizeSelector.addEventListener("change", updateAmounts);
  });



