
import java.util.Scanner;

public class Main {
    public static void main(String []args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        for(int i=0;i<n;i++){
            if(prime(in.nextLong()))System.out.println("Yes");
            else System.out.println("No");
        }
    }
    private static int[] calcPrimes2(long x){
        long []prime=new long[x+1];
    }
}