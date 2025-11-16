<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order #${order.orderId} Details | Masuri Doan</title>
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
        <section class="order-detail-section">
            <div class="order-detail-container">
                <!-- Title Section -->
                <div class="order-detail-title-section">
                    <h1 class="order-detail-main-title font-serif">Order #${order.orderId} Details</h1>
                    <p class="order-detail-subtitle">Complete breakdown of the selected order</p>
                </div>

                <!-- Order Summary Box -->
                <div class="order-detail-summary-box">
                    <div class="order-detail-summary-row">
                        <div class="order-detail-summary-item">
                            <span class="order-detail-summary-label">ORDER ID</span>
                            <span class="order-detail-summary-value">#${order.orderId}</span>
                        </div>
                        <div class="order-detail-summary-item">
                            <span class="order-detail-summary-label">ORDER DATE</span>
                            <span class="order-detail-summary-value">${order.orderDate}</span>
                        </div>
                    </div>
                    <div class="order-detail-summary-row">
                        <div class="order-detail-summary-item">
                            <span class="order-detail-summary-label">ORDER STATUS</span>
                            <span class="order-detail-summary-status order-detail-status-${fn:toLowerCase(order.status)}">${order.status}</span>
                        </div>
                        <div class="order-detail-summary-item">
                            <span class="order-detail-summary-label">TOTAL AMOUNT</span>
                            <span class="order-detail-summary-total">$<fmt:formatNumber value="${order.totalAmount}" minFractionDigits="2" maxFractionDigits="2" /></span>
                        </div>
                    </div>
                </div>

                <!-- Order Details Table -->
                <div class="order-detail-table-container">
                    <table class="order-detail-table">
                        <thead>
                            <tr>
                                <th>DISH NAME</th>
                                <th>QUANTITY</th>
                                <th>UNIT PRICE (USD)</th>
                                <th>AMOUNT (USD)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${orderDetails}">
                                <tr>
                                    <td class="order-detail-dish-name">${item.dishName}</td>
                                    <td class="order-detail-quantity">${item.orderDetail.quantity}</td>
                                    <td class="order-detail-unit-price">
                                        $<fmt:formatNumber value="${item.orderDetail.unitPrice}" minFractionDigits="2" maxFractionDigits="2" />
                                    </td>
                                    <td class="order-detail-amount">
                                        $<fmt:formatNumber value="${item.orderDetail.amount}" minFractionDigits="2" maxFractionDigits="2" />
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr class="order-detail-total-row">
                                <td colspan="3" class="order-detail-total-label">Total Order Amount</td>
                                <td class="order-detail-total-value">
                                    $<fmt:formatNumber value="${order.totalAmount}" minFractionDigits="2" maxFractionDigits="2" />
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </section>
    </main>
</body>
</html>

