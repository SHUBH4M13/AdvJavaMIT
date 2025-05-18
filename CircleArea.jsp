<%@ page import="java.io.*, java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Circle Area Calculator</title>
</head>
<body>
    <h1>Circle Area Calculator</h1>

    <form method="post">
        <label for="radius">Enter Radius:</label>
        <input type="number" name="radius" id="radius" required step="any">
        <button type="submit">Calculate Area</button>
    </form>

    <%
        String radiusStr = request.getParameter("radius");
        if (radiusStr != null) {
            try {
                double radius = Double.parseDouble(radiusStr);
                double area = Math.PI * radius * radius;
                DecimalFormat df = new DecimalFormat("#.##");
    %>
                <h2>Result</h2>
                <p>Radius: <%= df.format(radius) %></p>
                <p>Area: <%= df.format(area) %></p>
    <%
            } catch (NumberFormatException e) {
    %>
                <p style="color:red;">Invalid radius entered.</p>
    <%
            }
        }
    %>
</body>
</html>
