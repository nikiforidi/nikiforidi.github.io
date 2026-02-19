// Theme Toggle Functionality
(function() {
    const THEME_KEY = 'portfolio-theme';
    const DARK_THEME = 'dark';
    const LIGHT_THEME = 'light';

    function getSavedTheme() {
        return localStorage.getItem(THEME_KEY) || LIGHT_THEME;
    }

    function saveTheme(theme) {
        localStorage.setItem(THEME_KEY, theme);
    }

    function applyTheme(theme) {
        if (theme === DARK_THEME) {
            document.documentElement.setAttribute('data-theme', DARK_THEME);
        } else {
            document.documentElement.removeAttribute('data-theme');
        }
    }

    function toggleTheme() {
        const currentTheme = document.documentElement.getAttribute('data-theme');
        const newTheme = currentTheme === DARK_THEME ? LIGHT_THEME : DARK_THEME;
        applyTheme(newTheme);
        saveTheme(newTheme);
        updateToggleButton(newTheme);
    }

    function updateToggleButton(theme) {
        const toggleBtn = document.querySelector('.theme-toggle');
        if (toggleBtn) {
            toggleBtn.textContent = theme === DARK_THEME ? '☀️' : '🌙';
            toggleBtn.setAttribute('aria-label', 
                theme === DARK_THEME ? 'Switch to light mode' : 'Switch to dark mode'
            );
        }
    }

    function createToggleButton() {
        const toggleBtn = document.createElement('button');
        toggleBtn.className = 'theme-toggle';
        toggleBtn.setAttribute('aria-label', 'Toggle dark mode');
        toggleBtn.setAttribute('type', 'button');
        toggleBtn.addEventListener('click', toggleTheme);
        document.body.appendChild(toggleBtn);
        return toggleBtn;
    }

    function initTheme() {
        const savedTheme = getSavedTheme();
        applyTheme(savedTheme);
        createToggleButton();
        updateToggleButton(savedTheme);
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initTheme);
    } else {
        initTheme();
    }
})();