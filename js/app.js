document.addEventListener('DOMContentLoaded', () => {
    const blobs = document.querySelectorAll('.blob');

    document.addEventListener('mousemove', (e) => {
        const x = e.clientX / window.innerWidth;
        const y = e.clientY / window.innerHeight;

        blobs.forEach((blob, index) => {
            const speed = (index + 1) * 20;
            const xOffset = (x - 0.5) * speed;
            const yOffset = (y - 0.5) * speed;
        });

        const container = document.querySelector('.background-container');
        const moveX = (x - 0.5) * 20;
        const moveY = (y - 0.5) * 20;
        container.style.transform = `translate(${moveX}px, ${moveY}px)`;
    });

    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });
});
