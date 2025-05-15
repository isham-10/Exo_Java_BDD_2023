<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Manipulation de Tableau</title>
    <style>
        body {
            background: linear-gradient(to bottom, #000428, #004e92);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            padding: 30px;
            overflow: hidden;
        }

        h1 {
            color: #fff;
            text-align: center;
            margin-bottom: 40px;
            font-size: 3em;
            text-shadow: 0 0 10px rgba(255, 255, 255, 0.7);
        }

        form {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
            max-width: 500px;
            margin: auto;
            backdrop-filter: blur(10px);
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }

        .results {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            margin-top: 30px;
            border-radius: 10px;
            max-width: 500px;
            margin: 30px auto;
            backdrop-filter: blur(10px);
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

        .galaxy {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://www.transparenttextures.com/patterns/galaxy.png');
            opacity: 0.5;
            animation: galaxyAnimation 60s linear infinite;
            z-index: -1;
        }

        @keyframes galaxyAnimation {
            from { background-position: 0 0; }
            to { background-position: 100% 100%; }
        }
    </style>
</head>
<body>
<div class="galaxy"></div>
<h1>Manipulation de Tableau</h1>

<form action="#" method="post">
    <p>Ajouter une valeur : <input type="text" name="value">
    <p><input type="submit" name="action" value="Ajouter">
    <p><input type="submit" name="action" value="Supprimer">
    <p><input type="submit" name="action" value="Afficher">
    <p><input type="submit" name="action" value="Vider">
</form>

<%
    if (session.getAttribute("tableau") == null) {
        session.setAttribute("tableau", new java.util.ArrayList<Integer>());
    }

    java.util.ArrayList<Integer> tableau = (java.util.ArrayList<Integer>) session.getAttribute("tableau");
    String action =
