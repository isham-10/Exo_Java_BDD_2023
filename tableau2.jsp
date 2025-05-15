
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
    // Initialize the array list to store integers
    ArrayList<Integer> tableau = (ArrayList<Integer>) session.getAttribute("tableau");
    if (tableau == null) {
        tableau = new ArrayList<Integer>();
        session.setAttribute("tableau", tableau);
    }

    // Initialize the message
    String message = "";

    // Get the action parameter
    String action = request.getParameter("action");

    // Perform actions based on the action parameter
    if ("add".equals(action)) {
        String valueStr = request.getParameter("value");
        if (valueStr != null && !valueStr.trim().isEmpty()) {
            try {
                int value = Integer.parseInt(valueStr);
                if (tableau.size() < 10) {
                    tableau.add(value);
                    message = "Valeur ajoutée avec succès";
                } else {
                    message = "Tableau plein";
                }
            } catch (NumberFormatException e) {
                message = "Valeur invalide";
            }
        }
    } else if ("remove".equals(action)) {
        if (!tableau.isEmpty()) {
            tableau.remove(tableau.size() - 1);
            message = "Dernière valeur supprimée avec succès";
        } else {
            message = "Tableau vide";
        }
    } else if ("clear".equals(action)) {
        tableau.clear();
        message = "Tableau vidé avec succès";
    }
%>
<html>
<head>
    <title>Manipulation de tableau</title>
    <style>
        body {
            background: linear-gradient(to right, #f8f9fa, #e0e0e0);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
            padding: 30px;
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 40px;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-width: 500px;
            margin: auto;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .results {
            background-color: #ecf0f1;
            padding: 20px;
            margin-top: 30px;
            border-radius: 10px;
            max-width: 500px;
            margin: 30px auto;
        }

        .message {
            text-align: center;
            margin-top: 20px;
            color: #2980b9;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #2980b9;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h1>Manipulation de tableau</h1>

<form action="tableau2.jsp" method="post">
    <p>Saisir une valeur : <input type="text" name="value">
    <p><input type="submit" name="action" value="add" onclick="this.form.action='tableau2.jsp?action=add'">
    <p><input type="submit" name="action" value="remove" onclick="this.form.action='tableau2.jsp?action=remove'">
    <p><input type="submit" name="action" value="clear" onclick="this.form.action='tableau2.jsp?action=clear'">
    <p><input type="submit" name="action" value="display" onclick="this.form.action='tableau2.jsp?action=display'">
</form>

<%
    if ("display".equals(action)) {
%>
    <div class="results">
        <h2>Contenu du tableau :</h2>
        <p><%= tableau %></p>
    </div>
<%
    }
%>

<div class="message">
    <p><%= message %></p>
</div>

<a href="index.html">Retour au sommaire</a>
</body>
</html>
