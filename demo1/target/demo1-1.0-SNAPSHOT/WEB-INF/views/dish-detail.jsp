<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${dish.dishName} | Masuri Doan</title>
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
        <section class="dish-detail-section bg-black">
            <div class="container relative z-10">
                <div class="dish-detail-wrapper">
                    <div class="dish-detail-card">
                        <!-- Header: Dish Name and Price -->
                        <div class="dish-detail-header">
                            <div class="dish-detail-title-wrapper">
                                <h1 class="dish-detail-name font-serif">${dish.dishName}</h1>
                                <div class="dish-detail-status-wrapper">
                                    <c:choose>
                                        <c:when test="${dish.status == 'ACTIVE'}">
                                            <span class="dish-detail-status-badge status-ACTIVE">Available</span>
                                        </c:when>
                                        <c:when test="${dish.status == 'SOLD_OUT'}">
                                            <span class="dish-detail-status-badge status-SOLD_OUT">Sold Out</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="dish-detail-status-badge status-${dish.status}">${dish.status}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="dish-detail-price-wrapper">
                                <span class="dish-detail-price">$${String.format("%.2f", dish.price)}</span>
                            </div>
                        </div>

                        <!-- Description Section -->
                        <div class="dish-detail-content-section">
                            <h2 class="dish-detail-section-title">DESCRIPTION</h2>
                            <p class="dish-detail-text">${dish.description}</p>
                        </div>

                        <!-- Details Section -->
                        <div class="dish-detail-content-section">
                            <h2 class="dish-detail-section-title">DETAILS</h2>
                            <p class="dish-detail-text">
                                Handcrafted with premium ingredients, carefully prepared and presented with the elegance that defines fine Japanese cuisine. Each piece is a masterpiece of culinary art.
                            </p>
                        </div>

                        <!-- Dish ID -->
                        <div class="dish-detail-footer">
                            <span class="dish-detail-id">DISH ID: ${dish.dishId}</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>
</html>

