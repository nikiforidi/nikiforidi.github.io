/**
 * Mr. House TV Display - Two-Row Header Layout
 * Fallout: New Vegas Inspired
 * Quote UNDER TV display in site header
 */
(function () {
  "use strict";

  // Mr. House quotes from Fallout: New Vegas
  const quotes = [
    "The House always wins.",
    "I am the House, and the House is me.",
    "I've calculated every possible outcome.",
    "New Vegas is my city.",
    "Humanity's survival depends on strong leadership.",
    "I've lived for over two centuries.",
    "The Three Families are my employees.",
    "Yes Man is a temporary solution.",
    "My vision for Vegas is one of order.",
    "The Courier? Merely another variable.",
  ];

  let noiseCanvas, noiseCtx, animationFrame;
  let currentQuoteIndex = 0;
  let isModalOpen = false;

  // ============================================================================
  // CRT POWER-ON EFFECT
  // ============================================================================
  function triggerPowerOn() {
    const tvScreen = document.querySelector(".mr-house-screen");
    const tvBlock = document.querySelector(".crt-block");
    const header = document.querySelector(".site-header");

    if (!tvScreen || !tvBlock) return;

    // Add power-on class to TV
    tvBlock.classList.add("crt-power-on");
    tvScreen.classList.add("crt-power-on");

    // Optional: Add subtle power-on to header
    if (header) {
      header.classList.add("crt-power-on-subtle");
    }

    // Remove classes after animation completes
    setTimeout(() => {
      tvBlock.classList.remove("crt-power-on");
      tvScreen.classList.remove("crt-power-on");
      if (header) {
        header.classList.remove("crt-power-on-subtle");
      }
    }, 2000);
  }

  // ============================================================================
  // CRT NOISE EFFECT
  // ============================================================================

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

    // Throttled animation for performance
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

    // Handle resize
    window.addEventListener("resize", () => {
      noiseCanvas.width = noiseCanvas.offsetWidth * scale;
      noiseCanvas.height = noiseCanvas.offsetHeight * scale;
    });
  }

  // ============================================================================
  // QUOTE ROTATION
  // ============================================================================

  function rotateQuote() {
    const quoteElement = document.getElementById("mr-house-quote-text");
    if (!quoteElement || isModalOpen) return;

    // Fade out
    quoteElement.style.opacity = "0";
    quoteElement.style.transition = "opacity 0.5s ease";

    setTimeout(() => {
      // Change quote
      currentQuoteIndex = (currentQuoteIndex + 1) % quotes.length;
      quoteElement.textContent = `"${quotes[currentQuoteIndex]}"`;

      // Fade in
      quoteElement.style.opacity = "1";
    }, 500);
  }

  // ============================================================================
  // MODAL DISPLAY
  // ============================================================================

  function createModal() {
    // Check if modal already exists
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

    // Close handlers
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

    // Show current quote in modal
    quoteText.textContent = `"${quotes[currentQuoteIndex]}"`;

    modal.classList.add("active");
    backdrop.classList.add("active");
    isModalOpen = true;

    // Pause quote rotation while modal is open
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

    // Resume quote rotation
    window.mrHouseQuoteInterval = setInterval(rotateQuote, 8000);
  }

  // ============================================================================
  // TV CLICK INTERACTION
  // ============================================================================

  function initTVInteraction() {
    const mrHouseTV = document.querySelector(".mr-house-tv");
    if (!mrHouseTV) return;

    // Click TV to show full quote
    mrHouseTV.addEventListener("click", showModal);

    // Hover effect
    mrHouseTV.addEventListener("mouseenter", () => {
      mrHouseTV.style.transform = "scale(1.1)";
      mrHouseTV.style.boxShadow = "0 0 25px rgba(255, 176, 0, 0.6)";
    });

    mrHouseTV.addEventListener("mouseleave", () => {
      mrHouseTV.style.transform = "scale(1)";
      mrHouseTV.style.boxShadow = "0 0 15px rgba(255, 176, 0, 0.4)";
    });
  }
  // ============================================================================
  // INITIALIZATION
  // ============================================================================
  function init() {
    // Wait for DOM to be ready
    if (document.readyState === "loading") {
      document.addEventListener("DOMContentLoaded", start);
    } else {
      start();
    }

    function start() {
      // Trigger power-on effect FIRST (with sound)
      triggerPowerOn();

      // Initialize CRT noise
      initNoise();

      // Create modal
      createModal();

      // Initialize TV interaction
      initTVInteraction();

      // Start quote rotation (every 8 seconds)
      window.mrHouseQuoteInterval = setInterval(rotateQuote, 8000);

      console.log("📺 Mr. House TV Display initialized");
    }
  }

  // Start everything
  init();

  // Cleanup on page unload
  window.addEventListener("beforeunload", () => {
    if (animationFrame) {
      cancelAnimationFrame(animationFrame);
    }
    if (window.mrHouseQuoteInterval) {
      clearInterval(window.mrHouseQuoteInterval);
    }
  });
})();
