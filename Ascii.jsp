<%@ page import="AsciiArtGenerator" %>
<!DOCTYPE html>
<html>
<head>
    <title>Générateur ASCII Art</title>
</head>
<body>
        <h1>Générateur ASCII Art</h1>
        
        <form method="post">
            <input type="text" name="textInput" placeholder="Entrez votre texte" required>
            <button type="submit">Générer</button>
        </form>
        
        <% 
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String text = request.getParameter("textInput");
            if (text != null && !text.isEmpty()) {
                out.println("<div class='result'>");
                out.println(AsciiArtGenerator.generate(text));
                out.println("</div>");
            }
        }
        %>
<%public class AsciiArtGenerator {
    private static final String[] ASCII_ART = {
        " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ##   #  ##   ## ### # # # # # # # # # # ### ### ",
        "# # # # #   # # #   #   #   # #  #    # # # #   ### # # # # # # # # # # #    #  # # # # # # # # # #   #   # ",
        "### ##  #   # # ##  ##  # # ###  #    # ##  #   ### # # # # ##  # # ##   #   #  # # # # ###  #   #   #   ## ",
        "# # # # #   # # #   #   # # # #  #  # # # # #   # # # # # # #    ## # #   #  #  # # # # ### # #  #  #       ",
        "# # ##   ## ##  ### #    ## # # ###  #  # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ###  #  "
    };

    public static String generate(String text) {
        int L = 4; // Largeur fixe
        int H = 5; // Hauteur fixe
        StringBuilder result = new StringBuilder();
        
        text = text.toUpperCase();
        
        for (int h = 0; h < H; h++) {
            StringBuilder line = new StringBuilder();
            for (char c : text.toCharArray()) {
                int index = (c >= 'A' && c <= 'Z') ? c - 'A' : 26;
                int start = index * L;
                line.append(ASCII_ART[h].substring(start, start + L));
            }
            result.append(line.toString()).append("<br>");
        }
        
        return result.toString();
    }
}
%>
</body>
</html>
