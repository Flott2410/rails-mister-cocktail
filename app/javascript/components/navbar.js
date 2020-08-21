const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-lewagon-white');
        navbar.classList.add("sticky");
      } else {
        navbar.classList.remove('navbar-lewagon-white');
        navbar.classList.remove("sticky");
      }

    });
  }
}

export { initUpdateNavbarOnScroll };
