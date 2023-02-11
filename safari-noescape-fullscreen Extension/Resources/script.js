console.log("[safari-noesc] loaded");

window.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        console.log('[safari-noesc] Esc suppressed');
        event.preventDefault();
    }
}, true);
