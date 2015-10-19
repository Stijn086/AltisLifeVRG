SinCity-Altis
=============

dev getting started guide.

PBO Manager: http://www.armaholic.com/page.php?id=16369

Setting up a local dedi server on ur pc. for testing.
  
  Video Guide: https://www.youtube.com/watch?v=TrGQ4B2ikR4
  Programs used:
     
      server launcher: http://www.armaholic.com/page.php?id=11655
        this program makes it alot easier to set ur launch settings and saves u editing text files for days. 
      
      extdb: https://github.com/Torndeco/extdb
        clone this repo and use under windows_release 14 debug logging (this is a test server so u want debug logging)
      
      altis-life: https://github.com/TAWTonic/Altis-Life
        u want to use the extdb folder pbos (use the default pbos to verify it all works before switching to our pbos).
        it also has the script to setup the database. if u follow the youtube guide.
      
      xampp: https://www.apachefriends.org/index.html
        up to u if uw anna use its purpose is to run the mysql server. and give u access to phpmyadmin to edit the
        database. install apache and mysql. and start both before trying to click on admin for mysql and it will work
        (cause in the video he couldnt get it working)
      
      mysql editor: i prefer mysql workbench use whatever sql editor u like. http://www.mysql.com/products/workbench/ 
        use ur brain i shouldnt need to explain this.
      
      steamcmd: http://media.steampowered.com/installer/steamcmd.zip
        use this to download arma server files as per the video guide. 
  
  dont forget to port forward the steam port UDP on ur router/modem so other people other then urself can connect to it.
  and that ur pc's local firewall isnt being a cunt. also i had mad issues with it just not working after i set it up and    installed everything and it magically unshat itself when i reset my pc and jsut worked. 
      


WorkFlow Guide:
whenever u ahve a new feature or a new issue u want to work on make a new branch and name it after whatever it is ur changing
is about. ideal way will be to name it after the issue number from the issue section if we get alot of branches.
make all ur changes in that branch commit often it doesnt matter how much just do it often come sin handy if u ever need to roll backa  small part of what uve done.
when you are either done with the fix / feature. or ur done working on it push it to the server. someone else can always pick it up where u left it.
this allows u to not have to focus on one thing and u can switch between multiple fixes. if u plan to do this make sure ur commit messages are meaningfull so someone else
can see what u were tryign to fix and how. 

ok so uve made this cool feature or fixed this mad bug now what?. u create a pull request between the master and your branch
please avoid fucking auto merge them the idea behind this is that all of us can review the changes and look for any errors or issues
and allows us to all run ur branch on our own local dedis to test its not fucked. if alot of people agree its good to go or atleast 1-2 people.
then merge it to master. 

so now we have this master build thats getting all these pushes for all these different things. how do we know when its ready to go ont he server?.
well when we think the master is stable and good to go. someone makes a pull request to merge the master into production branch
and we then again do some tests and if a few people say its good merge it through. the production branch is the branch u make PBO's of to put on the live server.

why this extra branch step u ask? well u dont have to scratch ur head and think which commit back was last stable and fully working incase we fuck up and the live server breaks.
u just very quickly roll back the production branch and make new PBO's so u can tell all the crying cunts in ts to stfu u got this and fix it within minutes.

this means u no longer need to keep every old version of the pbo's on the server can just delete them as they are easily retrievable from github. 
