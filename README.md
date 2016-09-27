# Hello, fellow developers!

Welcome to URDb, your go-to source for all things movies related. Whether it be movie ratings, actors, or reviews, you know you can find it all here! (Kind of.)

 As successful as we have been so far, we've run into a lot of bugs - and because of that, we've hired you to come and write an extensive (ish) test suite to prevent problems in the future. Let's get you set up.

## Setup

To begin, clone/fork this repository.

Afterward, run:

```
bundle install
```

to install rspec, our testing framework of choice.

To create our database, run:

```
rake db:create && rake db:migrate
```

Let's make sure our testing framework is working by running

```
rspec
```
You should see tests run....and fail. What happened? Let's keep going.

## Part 1

Let's first take a look at what we have so far - it looks like we have a ```Movie``` model, that has a ```name```, and a ```rating``` - see [`/app/models/movie.rb`](/app/models/movie.rb)

We've started writing some tests for you - located in [`spec/models`](spec/models). We definitely want to make sure that is data validation before we save our models - unfortunately, URDb didn't have the time to actually make the tests pass.

**Task 1:** Add the proper validations to the movie model to make the tests pass.

**Hint:** Take a look at the rails documentation to see how **validations** on data are used.  
(If you are really stuck, go to the ```reference``` branch for reference solutions.)

## Part 2

Note: Remember to write your tests before working on the implementations of these methods.

Now that you've been able to take a peek into our testing framework, it's time to write our own tests. URDb wants to add a new feature that averages the ratings from a list of movies that we 'fetch' from Paramount Pictures. We've added a method where you can implement that in the movies model. (```average_paramount_rating```).

First, let's write some tests for the expected behavior for our method. If you take a look at the `self.from_paramount` method in the movies class, you'll see that we've simulated a ten-second sleep, which would usually come from calling the Paramount Pictures API.

**Task 2:** Stub that method so that we don't have to wait ten seconds every time we call this method.

Now, add more test cases to test corner cases (as well as normal use cases) - what if the list is empty?

If you need help, consult the rspec documentation or google first before looking at the reference implementation (in the ```reference``` branch)
