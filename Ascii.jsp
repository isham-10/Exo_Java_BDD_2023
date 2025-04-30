<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Générateur ASCII Art Extravagant</title>
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #ff00ff;
            --secondary: #00ffff;
            --bg-dark: #121212;
            --neon-glow: 0 0 10px var(--primary), 
                         0 0 20px var(--primary), 
                         0 0 30px var(--primary);
        }
        
        body {
            font-family: 'Orbitron', sans-serif;
            max-width: 900px;
            margin: 0 auto;
            padding: 2rem;
            line-height: 1.6;
            background-color: var(--bg-dark);
            color: var(--primary);
            background-image: 
                radial-gradient(circle at 10% 20%, rgba(255, 0, 255, 0.1) 0%, transparent 20%),
                radial-gradient(circle at 90% 80%, rgba(0, 255, 255, 0.1) 0%, transparent 20%);
            animation: bgPulse 15s infinite alternate;
        }
        
        @keyframes bgPulse {
            0% { background-position: 0% 0%; }
            100% { background-position: 10% 10%; }
        }
        
        h1 {
            font-family: 'Press Start 2P', cursive;
            text-align: center;
            margin-bottom: 3rem;
            font-size: 2.5rem;
            color: var(--secondary);
            text-shadow: var(--neon-glow);
            animation: titleGlow 2s infinite alternate;
        }
        
        @keyframes titleGlow {
            0% { text-shadow: 0 0 10px var(--secondary); }
            100% { text-shadow: 0 0 20px var(--secondary), 
                              0 0 30px var(--secondary); }
        }
        
        form {
            background: rgba(18, 18, 18, 0.8);
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: 0 0 20px rgba(0, 255, 255, 0.3);
            margin-bottom: 3rem;
            border: 1px solid var(--primary);
            backdrop-filter: blur(5px);
            transition: all 0.3s ease;
        }
        
        form:hover {
            box-shadow: 0 0 30px rgba(255, 0, 255, 0.5);
            transform: translateY(-5px);
        }
        
        input[type="text"] {
            width: 100%;
            padding: 1rem;
            margin-bottom: 1.5rem;
            border: 2px solid var(--primary);
            border-radius: 8px;
            font-size: 1.2rem;
            background: rgba(0, 0, 0, 0.5);
            color: white;
            font-family: 'Orbitron', sans-serif;
            transition: all 0.3s ease;
        }
        
        input[type="text"]:focus {
            outline: none;
            border-color: var(--secondary);
            box-shadow: 0 0 15px var(--secondary);
        }
        
        button {
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            color: black;
            border: none;
            padding: 1rem 2rem;
            border-radius: 50px;
            cursor: pointer;
            font-size: 1.2rem;
            font-weight: bold;
            font-family: 'Press Start 2P', cursive;
            text-transform: uppercase;
            letter-spacing: 2px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }
        
        button:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px var(--primary);
        }
        
        button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: 0.5s;
            z-index: -1;
        }
        
        button:hover::before {
            left: 100%;
        }
        
        .ascii-art {
            font-family: 'Courier New', monospace;
            white-space: pre;
            background: rgba(0, 0, 0, 0.7);
            padding: 2rem;
            border-radius: 16px;
            box-shadow: 0 0 25px rgba(0, 255, 255, 0.4);
            line-height: 1.3;
            letter-spacing: 2px;
            color: var(--secondary);
            border: 1px solid var(--primary);
            position: relative;
            overflow: hidden;
            animation: artEntrance 0.5s ease-out;
        }
        
        @keyframes artEntrance {
            0% { transform: translateY(20px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }
        
        .ascii-art::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                to bottom right,
                transparent 45%,
                rgba(255, 0, 255, 0.1) 50%,
                transparent 55%
            );
            animation: scan 3s linear infinite;
            z-index: 0;
        }
        
        @keyframes scan {
            0% { transform: translateY(-100%) translateX(-100%) rotate(45deg); }
            100% { transform: translateY(100%) translateX(100%) rotate(45deg); }
        }
        
        .ascii-art pre {
            position: relative;
            z-index: 1;
        }
        
        footer {
            text-align: center;
            margin-top: 3rem;
            font-size: 0.8rem;
            opacity: 0.7;
            animation: fadeIn 2s ease-in;
        }
        
        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 0.7; }
        }
    </style>
</head>
<body>
    <h1>GÉNÉRATEUR ASCII ART NÉON</h1>
    
    <form method="post">
        <input type="text" name="text" 
               placeholder="ENTREZ VOTRE TEXTE ICI..." 
               value="<%= request.getMethod().equalsIgnoreCase("POST") 
                          ? request.getParameter("text") 
                          : "" %>"
               required>
        <button type="submit">GÉNÉRER</button>
    </form>

    <%-- [Le reste de votre code JSP reste inchangé] --%>
    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String input = request.getParameter("text");
            if (input != null && !input.trim().isEmpty()) {
                final int L = 4;
                final int H = 5;
                
                String[] rows = {
                    " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ##   #  ##   ## ### # # # # # # # # # # ### ###  ###  ##   # # # # # # # # # # #     # # # # # # # # # # # # # # # ",
                    "# # # # #   # # #   #   #   # #  #    # # # #   ### # # # # # # # # # # #    #  # # # # # # # # # #   #   #  # # # # # # # # # # # # # # # #    # # # # # # # # # # # # # # # ",
                    "### ##  #   # # ##  ##  # # ###  #    # ##  #   ### # # # # ##  # # ##   #   #  # # # # ###  #   #   #   ##    ## ##  # # # # # # # # # ###     ### # # # # ###  #  ### # # ",
                    "# # # # #   # # #   #   # # # #  #  # # # # #   # # # # # # #    ## # #   #  #  # # # # ### # #  #  #       # # # # # # # # # # # # # # #        # # # # # # # # # # # # # ",
                    "# # ##   ## ##  ### #    ## # # ###  #  # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ###  #  # # # # ###  #  ### # # # # #      # # # # ### # # # # # # # # "
                };

                StringBuilder[] asciiLines = new StringBuilder[H];
                for (int i = 0; i < H; i++) {
                    asciiLines[i] = new StringBuilder();
                }

                input = input.toUpperCase();
                for (int j = 0; j < input.length(); j++) {
                    char c = input.charAt(j);
                    int index;
                    
                    if (c >= 'A' && c <= 'Z') {
                        index = c - 'A';
                    } else if (c >= '0' && c <= '9') {
                        index = 26 + (c - '0');
                    } else {
                        index = 36;
                    }

                    for (int i = 0; i < H; i++) {
                        int start = index * L;
                        int end = start + L;
                        if (end <= rows[i].length()) {
                            asciiLines[i].append(rows[i].substring(start, end));
                            if (j < input.length() - 1) {
                                asciiLines[i].append(" ");
                            }
                        }
                    }
                }

                out.println("<div class=\"ascii-art\"><pre>");
                for (int i = 0; i < H; i++) {
                    out.println(asciiLines[i].toString());
                }
                out.println("</pre></div>");
            }
        }
    %>
    
    <footer>
        GÉNÉRATEUR ASCII ART NÉON © 2023 - BY DEV CRÉATIF
    </footer>
</body>
</html>
