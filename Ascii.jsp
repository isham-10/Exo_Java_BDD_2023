<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
public class AsciiArtGenerator {
    private static final String[] ASCII_ART = {
        " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ##   #  ##   ## ### # # # # # # # # # # ### ### ",
        "# # # # #   # # #   #   #   # #  #    # # # #   ### # # # # # # # # # # #    #  # # # # # # # # # #   #   # ",
        "### ##  #   # # ##  ##  # # ###  #    # ##  #   ### # # # # ##  # # ##   #   #  # # # # ###  #   #   #   ## ",
        "# # # # #   # # #   #   # # # #  #  # # # # #   # # # # # # #    ## # #   #  #  # # # # ### # #  #  #       ",
        "# # ##   ## ##  ### #    ## # # ###  #  # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ###  #  "
    };

    public static String generate(String text) {
        final int CHAR_WIDTH = 4;
        final int CHAR_HEIGHT = 5;
        StringBuilder result = new StringBuilder();
        
        if (text == null || text.trim().isEmpty()) {
            return "";
        }
        
        text = text.toUpperCase();
        
        for (int row = 0; row < CHAR_HEIGHT; row++) {
            StringBuilder line = new StringBuilder();
            for (char c : text.toCharArray()) {
                int index = Character.isLetter(c) ? c - 'A' : 26;
                int startPos = index * CHAR_WIDTH;
                line.append(ASCII_ART[row], startPos, startPos + CHAR_WIDTH);
            }
            result.append(line.toString()).append("<br>");
        }
        
        return result.toString();
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
        }
    </style>
</head>
<body>
    <h1>Générateur ASCII Art</h1>
    
    <form method="post">
        <input type="text" name="textInput" placeholder="Entrez votre texte ici..." required>
        <button type="submit">Générer l'ASCII Art</button>
    </form>
    
    <% 
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String text = request.getParameter("textInput");
        if (text != null && !text.trim().isEmpty()) {
    %>
            <div class="result">
                <%= AsciiArtGenerator.generate(text) %>
            </div>
    <%
        }
    }
    %>
</body>
</html>
