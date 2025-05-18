<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // ==== Model class ====
    class Employee {
        private String id;
        private String name;
        private String department;

        public Employee(String id, String name, String department) {
            this.id = id;
            this.name = name;
            this.department = department;
        }

        public String getId() { return id; }
        public String getName() { return name; }
        public String getDepartment() { return department; }
    }

    // ==== Simulated EJB-like storage using session ====
    List<Employee> employeeList = (List<Employee>) session.getAttribute("employeeList");
    if (employeeList == null) {
        employeeList = new ArrayList<>();
        session.setAttribute("employeeList", employeeList);
    }

    // ==== Handle form submission ====
    String action = request.getParameter("action");

    if ("add".equals(action)) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String dept = request.getParameter("department");

        if (id != null && name != null && dept != null) {
            employeeList.add(new Employee(id, name, dept));
        }
    } else if ("remove".equals(action)) {
        String idToRemove = request.getParameter("id");
        employeeList.removeIf(emp -> emp.getId().equals(idToRemove));
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>
    <style>
        body { font-family: sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 60%; margin-top: 10px; }
        th, td { border: 1px solid #aaa; padding: 8px; text-align: left; }
        h2 { margin-top: 30px; }
    </style>
</head>
<body>

<h1>Employee Management (No DB)</h1>

<!-- Form to add employee -->
<h2>Add Employee</h2>
<form method="post" action="employee.jsp">
    <input type="hidden" name="action" value="add" />
    <label>ID:</label>
    <input type="text" name="id" required />
    <label>Name:</label>
    <input type="text" name="name" required />
    <label>Department:</label>
    <input type="text" name="department" required />
    <button type="submit">Add</button>
</form>

<!-- Form to remove employee -->
<h2>Remove Employee</h2>
<form method="post" action="employee.jsp">
    <input type="hidden" name="action" value="remove" />
    <label>Enter ID to Remove:</label>
    <input type="text" name="id" required />
    <button type="submit">Remove</button>
</form>

<!-- Display employee list -->
<h2>Employee List</h2>
<% if (employeeList.isEmpty()) { %>
    <p>No employees yet.</p>
<% } else { %>
    <table>
        <tr><th>ID</th><th>Name</th><th>Department</th></tr>
        <% for (Employee emp : employeeList) { %>
            <tr>
                <td><%= emp.getId() %></td>
                <td><%= emp.getName() %></td>
                <td><%= emp.getDepartment() %></td>
            </tr>
        <% } %>
    </table>
<% } %>

</body>
</html>
