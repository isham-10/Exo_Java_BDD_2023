<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les conditions</title>
</head>
<body bgcolor="white">
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur1" name="valeur1"></p>
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur2" name="valeur2"></p>
    <p>Saisir la valeur 3 : <input type="text" id="inputValeur3" name="valeur3"></p>
    <p><input type="submit" value="Afficher"></p>
</form>

<%
    // Récupération des valeurs
    String valeur1 = request.getParameter("valeur1");
    String valeur2 = request.getParameter("valeur2");
    String valeur3 = request.getParameter("valeur3");

    if (valeur1 != null && valeur2 != null && valeur3 != null &&
        !valeur1.isEmpty() && !valeur2.isEmpty() && !valeur3.isEmpty()) {
        try {
            int intValeur1 = Integer.parseInt(valeur1);
            int intValeur2 = Integer.parseInt(valeur2);
            int intValeur3 = Integer.parseInt(valeur3);

            // Exercice : Comparaison de valeur1 et valeur2
            if (intValeur1 > intValeur2) {
                out.println("<p>Valeur 1 est supérieure à Valeur 2.</p>");
            } else if (intValeur1 < intValeur2) {
                out.println("<p>Valeur 1 est inférieure à Valeur 2.</p>");
            } else {
                out.println("<p>Valeur 1 est égale à Valeur 2.</p>");
            }

            // Exercice 1 : C est-il entre A et B ?
            int min = Math.min(intValeur1, intValeur2);
            int max = Math.max(intValeur1, intValeur2);
            if (intValeur3 >= min && intValeur3 <= max) {
                out.println("<p>Oui, la valeur 3 est comprise entre Valeur 1 et Valeur 2.</p>");
            } else {
                out.println("<p>Non, la valeur 3 n'est pas comprise entre Valeur 1 et Valeur 2.</p>");
            }

            // Exercice 2 : Pair ou Impair ?
            if (intValeur3 % 2 == 0) {
                out.println("<p>Valeur 3 est paire.</p>");
            } else {
                out.println("<p>Valeur 3 est impaire.</p>");
            }

        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Erreur : Veuillez saisir uniquement des nombres valides.</p>");
        }
    }
%>

<h2>Exercice 1 : Comparaison 1</h2>
<p>
    Écrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres), A, B et C, et dire si C est compris entre A et B.
</p>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<p>
    Écrire un programme pour vérifier si un nombre est pair ou impair en utilisant une structure if.
</p>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
