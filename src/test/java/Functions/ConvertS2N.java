package Functions;

import java.util.ArrayList;
import java.util.List;

public class ConvertS2N {

	public static List<Integer>  castS2N(List<String> x)
	{
		List<Integer> y=new ArrayList<Integer>();
		for(String number : x) {
			   y.add(Integer.parseInt(number)); 
			}
		
		return y ;
		
	}
}
