<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Redirect to login if not authenticated
    if (session.getAttribute("role") == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Masuri Doan | Premium Japanese Sushi House</title>
    <meta name="description" content="Experience authentic omakase cuisine at Masuri Doan Sushi House. Refined Japanese culinary artistry in an elegant atmosphere.">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <c:choose>
        <c:when test="${sessionScope.role == 'manager'}">
            <jsp:include page="/WEB-INF/jspf/header_manager.jsp" />
        </c:when>
        <c:when test="${sessionScope.role == 'customer'}">
            <jsp:include page="/WEB-INF/jspf/header_customer.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="/WEB-INF/jspf/header.jspf" />
        </c:otherwise>
    </c:choose>

    <main class="overflow-x-hidden">
        <!-- Hero Section -->
        <section id="home" class="hero-section">
            <img
                id="hero-image"
                src="${pageContext.request.contextPath}/assets/img/close-up-plate-with-sushi.jpg"
                alt="Premium sushi background"
                class="hero-background"
            />

            <!-- Overlay for background image -->
            <div class="absolute inset-0 bg-black/40 pointer-events-none"></div>
            <div class="absolute inset-0 radial-gradient-overlay pointer-events-none"></div>

            <!-- Content Container -->
            <div class="relative z-10 text-center px-4 hero-content">
                <!-- Main Title -->
                <h1 class="font-serif hero-title-large text-white mb-4 font-light tracking-wider text-balance">
                    Masuri Doan
                </h1>

                <!-- Subtitle -->
                <p class="font-light text-white hero-subtitle-large mb-12 tracking-widest uppercase">
                    Sushi House
                </p>

                <div class="w-20 h-px bg-gold mx-auto mb-10"></div>

                <!-- Description -->
                <p class="text-white/80 font-light max-w-2xl mx-auto mb-16 leading-relaxed text-base md:text-lg">
                    Experience the pinnacle of Japanese culinary artistry. Each plate tells a story of tradition, precision, and refined elegance.
                </p>
            </div>
        </section>

        <!-- Menu Preview Section -->
        <section id="menu" class="section bg-black relative overflow-hidden">
            <div class="container relative z-10">
                <!-- Section Header -->
                <div class="text-center mb-24">
                    <h2 class="font-serif text-5xl md:text-6xl text-white mb-6 font-light tracking-wide">
                        Our Courses
                    </h2>
                    <div class="w-20 h-px bg-gold mx-auto"></div>
                </div>

                <!-- Menu Cards Grid -->
                <div class="grid md:grid-cols-3 gap-10 menu-cards">
                    <!-- Menu Item 1 -->
                    <div class="menu-card" data-id="1">
                        <div class="card">
                            <div class="card-border"></div>

                            <!-- Content -->
                            <div class="relative h-full flex flex-col items-center justify-center card-content-padding text-center">
                                <!-- Icon -->
                                <div class="w-14 h-14 mb-6 bg-transparent rounded-full flex items-center justify-center group-hover:border-gold/60 transition-all duration-500 border border-gold/30">
                                    <div class="w-7 h-7 border border-gold/40"></div>
                                </div>

                                <!-- Title -->
                                <h3 class="font-serif text-xl text-white mb-4 font-light">
                                    Premium Selection
                                </h3>

                                <!-- Description -->
                                <p class="text-white/60 text-sm font-light leading-relaxed">
                                    Curated omakase experience with our finest selections
                                </p>

                                <!-- Bottom Accent -->
                                <div class="mt-8 w-8 h-px bg-gold/40 group-hover:w-14 group-hover:bg-gold/80 transition-all duration-500"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Menu Item 2 -->
                    <div class="menu-card" data-id="2">
                        <div class="card">
                            <div class="card-border"></div>

                            <!-- Content -->
                            <div class="relative h-full flex flex-col items-center justify-center card-content-padding text-center">
                                <!-- Icon -->
                                <div class="w-14 h-14 mb-6 bg-transparent rounded-full flex items-center justify-center group-hover:border-gold/60 transition-all duration-500 border border-gold/30">
                                    <div class="w-7 h-7 border border-gold/40"></div>
                                </div>

                                <!-- Title -->
                                <h3 class="font-serif text-xl text-white mb-4 font-light">
                                    Chef's Special
                                </h3>

                                <!-- Description -->
                                <p class="text-white/60 text-sm font-light leading-relaxed">
                                    Seasonal creations crafted with precision and passion
                                </p>

                                <!-- Bottom Accent -->
                                <div class="mt-8 w-8 h-px bg-gold/40 group-hover:w-14 group-hover:bg-gold/80 transition-all duration-500"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Menu Item 3 -->
                    <div class="menu-card" data-id="3">
                        <div class="card">
                            <div class="card-border"></div>

                            <!-- Content -->
                            <div class="relative h-full flex flex-col items-center justify-center card-content-padding text-center">
                                <!-- Icon -->
                                <div class="w-14 h-14 mb-6 bg-transparent rounded-full flex items-center justify-center group-hover:border-gold/60 transition-all duration-500 border border-gold/30">
                                    <div class="w-7 h-7 border border-gold/40"></div>
                                </div>

                                <!-- Title -->
                                <h3 class="font-serif text-xl text-white mb-4 font-light">
                                    Private Experience
                                </h3>

                                <!-- Description -->
                                <p class="text-white/60 text-sm font-light leading-relaxed">
                                    Intimate dining for the most discerning palates
                                </p>

                                <!-- Bottom Accent -->
                                <div class="mt-8 w-8 h-px bg-gold/40 group-hover:w-14 group-hover:bg-gold/80 transition-all duration-500"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- CTA -->
                <div class="text-center mt-20">
                    <button class="px-10 py-4 border border-gold text-gold font-serif text-sm tracking-widest uppercase hover:bg-gold hover:text-black transition-all duration-500 relative group">
                        <span class="relative">View Full Menu</span>
                    </button>
                </div>
            </div>
        </section>

        <!-- Story Section -->
        <section id="about" class="section bg-black relative overflow-hidden">
            <div class="container relative z-10">
                <div class="grid md:grid-cols-2 gap-20 items-center">
                    <!-- Left - Image -->
                    <div class="story-image">
                        <div class="relative h-96 md:h-full min-h-96 bg-dark overflow-hidden">
                            <div class="absolute inset-0 border border-gold/40 pointer-events-none z-10"></div>
                            <img 
                                src="${pageContext.request.contextPath}/assets/img/vertical-shot-fresh-tuna-salmon-scallop-nigiri-shrimp-sushi-chopsticks.jpg"
                                alt="Fresh sushi selection"
                                class="w-full h-full object-cover"
                            />
                        </div>
                    </div>

                    <!-- Right - Content -->
                    <div class="story-content">
                        <h2 class="font-serif text-5xl md:text-6xl text-white mb-8 font-light tracking-wide">
                            Our Story
                        </h2>

                        <div class="w-16 h-px bg-gold mb-10"></div>

                        <p class="text-white/80 font-light leading-relaxed mb-8 text-base md:text-lg">
                            Masuri Doan represents the pinnacle of Japanese culinary artistry, where tradition meets innovation. Each piece is crafted with meticulous attention to detail, honoring the centuries-old techniques of sushi mastery.
                        </p>

                        <p class="text-white/80 font-light leading-relaxed mb-10 text-base md:text-lg">
                            Our chefs have dedicated their lives to perfecting their craft, sourcing only the finest ingredients from around the globe. We believe that exceptional dining is not just about food—it's about creating an unforgettable experience that engages all the senses.
                        </p>

                        <p class="text-white/70 font-light italic text-base md:text-lg border-l border-gold/40 pl-6 py-2">
                            "In every piece, we pour our passion for excellence and respect for the art."
                        </p>

                        <div class="mt-12">
                            <button class="px-10 py-4 border border-gold text-gold font-serif text-sm tracking-widest uppercase hover:bg-gold hover:text-black transition-all duration-500 relative group">
                                <span class="relative">Learn More</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Gallery Banner Section -->
        <section id="gallery" class="relative h-96 md:h-screen max-h-screen overflow-hidden bg-black">
            <div class="absolute inset-0 opacity-5">
                <svg class="w-full h-full" xmlns="http://www.w3.org/2000/svg">
                    <defs>
                        <pattern id="grid" width="40" height="40" patternUnits="userSpaceOnUse">
                            <path d="M 40 0 L 0 0 0 40" fill="none" stroke="#d7c09a" stroke-width="0.5"/>
                        </pattern>
                    </defs>
                    <rect width="100%" height="100%" fill="url(#grid)" />
                </svg>
            </div>

            <!-- Content -->
            <div class="relative h-full flex items-center px-6 md:px-12 z-10 gallery-content">
                <div>
                    <h2 class="font-serif text-5xl md:text-7xl text-white font-light tracking-wide mb-6 text-balance">
                        Culinary Artistry
                    </h2>
                    <div class="w-24 h-px bg-gold mb-8"></div>
                    <p class="text-white/80 font-light text-lg md:text-xl max-w-lg leading-relaxed">
                        Every course is a masterpiece, crafted with precision and served with the elegance that defines fine Japanese cuisine.
                    </p>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/jspf/footer.jspf" />

    <script>
        // Hero content animation on load
        document.addEventListener('DOMContentLoaded', function() {
            const heroContent = document.querySelector('.hero-content');
            if (heroContent) {
                heroContent.style.opacity = '1';
                heroContent.style.transform = 'scale(1)';
            }
        });

        // Intersection Observer for menu cards animation
        const menuCards = document.querySelectorAll('.menu-card');
        const menuObserver = new IntersectionObserver((entries) => {
            entries.forEach((entry, index) => {
                if (entry.isIntersecting) {
                    setTimeout(() => {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                    }, index * 150);
                }
            });
        }, { threshold: 0.1 });

        menuCards.forEach(card => {
            card.style.opacity = '0';
            card.style.transform = 'translateY(2rem)';
            card.style.transition = 'opacity 700ms, transform 700ms';
            menuObserver.observe(card);
        });

        // Intersection Observer for story section
        const storyImage = document.querySelector('.story-image');
        const storyContent = document.querySelector('.story-content');
        
        const storyObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    if (entry.target === storyImage) {
                        storyImage.style.opacity = '1';
                        storyImage.style.transform = 'translateX(0)';
                    }
                    if (entry.target === storyContent) {
                        setTimeout(() => {
                            storyContent.style.opacity = '1';
                            storyContent.style.transform = 'translateX(0)';
                        }, 200);
                    }
                }
            });
        }, { threshold: 0.2 });

        if (storyImage) {
            storyImage.style.opacity = '0';
            storyImage.style.transform = 'translateX(-2rem)';
            storyImage.style.transition = 'opacity 1000ms, transform 1000ms';
            storyObserver.observe(storyImage);
        }

        if (storyContent) {
            storyContent.style.opacity = '0';
            storyContent.style.transform = 'translateX(2rem)';
            storyContent.style.transition = 'opacity 1000ms, transform 1000ms';
            storyObserver.observe(storyContent);
        }

        // Intersection Observer for gallery banner
        const galleryContent = document.querySelector('.gallery-content');
        const galleryObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, { threshold: 0.3 });

        if (galleryContent) {
            galleryContent.style.opacity = '0';
            galleryContent.style.transform = 'translateY(2rem)';
            galleryContent.style.transition = 'opacity 1000ms, transform 1000ms';
            galleryObserver.observe(galleryContent);
        }

        // Parallax scroll effect for hero image - Enhanced
        const heroImg = document.getElementById('hero-image');
        const heroSection = document.querySelector('.hero-section');
        let ticking = false;

        function updateParallax() {
            if (heroImg && heroSection) {
                const scrollY = window.pageYOffset || document.documentElement.scrollTop;
                const heroSectionHeight = heroSection.offsetHeight;
                const heroSectionTop = heroSection.offsetTop;
                
                // Calculate parallax only when hero section is in view
                if (scrollY < heroSectionHeight + heroSectionTop) {
                    // Smooth parallax effect - image moves slower than scroll
                    const parallaxOffset = scrollY * 0.15; // Slightly increased for more visible effect
                    heroImg.style.transform = `translateY(${parallaxOffset}px)`;
                }
            }
            ticking = false;
        }

        function requestParallaxTick() {
            if (!ticking) {
                window.requestAnimationFrame(updateParallax);
                ticking = true;
            }
        }

        // Update on scroll
        window.addEventListener('scroll', requestParallaxTick, { passive: true });
        
        // Initial call
        updateParallax();
    </script>
</body>
</html>

