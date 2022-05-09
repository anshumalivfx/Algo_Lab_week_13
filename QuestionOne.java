import java.util.*;

class Node {
    int value;
    Node left;
    Node right;

    Node(int value) {
        this.value = value;
        right = null;
        left = null;
    }
}

public class QuestionOne {
    
    public static int minRounds(Node root) {
        if (root == null) {
            return 0;
        }
        int left = minRounds(root.left);
        int right = minRounds(root.right);
        return Math.max(left, right) + 1;
    }
    public static void main(String[] args) {
        Node root = new Node(0);
        root.left = new Node(1);
        root.right = new Node(2);
        root.left.left = new Node(3);
        root.left.right = new Node(4);
        root.right.left = new Node(5);
        root.right.right = new Node(6);
        root.left.left.left = new Node(7);
        root.left.left.right = new Node(8);
        root.left.right.left = new Node(9);
        root.left.right.right = new Node(10);
        root.right.left.left = new Node(11);
        root.right.left.right = new Node(12);
        root.right.right.left = new Node(13);
        root.right.right.right = new Node(14);
        System.out.println(minRounds(root));
    }
}
