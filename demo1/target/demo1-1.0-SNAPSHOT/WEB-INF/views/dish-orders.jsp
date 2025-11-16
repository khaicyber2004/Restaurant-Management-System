<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders containing ${dishName} | Masuri Doan</title>
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
        <section class="dish-orders-section">
            <div class="dish-orders-container">
                <!-- Title Section -->
                <div class="dish-orders-title-section">
                    <h1 class="dish-orders-main-title font-serif">Orders containing ${dishName}</h1>
                    <p class="dish-orders-subtitle">Filtered from the selected date range</p>
                    <c:if test="${startDate != null && endDate != null}">
                        <p class="dish-orders-date-range">
                            ${startDate} – ${endDate}
                        </p>
                    </c:if>
                </div>

                <!-- Orders Table -->
                <div class="dish-orders-table-container">
                    <table class="dish-orders-table">
                        <thead>
                            <tr>
                                <th>ORDER ID</th>
                                <th>ORDER DATE</th>
                                <th>QUANTITY SOLD</th>
                                <th>REVENUE (USD)</th>
                                <th>ACTION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td class="dish-orders-order-id">#${order.orderId}</td>
                                    <td class="dish-orders-order-date">${order.orderDate}</td>
                                    <td class="dish-orders-quantity">${order.quantity}</td>
                                    <td class="dish-orders-revenue">
                                        $<fmt:formatNumber value="${order.revenue}" minFractionDigits="2" maxFractionDigits="2" />
                                    </td>
                                    <td class="dish-orders-actions">
                                        <a href="${pageContext.request.contextPath}/order-detail?orderId=${order.orderId}" class="dish-orders-action-link">
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
                            <tr class="dish-orders-summary">
                                <td colspan="2" class="dish-orders-summary-label">
                                    Total Orders: ${fn:length(orders)}
                                </td>
                                <td class="dish-orders-summary-label">
                                    <c:set var="totalQuantity" value="0" />
                                    <c:forEach var="order" items="${orders}">
                                        <c:set var="totalQuantity" value="${totalQuantity + order.quantity}" />
                                    </c:forEach>
                                    Total Quantity: ${totalQuantity}
                                </td>
                                <td class="dish-orders-summary-value">
                                    <c:set var="totalRevenue" value="0.0" />
                                    <c:forEach var="order" items="${orders}">
                                        <c:set var="totalRevenue" value="${totalRevenue + order.revenue}" />
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

