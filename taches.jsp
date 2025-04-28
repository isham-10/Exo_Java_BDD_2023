<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Tâches</title>
</head>
<body bgcolor="white">
    <h1>Saisir une tâche</h1>
    <form action="#" method="post">
        <label for="inputValeur">Saisir le nom d'une tâche : </label>
        <input type="text" id="inputValeur" name="valeur">
        <input type="submit" value="Enregistrer">
    </form>

    <%! 
        class Task {
            String name;

            public Task(String name) {
                this.name = name;
            }
        }
    %>

    <%
        String valeur = request.getParameter("valeur");

        if (valeur != null && !valeur.isEmpty()) {
            Task task = new Task(valeur);
    %>
            <p>Nom de la tâche : <%= task.name %></p>
    <%
        }
    %>
</body>
</html>
