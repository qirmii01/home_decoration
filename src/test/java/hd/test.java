package hd;

import java.util.Scanner;

public class test {
	public static final String a ="%s我是啊";
	public static void main(String[] args) {
		String path = "/admin/login";
		if(!path.startsWith("/admin/login") || path.length()>6){
			System.out.println("login");
		}else{
			System.out.println("----");
		}
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
