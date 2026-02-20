// =====================================================
// RETRO TERMINAL: Theme Toggle + Typing Effect
// Portfolio: nikiforidi.github.io
// =====================================================

(function() {
    'use strict';

    const THEME_KEY = 'portfolio-theme';
    const DARK = 'dark';
    const LIGHT = 'light';

    // --- THEME FUNCTIONS ---
    function getTheme() {
        return localStorage.getItem(THEME_KEY) || LIGHT;
    }

    function setTheme(theme) {
        localStorage.setItem(THEME_KEY, theme);
        if (theme === DARK) {
            document.documentElement.setAttribute('data-theme', DARK);
        } else {
            document.documentElement.removeAttribute('data-theme');
        }
    }

    function createToggleButton() {
        // Don't create if already exists
        if (document.querySelector('.theme-toggle')) {
            console.log('[THEME] Toggle button already exists');
            return;
        }

        const btn = document.createElement('button');
        btn.className = 'theme-toggle';
        btn.type = 'button';
        btn.setAttribute('aria-label', 'Toggle dark mode');
        
        btn.addEventListener('click', function() {
            const newTheme = getTheme() === DARK ? LIGHT : DARK;
            setTheme(newTheme);
            btn.textContent = newTheme === DARK ? '☀️' : '🌙';
            console.log('[THEME] Switched to:', newTheme);
        });

        document.body.appendChild(btn);
        btn.textContent = getTheme() === DARK ? '☀️' : '🌙';
        console.log('[THEME] Button created');
    }

    // --- TYPING EFFECT (First H2 Only on Home Page) ---
    function applyTypingEffect() {
        // Only on home page
        const isHome = document.body.classList.contains('home');
        console.log('[TYPING] Is home page:', isHome);

        if (!isHome) {
            return;
        }

        // Target ONLY the first h2 on home page
        const header = document.querySelector('.home h2:first-of-type');
        console.log('[TYPING] Header found:', !!header);

        if (!header) {
            console.log('[TYPING] No h2 header found');
            return;
        }

        // Store original text
        const originalText = header.textContent.trim();
        console.log('[TYPING] Text:', originalText);

        if (!originalText) {
            console.log('[TYPING] No text content');
            return;
        }

        // Clear header content
        header.textContent = '';

        // Type characters
        let i = 0;
        const speed = 80; // ms per character

        function type() {
            if (i < originalText.length) {
                header.textContent += originalText.charAt(i);
                i++;
                setTimeout(type, speed);
            } else {
                // CHANGED: Add class to start cursor blink after typing completes
                header.classList.add('typing-complete');
                console.log('[TYPING] Complete');
            }
        }

        // Start typing after delay
        setTimeout(type, 500);
        console.log('[TYPING] Started');
    }

    // --- INITIALIZE ---
    function init() {
        console.log('[INIT] Starting...');
        console.log('[INIT] Saved theme:', getTheme());
        
        setTheme(getTheme());
        createToggleButton();
        
        // Apply typing effect after theme is set
        setTimeout(applyTypingEffect, 300);
    }

    // Run when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();