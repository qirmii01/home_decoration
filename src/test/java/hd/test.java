package hd;

import java.util.Scanner;

public class test {
	public static final String a ="%s我是啊";
	public static void main(String[] args) {
		System.out.println(String.format(a, "哈哈哈哈"));
		
		Scanner sc = new Scanner(System.in);
		System.out.println("input five nubmer");
		int[] input = new int[]{1,2,3,4,5};
		int i=0;
		while(i<5){
			System.out.println("第"+(i+1)+"个数");
			int a =  sc.nextInt();
			boolean flag =true;
			for (int j = 0; j < input.length; j++) {
				if(input[j] == a){
					System.out.println("true");
					i++;
					flag = false;
					break;
				}
			}
			if(flag){
				System.out.println("error");
			}
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
