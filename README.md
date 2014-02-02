Takeaway
========

Date: Friday 31st January 2014

Task
----
1. Write a class Takeaway
2. Implement the following functionality:
	a. list of dishes with prices
	b. placing the order by giving the list of dishes their quantities and a number that
		 should be the exact total. If the sum is not correct the method should raise an
		 error, otherwise the customer is sent a text saying that the order was placed 
		 successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your
		 order was placed and will be delivered before 18:52".
	c. The text sending functionality should be implemented using Twilio API. You'll need 
		 to register for it. It's free.
	d. Use twilio-ruby gem to access the API
	e. Use a Gemfile to manage your gems
	f. Make sure that your Takeaway class is thoroughly tested and that you use mocks and/or 
		 stubs, as necessary to not send texts when your tests are run.
	g. However, if your Takeaway class is loaded inot IRB and the order is placed, the text 
		 should actually be sent
3. A free account on Twilio will only allow you to send texts to "verified" numbers. Use your
	 mobile phone number, don't worry about the customer's mobile phone.

	 