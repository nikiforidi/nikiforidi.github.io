/**
 * Terminal Typing Animation
 * Fallout: New Vegas Inspired
 */
(function () {
  "use strict";

  class TerminalTypewriter {
    constructor(element, options = {}) {
      this.element =
        typeof element === "string" ? document.querySelector(element) : element;

      if (!this.element) return;

      this.options = {
        typeSpeed: 50, // ms per character
        lineDelay: 300, // ms between lines
        cursorBlink: true,
        startOnLoad: true,
        loop: false,
        ...options,
      };

      this.lines = [];
      this.currentLine = 0;
      this.currentChar = 0;
      this.isTyping = false;
      this.cursor = null;

      this.init();
    }

    init() {
      // Parse content from data attribute or innerHTML
      const content = this.element.getAttribute("data-terminal");
      if (content) {
        this.lines = content.split("\\n").map((line) => line.trim());
        this.element.innerHTML = "";
      } else {
        // Parse existing content
        this.lines = Array.from(this.element.children).map((el) => ({
          type: el.classList.contains("terminal-prompt") ? "prompt" : "output",
          text: el.textContent,
        }));
        this.element.innerHTML = "";
      }

      // Create cursor
      if (this.options.cursorBlink) {
        this.cursor = document.createElement("span");
        this.cursor.className = "terminal-cursor";
        this.cursor.textContent = "█";
      }

      if (this.options.startOnLoad) {
        setTimeout(() => this.start(), 500);
      }
    }

    async start() {
      if (this.isTyping) return;
      this.isTyping = true;
      this.currentLine = 0;
      this.currentChar = 0;

      await this.typeAllLines();

      if (this.options.loop) {
        setTimeout(() => {
          this.element.innerHTML = "";
          this.start();
        }, 3000);
      }
    }

    async typeAllLines() {
      for (let i = 0; i < this.lines.length; i++) {
        await this.typeLine(this.lines[i]);
        if (i < this.lines.length - 1) {
          await this.delay(this.options.lineDelay);
        }
      }
      this.isTyping = false;
    }

    async typeLine(line) {
      const lineElement = document.createElement("div");
      lineElement.className = "terminal-line";

      // Check if it's a prompt line
      const isPrompt = typeof line === "object" && line.type === "prompt";
      const text = typeof line === "object" ? line.text : line;

      if (isPrompt) {
        const promptSpan = document.createElement("span");
        promptSpan.className = "terminal-prompt";
        promptSpan.textContent = "$ ";
        lineElement.appendChild(promptSpan);
      }

      const textSpan = document.createElement("span");
      textSpan.className = "terminal-output";
      lineElement.appendChild(textSpan);

      if (this.cursor && this.currentLine === this.lines.length - 1) {
        lineElement.appendChild(this.cursor.cloneNode(true));
      }

      this.element.appendChild(lineElement);

      // Type character by character
      for (let i = 0; i < text.length; i++) {
        textSpan.textContent += text[i];
        await this.delay(this.options.typeSpeed);

        // Scroll to bottom
        this.element.scrollTop = this.element.scrollHeight;
      }

      this.currentLine++;
    }

    delay(ms) {
      return new Promise((resolve) => setTimeout(resolve, ms));
    }

    // Manual control methods
    pause() {
      this.isTyping = false;
    }

    resume() {
      if (!this.isTyping) {
        this.start();
      }
    }

    clear() {
      this.element.innerHTML = "";
      this.currentLine = 0;
      this.currentChar = 0;
    }

    setText(newLines) {
      this.lines = newLines;
      this.clear();
      this.start();
    }
  }

  // Auto-initialize on DOM load
  function initTerminals() {
    const terminals = document.querySelectorAll("[data-terminal]");
    terminals.forEach((el) => {
      new TerminalTypewriter(el, {
        typeSpeed: 40,
        lineDelay: 200,
        cursorBlink: true,
        startOnLoad: true,
      });
    });

    // Also initialize elements with .terminal-typing class
    const typingTerminals = document.querySelectorAll(".terminal-typing");
    typingTerminals.forEach((el) => {
      new TerminalTypewriter(el, {
        typeSpeed: 50,
        lineDelay: 300,
        cursorBlink: true,
        startOnLoad: true,
      });
    });
  }

  // Initialize when DOM is ready
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initTerminals);
  } else {
    initTerminals();
  }

  // Export for manual use
  window.TerminalTypewriter = TerminalTypewriter;
})();
