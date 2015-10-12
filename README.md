Programming in Haskell
==================

This is a repo with code examples from this [excellent book](http://www.amazon.com/Programming-Haskell-Graham-Hutton/dp/0521692695) that I'm using to start playing with the **Haskell** language.

### Bit of troubleshooting
When solving excercises, was having these **Exception: chapter-2/exercises.hs:21:1-31: Non-exhaustive patterns in function myLast**
So I kicked off the repl using `ghci -fwarn-incomplete-patterns`, that gives you more meaningful warnings.
