package org.gradle;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		try {
			//InputStreamReader in = new InputStreamReader(System.in);
			//BufferedReader reader = new BufferedReader(in);
			//System.out.println("Enter Class Name: ");
			//String whatClass = reader.readLine();
			Class exampleClass = Class.forName("org.gradle.Person");
			Object ob = exampleClass.newInstance();
			if(ob instanceof Person) {
				Person p = (Person)ob;
				System.out.println(p.getName());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
