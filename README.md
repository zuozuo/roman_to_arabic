#### To run this program you should do the following things:
	- Install ruby: the version I used is `ruby 1.9.3p392`, you should use ruby 1.9+
	- Install bundler:
		`gem install bundler`
	- Then run `bundle install` in the program directory
	- You can run `rspec` to run all the spec test case, and all of them will pass
	- To run the program: `ruby run.rb`, or you can supply it with two commandline arguments like `ruby run.rb input.txt output.txt`, 
		the first argument specify the input file path while the second is output file path, `input.txt` and `output.txt` in the program directory
		is the default
#### Input requirement
	The input file must follow the input example supplied in the question.
	First you should tell the program the basic numerals units transformational relation with Roman numerals, like:
		
		eeee is I
		bbbb is V
		xxxx is X
		cccc is M

  Then you should tell it how much Credits equal to A specific amount of Silver, Iron or Gold, for example: 

		eeee eeee Silver is 100 Credits
		cccc cccc Gold is 42100 Credits
		bbbb eeee Iron is 300 Credits
	
  Then you can ask some question like :

		how much is eeee eeee ?
		how many Credits is xxxx Silver ?
	
  if you say something other to it, it will answer: I have no idea what you are talking about
	











