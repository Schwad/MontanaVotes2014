MontanaVotes2014
================

Twitter bot that posted up to date tweets as Montana Legislative votes came in in 2014

##Bot Purpose

This was hacked together by Schwad as a first foray into the twitter API and web scraping in later October 2014. The goal was to automatically scrape live election results in Montana State House races from http://sos.mt.gov and live tweet them, one at a time, through the twitter account @MontanaVote2014. 

Every fourth cycle through candidates it would post results to hashtag #mtpol, roughly once an hour. #mtpol is the main hashtag for everything to do with Montana Politics.

##Shortcomings and improvements

*Needs to scrape candidate name, party and district

*Needs to be converted from array format to hash format

*If more robust scraping techniques were used, it would be neat to be able to use a command-line interface to pull and or tweet results by state; the idea of one program being able handle all 50 states without constant updating may be near impossible.
*Needs to include state senate
