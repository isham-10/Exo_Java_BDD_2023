<!DOCTYPE html>
<html>
<head>
    <title>ASCII Art Generator</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>ASCII Art Generator</h1>
        <form id="asciiForm">
            <input type="text" id="textInput" placeholder="Entrez votre texte" required>
            <button type="submit">Générer</button>
        </form>
        <pre id="result"></pre>
    </div>
    <script src="script.js"></script>
</body>
</html>

<%body {
    font-family: Arial, sans-serif;
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    text-align: center;
}

#asciiForm {
    margin: 20px 0;
}

#textInput {
    padding: 10px;
    width: 300px;
}

button {
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: #45a049;
}

#result {
    background-color: #f4f4f4;
    padding: 20px;
    border-radius: 5px;
    text-align: left;
    white-space: pre-wrap;
    font-family: monospace;
}%>
