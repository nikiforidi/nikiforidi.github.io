// =====================================================
// THEME TOGGLE + TYPING EFFECT
// Retro Terminal Theme | Persistent Storage | Smooth Transition
// =====================================================

(function() {
    const THEME_KEY = 'portfolio-theme';
    const DARK_THEME = 'dark';
    const LIGHT_THEME = 'light';

    // Get saved theme or default to light
    function getSavedTheme() {
        return localStorage.getItem(THEME_KEY) || LIGHT_THEME;
    }

    // Save theme to localStorage
    function saveTheme(theme) {
        localStorage.setItem(THEME_KEY, theme);
    }

    // Apply theme to document
    function applyTheme(theme) {
        if (theme === DARK_THEME) {
            document.documentElement.setAttribute('data-theme', DARK_THEME);
        } else {
            document.documentElement.removeAttribute('data-theme');
        }
    }

    // Toggle theme
    function toggleTheme() {
        const currentTheme = document.documentElement.getAttribute('data-theme');
        const newTheme = currentTheme === DARK_THEME ? LIGHT_THEME : DARK_THEME;
        applyTheme(newTheme);
        saveTheme(newTheme);
        updateToggleButton(newTheme);
        console.log('Theme switched to:', newTheme);
    }

    // Update toggle button icon
    function updateToggleButton(theme) {
        const toggleBtn = document.querySelector('.theme-toggle');
        if (toggleBtn) {
            toggleBtn.textContent = theme === DARK_THEME ? '☀️' : '🌙';
            toggleBtn.setAttribute('aria-label', 
                theme === DARK_THEME ? 'Switch to light mode' : 'Switch to dark mode'
            );
        }
    }

    // Create toggle button
    function createToggleButton() {
        // Check if button already exists
        if (document.querySelector('.theme-toggle')) {
            console.log('Toggle button already exists');
            return;
        }

        const toggleBtn = document.createElement('button');
        toggleBtn.className = 'theme-toggle';
        toggleBtn.setAttribute('aria-label', 'Toggle dark mode');
        toggleBtn.setAttribute('type', 'button');
        toggleBtn.addEventListener('click', toggleTheme);
        document.body.appendChild(toggleBtn);
        console.log('Toggle button created');
        return toggleBtn;
    }

    // Typing effect for home page header only
    function applyTypingEffect() {
        // Only apply on home page
        if (!document.body.classList.contains('home')) {
            return;
        }

        // Find the "Welcome, Traveler" h2 element
        const welcomeHeader = document.querySelector('.home h2:first-of-type');
        
        if (!welcomeHeader) {
            return;
        }

        // Get the original text (without the cursor span)
        const originalText = welcomeHeader.textContent.trim();
        
        // Clear the header
        welcomeHeader.textContent = '';
        
        // Create cursor span
        const cursorSpan = document.createElement('span');
        cursorSpan.className = 'cursor-blink';
        
        // Add cursor to header
        welcomeHeader.appendChild(cursorSpan);
        
        // Typing animation
        let i = 0;
        const typingSpeed = 80; // ms per character
        
        const typeWriter = () => {
            if (i < originalText.length) {
                // Insert character before cursor
                const char = originalText.charAt(i);
                const textNode = document.createTextNode(char);
                welcomeHeader.insertBefore(textNode, cursorSpan);
                i++;
                setTimeout(typeWriter, typingSpeed);
            }
        };
        
        // Start typing after a short delay
        setTimeout(typeWriter, 500);
        
        console.log('Typing effect applied to home page header');
    }

    // Initialize theme on page load
    function initTheme() {
        const savedTheme = getSavedTheme();
        applyTheme(savedTheme);
        createToggleButton();
        updateToggleButton(savedTheme);
        console.log('Theme initialized:', savedTheme);
        
        // Apply typing effect after theme is set
        setTimeout(applyTypingEffect, 300);
    }

    // Run when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initTheme);
    } else {
        initTheme();
    }
})();