public class QuestionTwo {
    public static int maxValue(String s) {
        int max = 0;
        int curr = 0;
        int sign = 1;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '+') {
                sign = 1;
            } else if (s.charAt(i) == '-') {
                sign = -1;
            } else {
                curr = curr * 10 + (s.charAt(i) - '0');
                max = Math.max(max, curr * sign);
            } 
        } 
        return max;
    } 
    public static void main(String[] args) {
        System.out.println(maxValue("1+ 3 − 2 − 5 + 1 − 6 + 7"));
    }
}
