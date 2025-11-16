<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dish Revenue Report | Masuri Doan</title>
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
        <section class="dish-revenue-report-section">
            <div class="dish-revenue-report-container">
                <!-- Back Link -->
                <a href="${pageContext.request.contextPath}/statistics?type=dish" class="dish-revenue-report-back-link">
                    &lt; Back to Date Selection
                </a>

                <!-- Title Section -->
                <div class="dish-revenue-report-title-section">
                    <h1 class="dish-revenue-report-main-title font-serif">Dish Revenue Report</h1>
                    <p class="dish-revenue-report-subtitle">Ranking dishes by total revenue within the selected period</p>
                    <p class="dish-revenue-report-date-range">
                        ${startDate} - ${endDate}
                    </p>
                </div>

                <!-- Report Table -->
                <div class="dish-revenue-report-table-container">
                    <table class="dish-revenue-report-table">
                        <thead>
                            <tr>
                                <th>RANK</th>
                                <th>DISH NAME</th>
                                <th>QUANTITY SOLD</th>
                                <th>REVENUE (USD)</th>
                                <th>ACTIONS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${results}" varStatus="status">
                                <tr>
                                    <td class="dish-revenue-report-rank">${status.index + 1}</td>
                                    <td class="dish-revenue-report-dish-name">${item.dishName}</td>
                                    <td class="dish-revenue-report-quantity">${item.totalQuantity}</td>
                                    <td class="dish-revenue-report-revenue">
                                        $<fmt:formatNumber value="${item.totalRevenue}" minFractionDigits="2" maxFractionDigits="2" />
                                    </td>
                                    <td class="dish-revenue-report-actions">
                                        <a href="${pageContext.request.contextPath}/dish-orders?dishId=${item.dishId}&startDate=${startDate}&endDate=${endDate}" class="dish-revenue-report-action-link">
                                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                                <circle cx="12" cy="12" r="3"></circle>
                                            </svg>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr class="dish-revenue-report-summary">
                                <td colspan="2" class="dish-revenue-report-summary-label">
                                    Total Dishes: ${fn:length(results)}
                                </td>
                                <td class="dish-revenue-report-summary-label">
                                    <c:set var="totalQuantity" value="0" />
                                    <c:forEach var="item" items="${results}">
                                        <c:set var="totalQuantity" value="${totalQuantity + item.totalQuantity}" />
                                    </c:forEach>
                                    Total Quantity: ${totalQuantity}
                                </td>
                                <td class="dish-revenue-report-summary-value">
                                    <c:set var="totalRevenue" value="0.0" />
                                    <c:forEach var="item" items="${results}">
                                        <c:set var="totalRevenue" value="${totalRevenue + item.totalRevenue}" />
                                    </c:forEach>
                                    Total Revenue: $<fmt:formatNumber value="${totalRevenue}" minFractionDigits="2" maxFractionDigits="2" />
                                </td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </section>
    </main>
</body>
</html>

