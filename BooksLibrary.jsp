<%@ page import="java.util.*" %>
<%
    // Simulating some books (normally comes from database or model)
    class Book {
        String id;
        String title;
        double price;

        Book(String id, String title, double price) {
            this.id = id;
            this.title = title;
            this.price = price;
        }
    }

    List<Book> books = new ArrayList<>();
    books.add(new Book("1", "Java Fundamentals", 399.0));
    books.add(new Book("2", "Effective Java", 550.0));
    books.add(new Book("3", "Clean Code", 480.0));

    // Simulating a shopping cart
    List<Book> cart = (List<Book>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }

    String action = request.getParameter("action");
    String id = request.getParameter("id");

    if ("add".equals(action) && id != null) {
        for (Book b : books) {
            if (b.id.equals(id)) {
                cart.add(b);
                break;
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Online Bookstore</title>
    <style>
        body {
            font-family: sans-serif;
        }
    </style>
</head>
<body>

    <h1>Welcome to the Bookstore</h1>

    <h2>Available Books:</h2>
    <ul>
        <% for (Book b : books) { %>
            <li>
                <b><%= b.title %></b> - ₹<%= b.price %>
                <a href="?action=add&id=<%= b.id %>">[Add to Cart]</a>
            </li>
        <% } %>
    </ul>

    <h2>Your Cart:</h2>
    <% if (cart.size() == 0) { %>
        <p>Cart is empty.</p>
    <% } else { %>
        <ul>
            <% for (Book b : cart) { %>
                <li><%= b.title %> - ₹<%= b.price %></li>
            <% } %>
        </ul>
    <% } %>

</body>
</html>
