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
<%import java.util.Scanner;

public class AsciiArtConsole {

    private static final String[] ASCII_ART = {
        " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ##   #  ##   ## ### # # # # # # # # # # ### ### ",
        "# # # # #   # # #   #   #   # #  #    # # # #   ### # # # # # # # # # # #    #  # # # # # # # # # #   #   # ",
        "### ##  #   # # ##  ##  # # ###  #    # ##  #   ### # # # # ##  # # ##   #   #  # # # # ###  #   #   #   ## ",
        "# # # # #   # # #   #   # # # #  #  # # # # #   # # # # # # #    ## # #   #  #  # # # # ### # #  #  #       ",
        "# # ##   ## ##  ### #    ## # # ###  #  # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ###  #  "
    };

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("╔══════════════════════════════╗");
        System.out.println("║    GÉNÉRATEUR ASCII ART      ║");
        System.out.println("╚══════════════════════════════╝");
        System.out.print("\nEntrez votre texte : ");
        String text = scanner.nextLine().toUpperCase();
        
        System.out.println("\nRésultat ASCII Art :\n");
        generateAsciiArt(text);
        
        scanner.close();
    }

    public static void generateAsciiArt(String text) {
        int L = 4; // Largeur d'un caractère
        int H = 5; // Hauteur d'un caractère
        
        for (int h = 0; h < H; h++) {
            for (char c : text.toCharArray()) {
                int index = (c >= 'A' && c <= 'Z') ? c - 'A' : 26;
                int start = index * L;
                System.out.print(ASCII_ART[h].substring(start, start + L));
            }
            System.out.println();
        }
    }
}
javac AsciiArtConsole.java
java AsciiArtConsole
%>
</body>
</html>
