<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
public class AsciiArtGenerator {
    private final int CHAR_WIDTH = 4;
    private final int CHAR_HEIGHT = 5;
    private final String[] ASCII_ART = {
        " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ##   #  ##   ## ### # # # # # # # # # # ### ### ",
        "# # # # #   # # #   #   #   # #  #    # # # #   ### # # # # # # # # # # #    #  # # # # # # # # # #   #   # ",
        "### ##  #   # # ##  ##  # # ###  #    # ##  #   ### # # # # ##  # # ##   #   #  # # # # ###  #   #   #   ## ",
        "# # # # #   # # #   #   # # # #  #  # # # # #   # # # # # # #    ## # #   #  #  # # # # ### # #  #  #       ",
        "# # ##   ## ##  ### #    ## # # ###  #  # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ###  #  "
    };

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
            // Ajout d'un espace après chaque caractère ASCII
            line.append(ASCII_ART[row], startPos, startPos + CHAR_WIDTH).append(" ");
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
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            max-width: 800px;
            margin: 2rem auto;
            padding: 1rem;
            line-height: 1.6;
            background-color: #f8f9fa;
        }
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 2rem;
        }
        form {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }
        input[type="text"] {
            width: 100%;
            padding: 0.8rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }
        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #2980b9;
        }
        .result {
            font-family: 'Courier New', monospace;
            white-space: pre-wrap;
            background: white;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            overflow-x: auto;
            line-height: 1.2;
            letter-spacing: 2px; /* Espacement supplémentaire pour améliorer la lisibilité */
        }
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
