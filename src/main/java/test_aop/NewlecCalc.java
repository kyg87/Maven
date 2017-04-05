package test_aop;

public class NewlecCalc implements Calc{

   private int x;
   private int y;

   @Override
   public void set(int x, int y) {
      // TODO Auto-generated method stub
      this.x = x;
      this.y = y;
   }

   @Override
   public int add() {
      // TODO Auto-generated method stub
      int result = x + y;

      return result;
   }

   @Override
   public int sub() {
      // TODO Auto-generated method stub
      int result = x + y;

      return result;
   }
}