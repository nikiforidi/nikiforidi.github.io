// =====================================================
// FALLOUT TERMINAL TYPING EFFECT
// Types out H1 headings on load
// =====================================================

(function() {
    // Wait for DOM to be ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initTypingEffect);
    } else {
        initTypingEffect();
    }

    function initTypingEffect() {
        // Find all H1 headings on the page
        const headings = document.querySelectorAll('h1');
        
        headings.forEach((heading, index) => {
            // Skip the first H1 on home page (site title) if needed
            // if (window.location.pathname === '/' && index === 0) {
            //     return;
            // }
            
            const text = heading.textContent;
            heading.textContent = '';
            heading.classList.add('typing');
            
            let i = 0;
            const typeWriter = () => {
                if (i < text.length) {
                    heading.textContent += text.charAt(i);
                    i++;
                    setTimeout(typeWriter, 50);
                } else {
                    heading.classList.remove('typing');
                    // Add blinking cursor at the end
                    heading.classList.add('cursor-blink');
                }
            };
            
            // Stagger animation for multiple headings
            setTimeout(typeWriter, index * 300);
        });
    }
})();