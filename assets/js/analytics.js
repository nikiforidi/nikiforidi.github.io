/**
 * Custom Google Analytics Events
 * Tracks user interactions beyond page views
 */
(function () {
  "use strict";

  // Check if gtag is available
  if (typeof gtag !== "function") {
    console.log("📊 GA4 not initialized");
    return;
  }

  console.log("📊 Analytics initialized");

  // Track Mr. House TV clicks
  const mrHouseTV = document.querySelector(".mr-house-tv");
  if (mrHouseTV) {
    mrHouseTV.addEventListener("click", () => {
      gtag("event", "mr_house_click", {
        event_category: "engagement",
        event_label: "TV Modal Opened",
      });
    });
  }

  // Track navigation clicks
  document.querySelectorAll(".nav-link").forEach((link) => {
    link.addEventListener("click", () => {
      gtag("event", "navigation_click", {
        event_category: "navigation",
        event_label: link.textContent.trim(),
      });
    });
  });

  // Track manifesto quote link
  const manifestoLink = document.querySelector(".quote-source a");
  if (manifestoLink) {
    manifestoLink.addEventListener("click", () => {
      gtag("event", "manifesto_read", {
        event_category: "engagement",
        event_label: "Manifesto Link Clicked",
      });
    });
  }

  // Track external links
  document.querySelectorAll('a[href^="http"]').forEach((link) => {
    if (!link.href.includes(window.location.hostname)) {
      link.addEventListener("click", () => {
        gtag("event", "external_link", {
          event_category: "outbound",
          event_label: link.href,
        });
      });
    }
  });

  // Track terminal interactions (if present)
  const terminals = document.querySelectorAll("[data-terminal]");
  terminals.forEach((terminal, index) => {
    terminal.addEventListener("click", () => {
      gtag("event", "terminal_interaction", {
        event_category: "engagement",
        event_label: `Terminal ${index + 1}`,
      });
    });
  });

  // Track time on page (after 30 seconds)
  setTimeout(() => {
    gtag("event", "time_on_page", {
      event_category: "engagement",
      event_label: "30 seconds",
      value: 30,
    });
  }, 30000);

  // Track scroll depth (50%, 75%, 100%)
  let scrollTracked = { 50: false, 75: false, 100: false };

  window.addEventListener("scroll", () => {
    const scrollPercent = Math.round(
      (window.scrollY /
        (document.documentElement.scrollHeight - window.innerHeight)) *
        100,
    );

    [50, 75, 100].forEach((threshold) => {
      if (scrollPercent >= threshold && !scrollTracked[threshold]) {
        scrollTracked[threshold] = true;
        gtag("event", "scroll_depth", {
          event_category: "engagement",
          event_label: `${threshold}%`,
          value: threshold,
        });
      }
    });
  });
})();
