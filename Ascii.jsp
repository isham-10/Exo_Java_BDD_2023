<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
public class AsciiArtGenerator {
    // Suppression du mot-clé static pour les membres
    private final int CHAR_WIDTH = 4;
    private final int CHAR_HEIGHT = 5;
    private final String[] ASCII_ART = {
        " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ##   #  ##   ## ### # # # # # # # # # # ### ### ",
        "# # # # #   # # #   #   #   # #  #    # # # #   ### # # # # # # # # # # #    #  # # # # # # # # # #   #   # ",
        "### ##  #   # # ##  ##  # # ###  #    # ##  #   ### # # # # ##  # # ##   #   #  # # # # ###  #   #   #   ## ",
        "# # # # #   # # #   #   # # # #  #  # # # # #   # # # # # # #    ## # #   #  #  # # # # ### # #  #  #       ",
        "# # ##   ## ##  ### #    ## # # ###  #  # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ###  #  "
    };

    // Suppression du mot-clé static pour les méthodes
    public String generate(String text) {
        if (text == null || text.trim().isEmpty()) {
            return "";
        }
        
        text = text.toUpperCase();
        StringBuilder result = new StringBuilder();
        
        for (int row = 0; row < CHAR_HEIGHT; row++) {
            result.append(buildAsciiLine(row, text)).append("<br>");
        }
        
        return result.toString();
    }

    private String buildAsciiLine(int row, String text) {
        StringBuilder line = new StringBuilder();
        for (char c : text.toCharArray()) {
            int index = Character.isLetter(c) ? c - 'A' : 26;
            int startPos = index * CHAR_WIDTH;
            line.append(ASCII_ART[row], startPos, startPos + CHAR_WIDTH);
        }
        return line.toString();
    }
}
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Générateur ASCII Art</title>
    <style>
        /* Votre CSS reste inchangé */
    </style>
</head>
<body>
    <h1>Générateur ASCII Art</h1>
    
    <form method="post">
        <input type="text" name="textInput" 
               placeholder="Entrez votre texte ici..." 
               value="<%= request.getMethod().equalsIgnoreCase("POST") 
                          ? request.getParameter("textInput") 
                          : "" %>"
               required>
        <button type="submit">Générer l'ASCII Art</button>
    </form>
    
    <% if ("POST".equalsIgnoreCase(request.getMethod())) { 
        String text = request.getParameter("textInput");
        if (text != null && !text.trim().isEmpty()) { 
            AsciiArtGenerator generator = new AsciiArtGenerator(); %>
            <div class="result">
                <%= generator.generate(text) %>
            </div>
    <%  }
    } %>
</body>
</html>
