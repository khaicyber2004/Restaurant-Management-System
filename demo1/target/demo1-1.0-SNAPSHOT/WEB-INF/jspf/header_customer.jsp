<header class="fixed top-0 left-0 right-0 z-100 header-blur">
  <nav class="w-full header-nav">
    <div class="header-container flex items-center">
      <!-- Left: Logo -->
      <div class="header-logo flex items-center">
        <a href="${pageContext.request.contextPath}/index.jsp" class="flex items-center header-logo-link-gap">
          <img
            src="${pageContext.request.contextPath}/assets/img/masuri-doan-logo.png"
            alt="Masuri Doan Logo"
            class="header-logo-img w-auto"
          />
          <span class="text-white font-serif header-logo-text tracking-wide hidden sm:block">Masuri Doan</span>
        </a>
      </div>

      <!-- Center: Desktop Menu -->
      <div class="header-menu hidden md:flex items-center justify-center flex-1">
        <div class="flex items-center header-menu-gap">
          <a href="${pageContext.request.contextPath}/index.jsp" class="text-white hover:text-gold transition-colors duration-300 header-menu-link font-light tracking-widest uppercase relative group">
            HOME
            <span class="absolute bottom-0 left-0 w-0 h-px bg-gold group-hover:w-full transition-all duration-300"></span>
          </a>
          <a href="${pageContext.request.contextPath}/find-dishes" class="text-white hover:text-gold transition-colors duration-300 header-menu-link font-light tracking-widest uppercase relative group">
            SEARCH DISHES
            <span class="absolute bottom-0 left-0 w-0 h-px bg-gold group-hover:w-full transition-all duration-300"></span>
          </a>
          <a href="#reservations" class="text-white hover:text-gold transition-colors duration-300 header-menu-link font-light tracking-widest uppercase relative group">
            TABLE RESERVATION
            <span class="absolute bottom-0 left-0 w-0 h-px bg-gold group-hover:w-full transition-all duration-300"></span>
          </a>
          <a href="#order" class="text-white hover:text-gold transition-colors duration-300 header-menu-link font-light tracking-widest uppercase relative group">
            ONLINE ORDERING
            <span class="absolute bottom-0 left-0 w-0 h-px bg-gold group-hover:w-full transition-all duration-300"></span>
          </a>
        </div>
      </div>

      <!-- Right: User Actions -->
      <div class="header-actions flex items-center">
        <!-- Logout Button -->
        <a href="${pageContext.request.contextPath}/logout" class="header-login-btn header-book-btn-padding header-book-btn-text font-light tracking-widest uppercase transition-all duration-300">
          LOGOUT
        </a>

        <!-- Mobile Menu Button -->
        <button
          id="mobile-menu-button-customer"
          onclick="toggleMobileMenu('customer')"
          class="md:hidden text-white hover:text-gold transition-colors"
          aria-label="Toggle menu"
        >
          <svg id="menu-icon-customer" class="icon-menu" viewBox="0 0 24 24">
            <line x1="3" y1="6" x2="21" y2="6"></line>
            <line x1="3" y1="12" x2="21" y2="12"></line>
            <line x1="3" y1="18" x2="21" y2="18"></line>
          </svg>
          <svg id="close-icon-customer" class="icon-close hidden" viewBox="0 0 24 24">
            <line x1="18" y1="6" x2="6" y2="6"></line>
            <line x1="18" y1="12" x2="6" y2="12"></line>
            <line x1="18" y1="18" x2="6" y2="18"></line>
          </svg>
        </button>
      </div>
    </div>
  </nav>

  <!-- Mobile Menu -->
  <div id="mobile-menu-customer" class="mobile-menu md:hidden header-blur border-t border-gold/40">
    <div class="px-4 py-4 space-y-4">
      <a href="${pageContext.request.contextPath}/index.jsp" class="block text-white hover:text-gold transition-colors header-mobile-menu-link font-light" onclick="closeMobileMenu('customer')">HOME</a>
      <a href="${pageContext.request.contextPath}/find-dishes" class="block text-white hover:text-gold transition-colors header-mobile-menu-link font-light" onclick="closeMobileMenu('customer')">SEARCH DISHES</a>
      <a href="#reservations" class="block text-white hover:text-gold transition-colors header-mobile-menu-link font-light" onclick="closeMobileMenu('customer')">TABLE RESERVATION</a>
      <a href="#order" class="block text-white hover:text-gold transition-colors header-mobile-menu-link font-light" onclick="closeMobileMenu('customer')">ONLINE ORDERING</a>
      <a href="${pageContext.request.contextPath}/logout" class="block text-white hover:text-gold transition-colors header-mobile-menu-link font-light" onclick="closeMobileMenu('customer')">LOGOUT</a>
    </div>
  </div>
</header>

<script>
function toggleMobileMenu(role) {
  const menu = document.getElementById('mobile-menu-' + role);
  const menuIcon = document.getElementById('menu-icon-' + role);
  const closeIcon = document.getElementById('close-icon-' + role);
  
  if (menu.classList.contains('open')) {
    menu.classList.remove('open');
    menuIcon.classList.remove('hidden');
    closeIcon.classList.add('hidden');
  } else {
    menu.classList.add('open');
    menuIcon.classList.add('hidden');
    closeIcon.classList.remove('hidden');
  }
}

function closeMobileMenu(role) {
  const menu = document.getElementById('mobile-menu-' + role);
  const menuIcon = document.getElementById('menu-icon-' + role);
  const closeIcon = document.getElementById('close-icon-' + role);
  
  menu.classList.remove('open');
  menuIcon.classList.remove('hidden');
  closeIcon.classList.add('hidden');
}
</script>
