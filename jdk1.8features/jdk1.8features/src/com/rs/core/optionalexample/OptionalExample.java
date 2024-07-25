package com.rs.core.optionalexample;

/*public class WithoutUsingOptional {

	 public static void main(String[] args) {  
	        String[] str = new String[10];  
	        String lowercaseString = str[5].toLowerCase();  
	        System.out.print(lowercaseString);  
	    }  
	} */

//Optional Example: If Value is not Present

  /*import java.util.Optional;  
   public class OptionalExample {  
    public static void main(String[] args) {  
        String[] str = new String[10];  
        Optional<String> checkNull = Optional.ofNullable(str[5]);  
        if(checkNull.isPresent()){  // check for value is present or not  
            String lowercaseString = str[5].toLowerCase();  
            System.out.print(lowercaseString);  
        }else  
            System.out.println("string value is not present");  
    }  
} */
   
   //Optional Example: If Value is Present

/*import java.util.Optional;  
public class OptionalExample {  
    public static void main(String[] args) {  
        String[] str = new String[10];        
        str[5] = "JAVA OPTIONAL CLASS EXAMPLE";// Setting value for 5th index  
        Optional<String> checkNull = Optional.ofNullable(str[5]);  
        if(checkNull.isPresent()){  // It Checks, value is present or not  
            String lowercaseString = str[5].toLowerCase();  
            System.out.print(lowercaseString);  
        }else  
            System.out.println("String value is not present");  
    }  
} */ 

   //Another Java Optional Example
  /* import java.util.Optional;  
   public class OptionalExample {  
    public static void main(String[] args) {  
        String[] str = new String[10];        
        str[5] = "JAVA OPTIONAL CLASS EXAMPLE";  // Setting value for 5th index  
        Optional<String> checkNull = Optional.ofNullable(str[5]);  
        checkNull.ifPresent(System.out::println);   // printing value by using method reference  
        System.out.println(checkNull.get());    // printing value by using get method  
        System.out.println(str[5].toLowerCase());     
    }  
}  */

  //Java Optional Methods Example

import java.util.Optional;  
public class OptionalExample {  
    public static void main(String[] args) {  
        String[] str = new String[10];        
        str[5] = "JAVA OPTIONAL CLASS EXAMPLE";  // Setting value for 5th index  
        // It returns an empty instance of Optional class   
        Optional<String> empty = Optional.empty();  
        System.out.println(empty);  
        // It returns a non-empty Optional  
        Optional<String> value = Optional.of(str[5]);  
        // If value is present, it returns an Optional otherwise returns an empty Optional  
        System.out.println("Filtered value: "+value.filter((s)->s.equals("Abc")));  
        System.out.println("Filtered value: "+value.filter((s)->s.equals("JAVA OPTIONAL CLASS EXAMPLE")));  
        // It returns value of an Optional. if value is not present, it throws an NoSuchElementException    
        System.out.println("Getting value: "+value.get());  
        // It returns hashCode of the value  
        System.out.println("Getting hashCode: "+value.hashCode());  
        // It returns true if value is present, otherwise false  
        System.out.println("Is value present: "+value.isPresent());  
        // It returns non-empty Optional if value is present, otherwise returns an empty Optional  
        System.out.println("Nullable Optional: "+Optional.ofNullable(str[5]));  
        // It returns value if available, otherwise returns specified value,  
        System.out.println("orElse: "+value.orElse("Value is not present"));  
        System.out.println("orElse: "+empty.orElse("Value is not present"));  
        value.ifPresent(System.out::println);   // printing value by using method reference   
    }  
}  
   