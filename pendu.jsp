<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="JeuPendu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.HttpSession"%>

<html>
<head>
    <title>Jeu du Pendu</title>
</head>
<body>
    <h1>Jeu du Pendu</h1>
    <%
        HttpSession session = request.getSession();
        JeuPendu jeu = (JeuPendu) session.getAttribute("jeu");

        if (jeu == null) {
            jeu = new JeuPendu();
            session.setAttribute("jeu", jeu);
        }
    %>
    <p>Mot à deviner : <%= jeu.getMotAffiche() %></p>
    <p>Lettres proposées : <%= jeu.getLettresProposees() %></p>
    <p>Essais restants : <%= jeu.getEssaisRestants() %></p>

    <form action="JeuPenduServlet" method="post">
        <label for="lettre">Proposez une lettre :</label>
        <input type="text" id="lettre" name="lettre" maxlength="1" required>
        <input type="submit" value="Proposer">
    </form>

    <%
        if (jeu.estGagne()) {
    %>
        <p>Félicitations ! Vous avez deviné le mot : <%= jeu.getMotADeviner() %></p>
    <%
        } else if (jeu.estPerdu()) {
    %>
        <p>Dommage ! Vous avez perdu. Le mot était : <%= jeu.getMotADeviner() %></p>
    <%
        }
    %>
</body>
</html>
