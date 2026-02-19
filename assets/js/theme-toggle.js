(function() {
    // Simple typing effect for h1 elements
    const headings = document.querySelectorAll('h1');
    headings.forEach(heading => {
        const text = heading.textContent;
        heading.textContent = '';
        let i = 0;
        const typeWriter = () => {
            if (i < text.length) {
                heading.textContent += text.charAt(i);
                i++;
                setTimeout(typeWriter, 50);
            }
        };
        // Start typing after a short delay
        setTimeout(typeWriter, 500);
    });
})();
