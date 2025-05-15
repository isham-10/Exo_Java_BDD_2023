<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Manipulation de chaînes</title>
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
<h1>Exercice sur les chaînes de caractères</h1>

<form action="#" method="post">
    <p>Saisir une phrase : <input type="text" name="message">
    <p><input type="submit" value="Afficher les transformations">
</form>

<%
    String message = request.getParameter("message");

    if (message != null && !message.trim().isEmpty()) {
        String majuscules = message.toUpperCase();
        String premiereMaj = message.substring(0, 1).toUpperCase() + message.substring(1);
%>
    <div class="results">
        <h2>Résultats :</h2>
        <p><strong>Original :</strong> <%= message %></p>
        <p><strong>Majuscules :</strong> <%= majuscules %></p>
        <p><strong>Première lettre en majuscule :</strong> <%= premiereMaj %></p>
    </div>
<%
    }
%>

<a href="index.html">Retour au sommaire</a>
</body>
</html>
