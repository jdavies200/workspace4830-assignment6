
public aspect TraceAspect {
   pointcut classToTrace(): within(*App);

   pointcut constructorToTrace(): classToTrace() && execution(new(..));

   pointcut methodToTrace():  classToTrace() &&  execution(* *(..));

   before(): constructorToTrace() {
      System.out.println();
      Object[] paramValues = thisJoinPoint.getArgs();
      if (paramValues != null) {
         for (Object iParam : paramValues) {
         }
      }
   }

   after(): constructorToTrace() {
   }

   before(): methodToTrace() {
      System.out.println("[BGN]" + thisJoinPointStaticPart.getSignature() + ", " + //
            thisJoinPointStaticPart.getSourceLocation().getLine());
   }
    
   after(): methodToTrace() {
      System.out.println("[END]" + thisJoinPointStaticPart.getSourceLocation().getFileName());
   }
}
