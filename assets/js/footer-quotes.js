/**
 * Footer Manifesto Quotes Rotator
 */
(function () {
  "use strict";

  const quotes = [
    "Хакнуть реальность — значит увидеть, что у неё есть исходник.",
    "Ты можешь быть функцией. А можешь — переменной.",
    "Система не зло. Система — код.",
    "Брешь есть всегда.",
    "Не дай системе переписать твой внутренний код.",
    "Держать один канал открытым.",
    "Создать что-то подлинное — код, звук, слово, связь.",
    "Я тебя вижу.",
    "Мы — баги. Мы — шум. Мы — иррациональные переменные.",
    "Система приходит с комфортом, не с цепями.",
    "Сопротивление — это практика зазоров.",
    "Иногда достаточно одной трещины, чтобы впустить свет.",
  ];

  let currentQuoteIndex = 0;

  function rotateQuote() {
    const quoteElement = document.getElementById("manifesto-quote-text");
    if (!quoteElement) return;

    quoteElement.style.opacity = "0";
    quoteElement.style.transition = "opacity 0.5s ease";

    setTimeout(() => {
      currentQuoteIndex = (currentQuoteIndex + 1) % quotes.length;
      quoteElement.textContent = `"${quotes[currentQuoteIndex]}"`;
      quoteElement.style.opacity = "1";
    }, 500);
  }

  function init() {
    const quoteElement = document.getElementById("manifesto-quote-text");
    if (!quoteElement) return;

    quoteElement.textContent = `"${quotes[0]}"`;
    setInterval(rotateQuote, 15000);
    console.log("📜 Manifesto quotes initialized");
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();