package TestFeatures;

import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import com.intuit.karate.junit4.Karate;

@RunWith(Karate.class)
public class Runner1 {
	@BeforeClass
	public static void before()
	{
		//this for choosing env
		//System.setProperty("karate.env", "qa");
	}
}
