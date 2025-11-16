<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dish Revenue Statistics | Masuri Doan</title>
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
        <section class="dish-statistics-form-section">
            <div class="dish-statistics-form-container">
                <!-- Title Section -->
                <div class="dish-statistics-form-title-section">
                    <h1 class="dish-statistics-form-main-title font-serif">Dish Revenue Statistics</h1>
                    <p class="dish-statistics-form-subtitle">Select a time range to view revenue insights</p>
                </div>

                <!-- Form Container -->
                <div class="dish-statistics-form-card">
                    <form action="${pageContext.request.contextPath}/statistics" method="GET" class="dish-statistics-form">
                        <input type="hidden" name="type" value="dish">
                        
                        <!-- Date Input Fields -->
                        <div class="dish-statistics-form-date-fields">
                            <!-- Start Date -->
                            <div class="dish-statistics-form-date-group">
                                <label for="startDate" class="dish-statistics-form-label">Start Date</label>
                                <div class="dish-statistics-form-input-wrapper">
                                    <input
                                        type="date"
                                        id="startDate"
                                        name="startDate"
                                        class="dish-statistics-form-input"
                                        required
                                    />
                                    <svg class="dish-statistics-form-calendar-icon" id="startDateIcon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                    </svg>
                                </div>
                            </div>

                            <!-- End Date -->
                            <div class="dish-statistics-form-date-group">
                                <label for="endDate" class="dish-statistics-form-label">End Date</label>
                                <div class="dish-statistics-form-input-wrapper">
                                    <input
                                        type="date"
                                        id="endDate"
                                        name="endDate"
                                        class="dish-statistics-form-input"
                                        required
                                    />
                                    <svg class="dish-statistics-form-calendar-icon" id="endDateIcon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                    </svg>
                                </div>
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="dish-statistics-form-button">
                            View Report
                        </button>

                        <!-- Instruction Message -->
                        <p class="dish-statistics-form-instruction">
                            Please select both start and end dates to view the report.
                        </p>
                    </form>
                </div>
            </div>
        </section>
    </main>

    <script>
        // Make calendar icons clickable to open date picker
        document.addEventListener('DOMContentLoaded', function() {
            const startDateIcon = document.getElementById('startDateIcon');
            const endDateIcon = document.getElementById('endDateIcon');
            const startDateInput = document.getElementById('startDate');
            const endDateInput = document.getElementById('endDate');

            if (startDateIcon && startDateInput) {
                startDateIcon.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    if (startDateInput.showPicker) {
                        startDateInput.showPicker();
                    } else {
                        startDateInput.focus();
                        startDateInput.click();
                    }
                });
            }

            if (endDateIcon && endDateInput) {
                endDateIcon.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    if (endDateInput.showPicker) {
                        endDateInput.showPicker();
                    } else {
                        endDateInput.focus();
                        endDateInput.click();
                    }
                });
            }
        });
    </script>
</body>
</html>

