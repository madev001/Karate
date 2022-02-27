function fn()
{
	
	var config ={
		BaseURL : 'https://reqres.in/api/',
		JsonPlaceholderURL : 'https://jsonplaceholder.typicode.com/'
	};
	
	var env = karate.env
	karate.log(env);
	if(env =='qa')
	{
		config.BaseURL = 'https://reqres.in/api/qa'
	}
	
	else if(env =='dev')
	{
		config.BaseURL = 'https://reqres.in/api/dev'
	}
	else
	{
		config.BaseURL = 'https://reqres.in/api/'
	}
	return config;
}