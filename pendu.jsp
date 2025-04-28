public class Main {
    public static void main(String[] args) {
        JeuPendu jeu = new JeuPendu();
        jeu.jouer();
    }
}
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class JeuPendu {
    private String motADeviner;
    private StringBuilder motAffiche;
    private ArrayList<Character> lettresProposees;
    private int essaisRestants;

    public JeuPendu() {
        String[] mots = {"PROGRAMMATION", "JAVA", "PENDU", "ORDINATEUR", "DEVELOPPEUR"};
        Random rand = new Random();
        motADeviner = mots[rand.nextInt(mots.length)];
        motAffiche = new StringBuilder("_".repeat(motADeviner.length()));
        lettresProposees = new ArrayList<>();
        essaisRestants = 6;
    }

    public void jouer() {
        Scanner scanner = new Scanner(System.in);

        while (essaisRestants > 0 && motAffiche.indexOf("_") != -1) {
            System.out.println("Mot à deviner : " + motAffiche);
            System.out.println("Lettres proposées : " + lettresProposees);
            System.out.println("Essais restants : " + essaisRestants);
            System.out.print("Proposez une lettre : ");
            char lettre = scanner.next().toUpperCase().charAt(0);

            if (lettresProposees.contains(lettre)) {
                System.out.println("Vous avez déjà proposé cette lettre.");
                continue;
            }

            lettresProposees.add(lettre);

            if (motADeviner.indexOf(lettre) >= 0) {
                for (int i = 0; i < motADeviner.length(); i++) {
                    if (motADeviner.charAt(i) == lettre) {
                        motAffiche.setCharAt(i, lettre);
                    }
                }
            } else {
                essaisRestants--;
            }
        }

        if (motAffiche.indexOf("_") == -1) {
            System.out.println("Félicitations ! Vous avez deviné le mot : " + motADeviner);
        } else {
            System.out.println("Dommage ! Vous avez perdu. Le mot était : " + motADeviner);
        }
    }
}
