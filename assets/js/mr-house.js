/**
 * Mr. House TV Display
 */
(function () {
  "use strict";

  const quotes = [
    "The House always wins.",
    "I am the House, and the House is me.",
    "I've calculated every possible outcome.",
    "New Vegas is my city.",
    "Humanity's survival depends on strong leadership.",
  ];

  let noiseCanvas, noiseCtx, animationFrame;
  let currentQuoteIndex = 0;
  let isModalOpen = false;

  function initNoise() {
    noiseCanvas = document.getElementById("mr-house-noise");
    if (!noiseCanvas) return;

    const scale = 0.25;
    noiseCanvas.width = noiseCanvas.offsetWidth * scale;
    noiseCanvas.height = noiseCanvas.offsetHeight * scale;

    function generateNoise() {
      const w = noiseCanvas.width;
      const h = noiseCanvas.height;
      const imageData = noiseCtx.createImageData(w, h);
      const data = imageData.data;

      for (let i = 0; i < data.length; i += 4) {
        const val = Math.random() * 255;
        data[i] = val;
        data[i + 1] = val;
        data[i + 2] = val;
        data[i + 3] = 255;
      }
      noiseCtx.putImageData(imageData, 0, 0);
    }

    noiseCtx = noiseCanvas.getContext("2d");

    let lastTime = 0;
    const fps = 12;
    const frameDuration = 1000 / fps;

    function animate(timestamp) {
      if (timestamp - lastTime >= frameDuration) {
        generateNoise();
        lastTime = timestamp;
      }
      animationFrame = requestAnimationFrame(animate);
    }

    animationFrame = requestAnimationFrame(animate);

    window.addEventListener("resize", () => {
      noiseCanvas.width = noiseCanvas.offsetWidth * scale;
      noiseCanvas.height = noiseCanvas.offsetHeight * scale;
    });
  }

  function rotateQuote() {
    const quoteElement = document.getElementById("mr-house-quote-text");
    if (!quoteElement || isModalOpen) return;

    quoteElement.style.opacity = "0";
    quoteElement.style.transition = "opacity 0.5s ease";

    setTimeout(() => {
      currentQuoteIndex = (currentQuoteIndex + 1) % quotes.length;
      quoteElement.textContent = `"${quotes[currentQuoteIndex]}"`;
      quoteElement.style.opacity = "1";
    }, 500);
  }

  function createModal() {
    if (document.getElementById("mr-house-modal")) return;

    const backdrop = document.createElement("div");
    backdrop.className = "mr-house-backdrop";
    backdrop.id = "mr-house-backdrop";

    const modal = document.createElement("div");
    modal.className = "mr-house-modal";
    modal.id = "mr-house-modal";

    const quoteText = document.createElement("p");
    quoteText.className = "mr-house-modal-quote";
    quoteText.id = "mr-house-modal-quote";

    const closeBtn = document.createElement("div");
    closeBtn.className = "mr-house-modal-close";
    closeBtn.innerHTML =
      '<button class="mr-house-btn" id="mr-house-close">Accept</button>';

    modal.appendChild(quoteText);
    modal.appendChild(closeBtn);
    document.body.appendChild(backdrop);
    document.body.appendChild(modal);

    document
      .getElementById("mr-house-close")
      .addEventListener("click", closeModal);
    backdrop.addEventListener("click", closeModal);
    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape") closeModal();
    });
  }

  function showModal() {
    if (isModalOpen) return;

    const modal = document.getElementById("mr-house-modal");
    const backdrop = document.getElementById("mr-house-backdrop");
    const quoteText = document.getElementById("mr-house-modal-quote");

    if (!modal || !backdrop || !quoteText) return;

    quoteText.textContent = `"${quotes[currentQuoteIndex]}"`;

    modal.classList.add("active");
    backdrop.classList.add("active");
    isModalOpen = true;

    if (window.mrHouseQuoteInterval) {
      clearInterval(window.mrHouseQuoteInterval);
    }
  }

  function closeModal() {
    const modal = document.getElementById("mr-house-modal");
    const backdrop = document.getElementById("mr-house-backdrop");

    if (!modal || !backdrop) return;

    modal.classList.remove("active");
    backdrop.classList.remove("active");
    isModalOpen = false;

    window.mrHouseQuoteInterval = setInterval(rotateQuote, 8000);
  }

  function initTVInteraction() {
    const mrHouseTV = document.querySelector(".mr-house-tv");
    if (!mrHouseTV) return;

    mrHouseTV.addEventListener("click", showModal);

    mrHouseTV.addEventListener("mouseenter", () => {
      mrHouseTV.style.transform = "scale(1.1)";
      mrHouseTV.style.boxShadow = "0 0 25px rgba(255, 176, 0, 0.6)";
    });

    mrHouseTV.addEventListener("mouseleave", () => {
      mrHouseTV.style.transform = "scale(1)";
      mrHouseTV.style.boxShadow = "0 0 15px rgba(255, 176, 0, 0.4)";
    });
  }

  function init() {
    if (document.readyState === "loading") {
      document.addEventListener("DOMContentLoaded", start);
    } else {
      start();
    }

    function start() {
      initNoise();
      createModal();
      initTVInteraction();
      window.mrHouseQuoteInterval = setInterval(rotateQuote, 8000);
      console.log("📺 Mr. House TV Display initialized");
    }
  }

  init();

  window.addEventListener("beforeunload", () => {
    if (animationFrame) cancelAnimationFrame(animationFrame);
    if (window.mrHouseQuoteInterval) clearInterval(window.mrHouseQuoteInterval);
  });
})();