<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Dishes | Masuri Doan</title>
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
        <section class="find-dish-hero-section">
            <img
                src="${pageContext.request.contextPath}/assets/img/sushi-background.jpg"
                alt="Sushi background"
                class="find-dish-hero-background"
            />
            <div class="absolute inset-0 bg-black/40 pointer-events-none"></div>
            <div class="absolute inset-0 radial-gradient-overlay pointer-events-none"></div>

            <!-- Content Container -->
            <div class="relative z-10 text-center px-4 find-dish-hero-content">
                <h1 class="font-serif find-dish-hero-title text-white font-light tracking-wider text-balance">
                    Masuri Menu
                </h1>
            </div>
        </section>

        <!-- Search Section -->
        <section class="search-section bg-black">
            <div class="container relative z-10">
                <div class="max-w-4xl mx-auto">
                    <form action="${pageContext.request.contextPath}/find-dishes" method="GET" class="search-form">
                        <div class="search-input-wrapper">
                            <button type="submit" class="search-button search-button-left">
                                <svg class="search-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="11" cy="11" r="8"></circle>
                                    <path d="m21 21-4.35-4.35"></path>
                                </svg>
                            </button>
                            <input
                                type="text"
                                name="q"
                                id="searchInput"
                                placeholder="Search dishes by name..."
                                value="${searchKeyword}"
                                class="search-input search-input-with-icon"
                            />
                        </div>
                        <p class="search-instruction">Press Enter to search</p>
                    </form>
                </div>
            </div>
        </section>

        <!-- Dishes Table Section -->
        <section class="section bg-black pb-20">
            <div class="container relative z-10">
                <div class="dishes-table-wrapper mx-auto">
                    <table class="dishes-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Dish Name</th>
                                <th>Price (USD)</th>
                                <th>Status</th>
                                <th>Description</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty dishes}">
                                    <tr>
                                        <td colspan="5" class="text-center text-white/60 py-8">
                                            No dishes found.
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="dish" items="${dishes}">
                                        <tr class="dish-row-clickable ${dish.status == 'SOLD_OUT' ? 'sold-out-row' : ''}" onclick="window.location.href='${pageContext.request.contextPath}/dish-detail?id=${dish.dishId}'">
                                            <td>${dish.dishId}</td>
                                            <td class="dish-name">${dish.dishName}</td>
                                            <td class="dish-price ${dish.status == 'SOLD_OUT' ? 'sold-out-price' : ''}">$${String.format("%.2f", dish.price)}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${dish.status == 'ACTIVE'}">
                                                        <span class="status-badge status-ACTIVE">Available</span>
                                                    </c:when>
                                                    <c:when test="${dish.status == 'SOLD_OUT'}">
                                                        <span class="status-badge status-SOLD_OUT">Sold Out</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="status-badge status-${dish.status}">${dish.status}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="dish-description">${dish.description}</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </main>
</body>
</html>

