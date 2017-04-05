package test_aop;

public class Program {

   public static void main(String[] args) {
      // TODO Auto-generated method stub
      Calc calc = new NewlecCalc();
      
      calc.set(3, 4);
      
      System.out.println(calc.add());
   }

}