// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "bootstrap"

document.addEventListener("DOMContentLoaded", () => {
  const copyBtn = document.getElementById("copy-btn");
  const outputField = document.getElementById("output-field");

  if (copyBtn && outputField) {
    copyBtn.addEventListener("click", () => {
      navigator.clipboard.writeText(outputField.value).then(() => {
        alert("コピーしました！");
      });
    });
  }
});