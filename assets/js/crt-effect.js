```javascript
/**
 * CRT TV Effect for Code Blocks & ASCII Art
 * Adds animated noise and scanlines to elements with class "crt-block"
 * Progressive enhancement: degrades gracefully if canvas unsupported
 */
(function() {
  'use strict';

  // Skip if canvas not supported or reduced motion preferred
  if (!document.createElement('canvas').getContext || 
      window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    return;
  }

  // Initialize CRT effect on matching blocks
  function initCRTBlocks() {
    const blocks = document.querySelectorAll('.crt-block');
    
    blocks.forEach(block => {
      // Skip if already initialized
      if (block.dataset.crtInitialized) return;
      block.dataset.crtInitialized = 'true';

      // Create canvas for noise
      const canvas = document.createElement('canvas');
      canvas.className = 'crt-canvas';
      block.insertBefore(canvas, block.firstChild);

      const ctx = canvas.getContext('2d');
      
      // Low-res canvas for performance
      const scale = 0.2;
      let width, height;

      function resize() {
        width = block.offsetWidth;
        height = block.offsetHeight;
        canvas.width = width * scale;
        canvas.height = height * scale;
      }

      // Generate noise frame
      function generateNoise() {
        const w = canvas.width;
        const h = canvas.height;
        const imageData = ctx.createImageData(w, h);
        const data = imageData.data;
        
        // Random grayscale noise
        for (let i = 0; i < data.length; i += 4) {
          const val = Math.random() * 255;
          data[i] = val;     // R
          data[i+1] = val;   // G
          data[i+2] = val;   // B
          data[i+3] = 255;   // A
        }
        ctx.putImageData(imageData, 0, 0);
      }

      // Animation loop (throttled)
      let animationFrame;
      const fps = 12;
      const frameDuration = 1000 / fps;
      let lastTime = 0;

      function animate(timestamp) {
        if (timestamp - lastTime >= frameDuration) {
          generateNoise();
          lastTime = timestamp;
        }
        animationFrame = requestAnimationFrame(animate);
      }

      // Initialize
      resize();
      animationFrame = requestAnimationFrame(animate);

      // Handle resize
      const resizeObserver = new ResizeObserver(resize);
      resizeObserver.observe(block);

      // Optional: power-on animation
      setTimeout(() => block.classList.add('crt-power-on'), 100);
    });
  }

  // Auto-wrap code blocks and ASCII art with CRT container
  function wrapCodeBlocks() {
    // Wrap pre > code blocks
    document.querySelectorAll('pre code').forEach(code => {
      const pre = code.parentElement;
      if (!pre.closest('.crt-block')) {
        const wrapper = document.createElement('div');
        wrapper.className = 'crt-block';
        pre.parentNode.insertBefore(wrapper, pre);
        wrapper.appendChild(pre);
      }
    });

    // Wrap ASCII art (detect by monospace + box-drawing chars)
    document.querySelectorAll('pre').forEach(pre => {
      const text = pre.textContent;
      // Simple heuristic: contains box-drawing characters
      if (/[\u2500-\u257F\u2580-\u259F]/.test(text) && !pre.closest('.crt-block')) {
        pre.classList.add('ascii-art');
        const wrapper = document.createElement('div');
        wrapper.className = 'crt-block';
        pre.parentNode.insertBefore(wrapper, pre);
        wrapper.appendChild(pre);
      }
    });
  }

  // Initialize on DOM ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
      wrapCodeBlocks();
      initCRTBlocks();
    });
  } else {
    wrapCodeBlocks();
    initCRTBlocks();
  }

  // Reinitialize after Jekyll navigation (if using AJAX)
  document.addEventListener('jekyll:loaded', () => {
    wrapCodeBlocks();
    initCRTBlocks();
  });
})();
```