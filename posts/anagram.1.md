# [Anagram.py](#posts/anagram) #
_March 22, 2013_

At PyCon '13 many of the sponsors were offering up coding challenges as ways of
engaging the community with them and some (google) as an opportunity to grab
potential candidates. These challenges ranged from small one-liner puzzles to
the full blown challenge that my co-worker Philip and I did, Anagram.py.

Anagram.py was created judged by [Thumbtack](http://thumbtack.com). The prizes
were:

*  A coffee mug and sunglasses for the simple challenge
*  A beer mug and a shot glass for the bonus challenge

This challenge was broken up into two parts, the first was to find the only
two-word anagram pair in a given body of text. For example:

_Guido was HAPPY ONCE he solved Thumbtack's PYCON challenge and won a HEAP of
prizes!_

In this sentence if you combine and re-arrange the letters in 'happy once' you
can form 'PyCon heap'.

Rules for this part of the challenge:

*  Read the text corpus from stdin and print the anagram pairs to stdout.
*  Your solution must be case-insensitive -- mug and Gum are considered anagrams
*  The words in each pair must not appear in the other pair.
*  Treat all non-alphanumeric characters as whitespace - "He's twenty-seven,
   and" would be considered five words: he, s, twenty, seven, and.
*  Ignore all words with fewer than four letters

My solution to this first problem is on [My GitHub](https://github.com/tebriel/anagramfinder/blob/master/anagram.py)
The text given as a test for the first problem is located at: http://thumb.tk/8PYN

This was fairly easy. My solution goes like this:

1.  split up all the words
1.  create all the unique combinations
1.  sort the letters in each combination
1.  store these "hashes" into a hashmap, combining those that have the same
    hash
1.  look for any hash that has multiple entries
1.  print out the result

Python does a great job giving you almost any tool you could imagine needing
and itertools has some great features. `itertools.combinations` is fantastic,
just pass it a list and how many items you'd like to have in each combination
and it will return a generator which will `yield` a new combination each time
it's called.

The bonus solution was a bit harder, and had some extra rules.

*  Make the anagram finder more general. Find the largest set(s) of disjoint
word pairs that all anagram to each other in a given corpus.
*  Alice in Wonderland contains two sets of 10 word-pairs, using the same rules
   as before. Can you find the sets?


The real kicker here was that you needed to find disjoint word pairs. So you
couldn't have 'word mug' and 'word gum'. Even though those two are anagrams of
each other, it reuses the word 'word', not acceptable. Note, there's a lot of
these non-disjoint word pairs in the text.

My soultion to this bonus problem is on [My Github](https://github.com/tebriel/anagramfinder/blob/master/anagram2.py)
The URL for the entire Alice in Wonderland Text: http://thumb.tk/8Qd3

This one started out the same as before, but this time a filtering step was
needed. Originally I did filtering during the anagram finding, but this proved
to be quite slow and used about 1GB of memory during runtime. Philip and I
spent a lot of our freetime at the conference finding ways to optimise the
code. I learned some new tricks this way, like that global lookups are
expensive, so on entry to a method with a large loop you can store the global
function/variable in a local one you shave off about 0.5s from the runtime. 

Another optimisation that I tried (and had good success with) was PyPy. PyPy
does JIT for Python, and I saw about a 2.0s speedup with it as opposed to
standard Python. Python 3.3 was also about 0.5s faster than Python 2.7.

My initial runtime when I first solved this puzzle was 48s, with PyPy and the
many optimisations that I did, it now runs sub 10s and uses about 500MB of
memory. I'd consider this a win. My next plan is to ignore speedup and instead
decrease the memory footprint with a goal of running it on the RaspberryPi that
everyone got for attending PyCon. The currentl solution froze it and I had to
hard reboot as it would not respond to any input.

Many thanks to Thumbtack and the other sponsors of challenges at PyCon. It was
definitely great fun and the prizes are all over the office here at
[Endgame](http://www.endgame.com).

If you devise a faster solution, I'd love to see it!
