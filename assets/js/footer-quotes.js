/**
 * Footer Manifesto Quotes Rotator
 * Rotates quotes from REALITY_PROTOCOL.txt
 */
(function () {
  "use strict";

  // Manifesto quotes from REALITY_PROTOCOL.txt (English)
  const quotes = [
    "To hack reality is to see that it has source code.",
    "You can be a function. Or you can be a variable.",
    "The system is not evil. The system is code.",
    "There is always a breach.",
    "Don't let the system rewrite your internal code.",
    "Keep one channel open.",
    "Create something authentic — code, sound, word, connection.",
    "I see you.",
    "We are bugs. We are noise. We are irrational variables.",
    "The system comes with comfort, not chains.",
    "Resistance is the practice of gaps.",
    "Sometimes one crack is enough to let the light in.",
    "To hack reality is not to break it.",
    "Meaning is not written in the config.",
    "You stand on the shoulders of those who already saw the code.",
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
