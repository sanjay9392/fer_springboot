package com.rs.core.optionalexample;

import java.util.Optional;  
public class OptionalExample3 {  
    public static void main(String[] args) {  
    	
    	String[] names = {"naresh", "vinay", "sai",null,"Dilep","sharuk"};
    	
		Optional<String> opt = Optional.ofNullable(names[3]);
        System.out.println(opt.orElse("default"));     
    }  
}  
