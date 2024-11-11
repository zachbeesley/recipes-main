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


const scrollers = document.querySelectorAll('.scroller');

if (!window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
  addAnimation();
}

function addAnimation() {
  scrollers.forEach(scroller => {
    scroller.setAttribute('data-animated', true);

    const scrollerInner = scroller.querySelector('.scroller__inner');
    const scrollerContent = Array.from(scrollerInner.children);


    scrollerContent.forEach(item => {
      const duplicatedItem = item.cloneNode(true);
      duplicatedItem.setAttribute('aria-hidden', true);
      scrollerInner.appendChild(duplicatedItem);

    
    })

})}

const scrollersReverse = document.querySelectorAll('.scroller-reverse');

if (!window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
  addAnimationReverse();
}

function addAnimationReverse() {
  scrollersReverse.forEach(scrollerReverse => {
    scrollerReverse.setAttribute('data-animated', true);

    const scrollerInnerReverse = scrollerReverse.querySelector('.scroller__inner-reverse');
    const scrollerContentReverse = Array.from(scrollerInnerReverse.children);


    scrollerContentReverse.forEach(item => {
      const duplicatedItem = item.cloneNode(true);
      duplicatedItem.setAttribute('aria-hidden', true);
      scrollerInnerReverse.appendChild(duplicatedItem);

    
    })
  })}

