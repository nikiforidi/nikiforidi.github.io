// =====================================================
// THEME TOGGLE + TYPING EFFECT + BLINKING CURSOR
// =====================================================

(function() {
    const THEME_KEY = 'portfolio-theme';
    const DARK_THEME = 'dark';
    const LIGHT_THEME = 'light';

    // Get saved theme
    function getSavedTheme() {
        return localStorage.getItem(THEME_KEY) || LIGHT_THEME;
    }

    // Save theme
    function saveTheme(theme) {
        localStorage.setItem(THEME_KEY, theme);
    }

    // Apply theme
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
        console.log('[THEME] Switched to:', newTheme);
    }

    // Update toggle button
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
        if (document.querySelector('.theme-toggle')) {
            console.log('[THEME] Toggle button already exists');
            return;
        }

        const toggleBtn = document.createElement('button');
        toggleBtn.className = 'theme-toggle';
        toggleBtn.setAttribute('aria-label', 'Toggle dark mode');
        toggleBtn.setAttribute('type', 'button');
        toggleBtn.addEventListener('click', toggleTheme);
        document.body.appendChild(toggleBtn);
        console.log('[THEME] Toggle button created');
    }

    // Typing effect for home page header
    function applyTypingEffect() {
        // Only on home page
        if (!document.body.classList.contains('home')) {
            console.log('[TYPING] Not home page, skipping');
            return;
        }

        // Find the h2 header
        const header = document.querySelector('h2');
        if (!header) {
            console.log('[TYPING] No h2 header found');
            return;
        }

        // Get original text
        const originalText = header.textContent.trim();
        if (!originalText) {
            console.log('[TYPING] No text content');
            return;
        }

        // Clear header
        header.textContent = '';

        // Create cursor span
        const cursor = document.createElement('span');
        cursor.className = 'cursor-blink';
        cursor.textContent = '█';
        header.appendChild(cursor);

        // Typing animation
        let i = 0;
        const speed = 80;

        function type() {
            if (i < originalText.length) {
                const char = document.createTextNode(originalText.charAt(i));
                header.insertBefore(char, cursor);
                i++;
                setTimeout(type, speed);
            }
        }

        setTimeout(type, 500);
        console.log('[TYPING] Animation started for:', originalText);
    }

    // Initialize everything
    function init() {
        const savedTheme = getSavedTheme();
        applyTheme(savedTheme);
        createToggleButton();
        updateToggleButton(savedTheme);
        console.log('[THEME] Initialized:', savedTheme);

        // Apply typing effect
        setTimeout(applyTypingEffect, 300);
    }

    // Run when ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();