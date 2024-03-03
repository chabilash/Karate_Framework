package features;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	
//	@Karate.Test 
//	Karate getAPITest() {
//		
//		return Karate.run("getAPI").relativeTo(getClass());
//	}
	
	@Karate.Test
	Karate postAPITestJSON() {
		
		return Karate.run("postAPI_Json").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate updateUserTest() {
		
		return Karate.run("updateUserPOST&PUT").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate deleteAPITest() {
		
		return Karate.run("deleteAPI").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate postAPITest() {
		
		return Karate.run("postAPI_RandomUserDetails").relativeTo(getClass());
	}

}
