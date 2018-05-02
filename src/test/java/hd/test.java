package hd;

import java.util.Scanner;

public class test {
	public static final String a ="%s我是啊";
	public static void main(String[] args) {
		System.out.println("13574355195".substring(5, 11));
	}
	
	class Test{
		private String name;

		public Test(String name){
			this.name= name;
		}
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
		
		@Override
		public String toString(){
			return "name:"+name;
		}
	}
}	
