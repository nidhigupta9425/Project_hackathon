package test;

import java.util.Scanner;

public class prediction {

	public static void main(String[] args) {
		int x;
		double y;
		double m=1/3;
		int c=3;
		Scanner in= new Scanner(System.in);
		x=in.nextInt();
		y=(m*x)+c;
		System.out.println("Prediction for product "+ y);

	}

}
