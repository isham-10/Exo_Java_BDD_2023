<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ASCII Art</title>
    <style>
        pre {
            font-family: monospace;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <h1>ASCII ART</h1>

    <form method="post">
        Entrez un mot : <input type="text" name="text" />
        <input type="submit" value="Afficher" />
    </form>

<%
    int L = 4;
    int H = 5;

    String input = request.getParameter("text");
    if (input != null && !input.isEmpty()) {
        input = input.toUpperCase();

        String[] rows = new String[H];
        rows[0] = " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ### ### ### ### ##  ### ### # # # # # # # # # # ### ";
        rows[1] = "# # # # #   # # #   #   #   # #  #    # ##  #   ### # # # # # # # # # # #    #  # # # # # # # #  #    #  ";
        rows[2] = "### ##  #   # # ##  ##  # # ###  #    # #   #   # # # # # # ### # # ##  ###  #  # # # # # #  #   #   #   ";
        rows[3] = "# # # # #   # # #   #   # # # #  #    # ##  #   # # # # # # #   # # # #   #  #  # # # # ### # #  #  #   ";
        rows[4] = "# # ##   ## ##  ### #   ### # # ### ### # # ### # # # # ### #     # # # ###  #  ###  #  # # # #  #  ###  ";

        StringBuilder[] asciiLines = new StringBuilder[H];
        for (int i = 0; i < H; i++) {
            asciiLines[i] = new StringBuilder();
        }

        for (int j = 0; j < input.length(); j++) {
            char c = input.charAt(j);
            int index = (c >= 'A' && c <= 'Z') ? c - 'A' : 26;

            for (int i = 0; i < H; i++) {
                int start = index * L;
                int end = start + L;
                if (end <= rows[i].length()) {
                    asciiLines[i].append(rows[i], start, end);
                } else {
                    asciiLines[i].append("????");
                }
            }
        }

        out.println("<pre>");
        for (int i = 0; i < H; i++) {
            out.println(asciiLines[i].toString());
        }
        out.println("</pre>");
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
