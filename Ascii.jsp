<!DOCTYPE html>
<html>
<head>
    <title>ASCII Art Generator</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
        <h1>ASCII Art Generator</h1>
        <form id="asciiForm">
            <input type="text" id="textInput" placeholder="Entrez votre texte" required>
            <button type="submit">Générer</button>
        </form>
        <pre id="result"></pre>
    </div>
    <script src="script.js"></script>
<%package com.example;

import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
@CrossOrigin(origins = "*")
public class AsciiArtController {
    
    private static final String[] ASCII_ART = {
        " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ##   #  ##   ## ### # # # # # # # # # # ### ### ",
        "# # # # #   # # #   #   #   # #  #    # # # #   ### # # # # # # # # # # #    #  # # # # # # # # # #   #   # ",
        "### ##  #   # # ##  ##  # # ###  #    # ##  #   ### # # # # ##  # # ##   #   #  # # # # ###  #   #   #   ## ",
        "# # # # #   # # #   #   # # # #  #  # # # # #   # # # # # # #    ## # #   #  #  # # # # ### # #  #  #       ",
        "# # ##   ## ##  ### #    ## # # ###  #  # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ###  #  "
    };

    @PostMapping("/generate")
    public Map<String, String> generateAsciiArt(@RequestBody Map<String, String> request) {
        String text = request.get("text").toUpperCase();
        int L = 4; // Largeur fixe pour cette police
        int H = 5; // Hauteur fixe pour cette police
        
        Map<String, String> response = new HashMap<>();
        StringBuilder result = new StringBuilder();
        
        for (int h = 0; h < H; h++) {
            StringBuilder line = new StringBuilder();
            for (char c : text.toCharArray()) {
                int index = (c >= 'A' && c <= 'Z') ? c - 'A' : 26;
                int start = index * L;
                line.append(ASCII_ART[h].substring(start, start + L));
            }
            result.append(line.toString()).append("\n");
        }
        
        response.put("result", result.toString());
        return response;
    }
}
document.getElementById('asciiForm').addEventListener('submit', async function(e) {
    e.preventDefault();
    const text = document.getElementById('textInput').value;
    
    try {
        const response = await fetch('http://localhost:8080/generate', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ text: text })
        });
        
        const data = await response.json();
        document.getElementById('result').textContent = data.result;
    } catch (error) {
        console.error('Error:', error);
        document.getElementById('result').textContent = 'Erreur lors de la génération';
    }
});%>
</body>
</html>


