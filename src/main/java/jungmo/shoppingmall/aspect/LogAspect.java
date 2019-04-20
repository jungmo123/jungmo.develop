package jungmo.shoppingmall.aspect;

import org.apache.logging.log4j.*;
import org.aspectj.lang.*;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.*;

@Aspect
@Component
public class LogAspect {
	private Logger logger;
	
	public LogAspect(){
		logger = LogManager.getLogger(LogAspect.class);
	}
	
	@Around("execution(* jungmo.shoppingmall.*.*.service.*.*(..))")
	public Object advice(ProceedingJoinPoint jp)  throws Throwable{
		logger.info(jp.toShortString() + "시작 ");
		Object obj = jp.proceed();
		logger.info(jp.toShortString() + "끝");
		return obj;
	}
}
