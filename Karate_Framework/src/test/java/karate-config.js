function fn() {
	var env = karate.env; // get system property 'karate.env' karate.log('karate.env system property was:', env); 
	if (!env) {
		env = 'dev';
	}

	var config = {
		env: env,
		myVarName: 'hello karate',
		baseUrl: 'https://gorest.co.in',
		tokenID: '740f35a2f0aa61d576ce9fa45123dda2c2d8271f7f9ed36bcab02914f91f0cbb'
	}

	if (env == 'dev') {
		// customize 
		// e.g. config.foo = 'bar'; 
	} else if (env == 'e2e') {
		// customize 
	}
	return config;
}