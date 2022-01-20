/mob
    icon = 'icons/mobs.dmi'
    icon_state = "player"

/mob/New()
	. = ..()
	spawn(100)
		make_runtime()
		make_non_runtime()	

/proc/make_runtime()
	
	world.log << "now replicating the runtime"
	
	var/static/static_string = "this will runtime every time if its not changed"
	var/non_static_string = "this doesnt runtime"

	world.log << "the full static string is: [static_string]"
	world.log << "the static string is supposed to be: this will runtime every time if its not changed"  
	world.log << "the full non static string is: [non_static_string]"
	sleep(10)
	
	world.log << "the first character of the non static string is: [non_static_string[1]]"//outputs "t"
	sleep(10)
	
	world.log << "trying to access to global value of the static string via global.vars gives the value: [global.vars["static_string"]]"
	sleep(10)
	
	world.log << "the first character of the static string is: [static_string[1]]"//runtimes because static_string is of the value ""
	sleep(10)

	
/proc/make_non_runtime()
	world.log << "now trying to fix this bug by assigning the static string a value at runtime"
	var/static/static_string = "this will runtime if i try to access any index char"
	world.log << "without changing its value the static_string starts as: [static_string]"
	sleep(10)
	
	static_string = "this will not runtime anymore"
	world.log << "after changing the value of static_string at runtime: [static_string]"
	
	sleep(10)
	world.log << "the first char of static_string after changing its value is: [static_string[1]]"
	
	
