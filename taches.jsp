<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Accueil</title>
</head>
<body>
    <h1>Accueil</h1>
    <a href="addTask.jsp">Ajouter une tâche</a><br>
    <a href="viewTasks.jsp">Voir les tâches</a>
</body>
</html>
public class Task {
    private String title;
    private String description;
    private String dueDate;
    private boolean isCompleted;

   <% public Task(String title, String description, String dueDate) {
        this.title = title;
        this.description = description;
        this.dueDate = dueDate;
        this.isCompleted = false;
    }

    // Getters and setters
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getDueDate() { return dueDate; }
    void setCompleted(boolean isCompleted) { this.isCompleted = isCompleted; }
}%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Task"%>

<html>
<head>
    <title>Ajouter une tâche</title>
</head>
<body>
    <h1>Ajouter une tâche</h1>
    <form action="addTask.jsp" method="post">
        <label for="title">Titre :</label>
        <input type="text" id="title" name="title" required><br>
        <label for="description">Description :</label>
        <textarea id="description" name="description" required></textarea><br>
        <label for="dueDate">Date d'échéance :</label>
        <input type="date" id="dueDate" name="dueDate" required><br>
        <input type="submit" value="Ajouter">
    </form>
</body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Task"%>

<%
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String dueDate = request.getParameter("dueDate");

    HttpSession session = request.getSession();
    ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");

    if (tasks == null) {
        tasks = new ArrayList<>();
    }

    Task newTask = new Task(title, description, dueDate);
    tasks.add(newTask);
    session.setAttribute("tasks", tasks);

    response.sendRedirect("viewTasks.jsp");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Task"%>

<html>
<head>
    <title>Liste des tâches</title>
</head>
<body>
    <h1>Liste des tâches</h1>
    <%
        HttpSession session = request.getSession();
        ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");

        if (tasks != null && !tasks.isEmpty()) {
            for (Task task : tasks) {
    %>
                <p>
                    <strong>Titre :</strong> <%= task.getTitle() %><br>
                    <strong>Description :</strong> <%= task.getDescription() %><br>
                    <strong>Date d'échéance :</strong> <%= task.getDueDate() %><br>
                    <strong>Terminée :</strong> <%= task.isCompleted() ? "Oui" : "Non" %><br>
                </p>
    <%
            }
        } else {
    %>
            <p>Aucune tâche à afficher.</p>
    <%
        }
    %>
    <a href="index.jsp">Retour à l'accueil</a>
</body>
</html>
<web-app>
    <servlet>
        <servlet-name>jsp</servlet-name>
        <jsp-file>/index.jsp</jsp-file>
    </servlet>
    <servlet-mapping>
        <servlet-name>jsp</servlet-name>
        <url-pattern>/index.jsp</url-pattern>
    </servlet-mapping>
</web-app>
