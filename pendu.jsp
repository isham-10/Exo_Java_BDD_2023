<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Arrays"%>

<html>
<head>
<title>Jeu du Pendu</title>
</head>
<body bgcolor="white">
<h1>Jeu du Pendu</h1>

<%! 
    public class JeuPendu {
        private String motADeviner;
        private char[] motAffiche;
        private List<Character> lettresProposees;
        private int essaisRestants;

        public JeuPendu(List<String> listeMots, int essais) {
            Random rand = new Random();
            motADeviner = listeMots.get(rand.nextInt(listeMots.size()));
            motAffiche = new char[motADeviner.length()];
            for (int i = 0; i < motAffiche.length; i++) {
                motAffiche[i] = '_';
            }
            lettresProposees = new ArrayList<>();
            essaisRestants = essais;
        }

        public boolean proposerLettre(char lettre) {
            if (lettresProposees.contains(lettre)) {
                return false;
            }
            lettresProposees.add(lettre);
            boolean lettreTrouvee = false;
            for (int i = 0; i < motADeviner.length(); i++) {
                if (motADeviner.charAt(i) == lettre) {
                    motAffiche[i] = lettre;
                    lettreTrouvee = true;
                }
            }
            if (!lettreTrouvee) {
                essaisRestants--;
            }
            return lettreTrouvee;
        }

        public boolean estGagne() {
            for (char c : motAffiche) {
                if (c == '_') {
                    return false;
                }
            }
            return true;
        }

        public boolean estPerdu() {
            return essaisRestants <= 0;
        }

        public String afficherEtat() {
            return "Mot : " + new String(motAffiche) + "<br>" +
                   "Lettres proposées : " + lettresProposees + "<br>" +
                   "Essais restants : " + essaisRestants + "<br>";
        }

        public String getMotADeviner() {
            return motADeviner;
        }
    }
%>

<%
    List<String> listeMots = Arrays.asList("PROGRAMME", "JAVA", "ORDINATEUR", "INTERNET", "CLAVIER", "SOURIS", "ECRAN", "LOGICIEL", "COMPILATEUR", "ALGORITHME");

    // Vérifier si un jeu existe déjà dans la session
    JeuPendu jeu = (JeuPendu) session.getAttribute("jeu");

    if (jeu == null) {
        // Si non, créer un nouveau jeu
        jeu = new JeuPendu(listeMots, 6);
        session.setAttribute("jeu", jeu);
    }

    // Récupérer la lettre proposée
    String lettreProposee = request.getParameter("lettre");
    if (lettreProposee != null && !lettreProposee.isEmpty()) {
        jeu.proposerLettre(lettreProposee.toUpperCase().charAt(0));
    }

    // Afficher l'état du jeu
    out.println(jeu.afficherEtat());
%>

<%
    if (jeu.estGagne()) {
%>
        <h2>Félicitations, vous avez gagné ! 🎉</h2>
        <form action="pendu.jsp" method="post">
            <input type="submit" value="Rejouer">
            <input type="hidden" name="restart" value="true">
        </form>
<%
    } else if (jeu.estPerdu()) {
%>
        <h2>Dommage, vous avez perdu. Le mot était : <%= jeu.getMotADeviner() %> 😢</h2>
        <form action="pendu.jsp" method="post">
            <input type="submit" value="Rejouer">
            <input type="hidden" name="restart" value="true">
        </form>
<%
    } else {
%>
        <form action="pendu.jsp" method="post">
            <label for="lettre">Proposez une lettre :</label>
            <input type="text" id="lettre" name="lettre" maxlength="1" required>
            <input type="submit" value="Envoyer">
        </form>
<%
    }

    // Gérer une demande de redémarrage
    String restart = request.getParameter("restart");
    if ("true".equals(restart)) {
        session.removeAttribute("jeu"); // Supprimer l'ancien jeu
        response.sendRedirect("pendu.jsp"); // Recharger la page
    }
%>

</body>
</html>
