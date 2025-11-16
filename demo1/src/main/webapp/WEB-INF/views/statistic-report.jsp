<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Statistic Report | Masuri Doan</title>
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
        <section class="statistic-section">
            <div class="statistic-container">
                <!-- Title Section -->
                <div class="statistic-title-section">
                    <h1 class="statistic-main-title font-serif">Statistic Report</h1>
                    <p class="statistic-subtitle">Comprehensive analytics and insights</p>
                </div>

                <!-- Cards Grid -->
                <div class="statistic-cards-grid">
                    <!-- Card 1: Dish Statistics by Revenue (clickable) -->
                    <a href="${pageContext.request.contextPath}/statistics?type=dish" class="statistic-card statistic-card-clickable">
                        <div class="statistic-card-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M12 2L2 7l10 5 10-5-10-5z"></path>
                                <path d="M2 17l10 5 10-5"></path>
                                <path d="M2 12l10 5 10-5"></path>
                            </svg>
                        </div>
                        <div class="statistic-card-content">
                            <h3 class="statistic-card-title">Dish Statistics by Revenue</h3>
                            <p class="statistic-card-description">Track revenue and performance by dish</p>
                        </div>
                    </a>

                    <!-- Card 2: Ingredient Statistic (clickable) -->
                    <a href="${pageContext.request.contextPath}/statistics?type=ingredient" class="statistic-card statistic-card-clickable">
                        <div class="statistic-card-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M6 2L3 6v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V6l-3-4H6z"></path>
                                <path d="M3 6h18"></path>
                                <path d="M8 10v6"></path>
                                <path d="M12 10v6"></path>
                                <path d="M16 10v6"></path>
                            </svg>
                        </div>
                        <div class="statistic-card-content">
                            <h3 class="statistic-card-title">Ingredient Statistic</h3>
                            <p class="statistic-card-description">Monitor ingredient usage and costs</p>
                        </div>
                    </a>

                    <!-- Card 3: Customer Statistic (NOT clickable) -->
                    <div class="statistic-card">
                        <div class="statistic-card-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                <circle cx="12" cy="7" r="4"></circle>
                            </svg>
                        </div>
                        <div class="statistic-card-content">
                            <h3 class="statistic-card-title">Customer Statistic</h3>
                        </div>
                    </div>

                    <!-- Card 4: Supplier Statistics (NOT clickable) -->
                    <div class="statistic-card">
                        <div class="statistic-card-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path>
                                <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
                                <line x1="12" y1="22.08" x2="12" y2="12"></line>
                            </svg>
                        </div>
                        <div class="statistic-card-content">
                            <h3 class="statistic-card-title">Supplier Statistics</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>
</html>

