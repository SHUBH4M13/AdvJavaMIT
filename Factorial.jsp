<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Factorial Calculator</title>
</head>
<body>
    <h2>Enter a Number to Calculate Its Factorial:</h2>
    <form action="factorial.jsp" method="post">
        <label for="number">Number:</label>
        <input type="number" id="number" name="number" min="0" required>
        <input type="submit" value="Calculate">
    </form>
</body>
</html>

<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
    <title>Factorial Result</title>
</head>
<body>
    <%
        String numberStr = request.getParameter("number");
        int number = Integer.parseInt(numberStr);
        
        BigInteger factorial = BigInteger.ONE;
        for (int i = 2; i <= number; i++) {
            factorial = factorial.multiply(BigInteger.valueOf(i));
        }
    %>
    <h2>Factorial Calculation Result:</h2>
    <p>Number: <%= number %></p>
    <p>Factorial: <%= factorial %></p>
    <a href="index.jsp">Calculate Another Factorial</a>
</body>
</html>
