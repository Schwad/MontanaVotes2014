require 'rubygems'
require 'oauth'
require 'json'
require 'mechanize'
require 'nokogiri'
require 'open-uri'

while true 
  z = 0                        ##Every four cycles posts to #mtpol
  while z <= 4
    agent = Mechanize.new
    votes_page = agent.get("http://electionresults.sos.mt.gov/resultsSW.aspx?type=HOUSE&map=DIST&lValue=100&gValue=001")

    candidates_array = [
                  [01, "Jerry Bennett", "R"],
                  [01, "Donald Coats", "D"],
                  [02, "Steven Benson", "D"],
                  [02, "Mike Cuffe", "R"],
                  [03, "Chris Colvin", "L"],
                  [03, "Jerry ONeil", "R"],
                  [03, "Zac Perry", "D"],
                  [04, "Melanie Knadler", "D"],
                  [04, "Keith Regier", "R"],
                  [05, "Doug Adams", "R"],
                  [05, "Ed Lieser", "D"],
                  [06, "David Fischlowitz", "D"],
                  [06, "Carl Glimm", "R"],              
                  [07, "Frank Garner", "R"],
                  [07, "Catie Henderson", "D"],
                  [8, "Steve Lavin", "R"],
                  [8, "Lynn Stanley", "D"],
                  [9, "Randy Brodehl", "R"],
                  [9, "Jo Lynn Yenne", "D"],
                  [10, "Ruby Dynneson", "D"],
                  [10, "Mark Noland", "R"],
                  [11, "Kim Fleming", "D"],
                  [11, "Al Olszewski", "R"],
                  [12, "Greg Hertz", "R"],
                  [12, "William McLaughlin", "D"],
                  [13, "Weylin Achatz", "D"],
                  [13, "Bob Brown", "R"],
                  [14, "Terry Caldwell", "D"],
                  [14, "Nick Schwaderer", "R"],
                  [15, "George Kipp", "D"],
                  [15, "Joe Read", "C"],              
                  [16, "Lila Evans", "R"],
                  [16, "Susan Weber", "D"],
                  [17, "Christy Clark", "R"],
                  [17, "Kurt Dyer", "D"],
                  [18, "Rob Cook", "R"],
                  [19, "Elaine Olsen", "D"],              
                  [19, "Randy Pinocci", "R"],
                  [20, "Steve Fitzpatrick", "R"],
                  [20, "Bob Moretti", "D"],
                  [21, "Tom Jacobson", "D"],
                  [21, "Cleve Loney", "R"],
                  [22, "Bob Mehlhoff", "D"],              
                  [23, "Wendy McKamey", "R"],
                  [23, "Earl Salley", "D"],
                  [24, "Fred Anderson", "R"],
                  [24, "Jean Price", "D"],
                  [25, "Benn Koljonen", "R"],
                  [25, "Casey Schreiner", "D"],              
                  [26, "Jeremy Trebas", "R"],
                  [26, "Mitch Tropila", "D"],
                  [27, "Roy Hollandsworth", "R"],
                  [27, "Rob Laas", "D"],
                  [28, "Stephanie Hess", "R"],
                  [28, "Janet Trethewey", "D"],              
                  [29, "Bill Harris", "R"],
                  [29, "Ron Moody", "D"],
                  [30, "Ryan Osmundson", "R"],
                  [30, "Dan Simpson", "D"],
                  [31, "Bridget Smith", "D"],
                  [32, "Clarena Brockie", "D"],              
                  [32, "Gilbert Meyers", "R"],
                  [33, "Michael Finley", "D"],
                  [33, "Mike Lang", "R"],
                  [34, "Gene Hartsock", "D"],
                  [34, "Austin Knudsen", "R"],
                  [35, "Rob Knotts", "D"],              
                  [35, "Scott Staffanson", "R"],
                  [36, "Alan Doane", "R"],
                  [36, "Edward Hansen", "D"],
                  [37, "Lee Randall", "R"],
                  [37, "Dixie Rieger", "D"],
                  [38, "Kenneth Holmlund", "R"],              
                  [38, "Steven Muggli", "D"],
                  [39, "Geraldine Custer", "R"],
                  [39, "Howard Keller", "D"],
                  [40, "Tom Berry", "R"],
                  [40, "Edith Sloan", "D"],
                  [41, "Patricia Peppers", "D"],              
                  [42, "Carolyn Pease-Lopez", "D"],
                  [43, "Clayton Fiscus", "R"],
                  [43, "John Pulasky", "D"],
                  [44, "Dale Mortenson", "R"],
                  [44, "Sandy Wong", "D"],
                  [45, "Stephen Hoklin", "D"],              
                  [45, "Daniel Zolnikov", "R"],
                  [46, "Don Jones", "R"],
                  [46, "Paul Van Tricht", "D"],
                  [47, "Katharin Kelker", "D"],
                  [47, "Joshua Sizemore", "R"],
                  [48, "Jessica Karjala", "D"],              
                  [48, "Dennis Lenz", "R"],
                  [49, "Cory Hasiak", "R"],
                  [49, "Kelly McCarthy", "D"],
                  [50, "Virginia Court", "D"],
                  [50, "Tom Richmond", "R"],
                  [51, "Margie Macdonald", "D"],              
                  [51, "Tony O'Donnell", "R"],
                  [52, "Chris Goodridge", "D"],
                  [52, "Dave Hagstrom", "R"],
                  [53, "Clarissa Cerovski", "D"],
                  [53, "Sarah Laszloffy", "R"],
                  [54, "Jeff Essmann", "R"],              
                  [54, "Jeffrey Hill", "L"],
                  [54, "Nancy Rasky", "D"],
                  [55, "Vince Ricci", "R"],
                  [55, "Don Woerner", "D"],
                  [56, "Tom Curry", "D"],
                  [56, "Jonathan McNiven", "R"],              
                  [57, "Michael Huff", "D"],
                  [57, "Forrest Mandeville", "R"],
                  [58, "Seth Berglee", "R"],
                  [58, "Mitzi Vorachek", "D"],
                  [59, "Karen Lynch", "D"],
                  [59, "Alan Redfield", "R"],              
                  [60, "Debra Lamm", "R"],
                  [60, "Reilly Neill", "D"],
                  [61, "Nick Mahan", "R"],
                  [61, "Kathleen Williams", "D"],
                  [62, "Vicki Schultz", "R"],
                  [62, "Tom Woods", "D"],              
                  [63, "Zach Brown", "D"],
                  [63, "Nathan Maclaren", "R"],
                  [64, "Chris Burke", "D"],
                  [64, "Kerry White", "R"],
                  [65, "Mike More", "R"],
                  [65, "Chris Pope", "R"],              
                  [66, "Denise Hayman", "D"],
                  [66, "Ed Johnson", "R"],
                  [67, "Jeannie Brown", "D"],
                  [67, "Tom Burnett", "R"],
                  [68, "Ashley Stevick", "D"],
                  [68, "Art Wittich", "R"],              
                  [69, "Mark Bond", "D"],
                  [69, "Matthew Monforton", "R"],
                  [70, "Marla Clark", "D"],
                  [70, "Kelly Flynn", "R"],
                  [71, "Johanna Lester", "D"],
                  [71, "Ray Shaw", "R"],              
                  [72, "Norma Duffy", "D"],
                  [72, "Jeff Welborn", "R"],
                  [73, "Edie McClafferty", "D"],
                  [74, "John Driscoll", "I"],
                  [74, "Pat Noonan", "D"],
                  [75, "Kevin Keeler", "D"],              
                  [75, "Kirk Wagoner", "R"],
                  [76, "Ryan Lynch", "D"],
                  [77, "Kathy Swanson", "D"],
                  [78, "Suzzann Nordwick", "R"],
                  [78, "Gordon Pierson", "D"],
                  [79, "Jenny Eck", "D"],              
                  [79, "John Perkins", "R"],
                  [80, "Elizabeth Cain", "D"],
                  [80, "Mike Miller", "R"],
                  [80, "Ron Vandevender", "L"],
                  [81, "Janet Ellis", "D"],
                  [81, "Michael Pardis", "R"],              
                  [82, "Liz Bangerter", "R"],
                  [82, "Moffie Funk", "D"],
                  [83, "Chuck Hunter", "D"],
                  [84, "Mary Ann Dunwell", "D"],
                  [84, "Steve Gibson", "R"],
                  [85, "Theresa Manzella", "R"],              
                  [85, "James Youso", "D"],
                  [86, "Ron Ehli", "R"],
                  [86, "Nancy Schneider", "D"],
                  [87, "Nancy Ballance", "R"],
                  [87, "Erin Houtchens", "D"],
                  [88, "Ed Greef", "R"],              
                  [88, "Dan Metully", "D"],
                  [89, "Nate McConnell", "D"],
                  [90, "Ellie Hill", "D"],
                  [91, "Bryce Bennett", "D"],
                  [92, "Doc Moore", "R"],
                  [92, "Dave Strohmaier", "D"],              
                  [93, "Susan Evans", "D"],
                  [93, "Dan Salomon", "R"],
                  [94, "Kim Dudik", "D"],
                  [94, "Gary Marbut", "I"],
                  [95, "Nancy Wilson", "D"],
                  [96, "Lyn Hellegaard", "R"],              
                  [96, "Andrew Person", "D"],
                  [97, "Bill Geer", "D"],
                  [97, "Charles Satchfield", "L"],
                  [97, "Brad Tschida", "R"],
                  [98, "Willis Curdy", "D"],
                  [98, "Roger Seewald", "R"],              
                  [99, "Tom Steenberg", "D"],
                  [100, "Andrea Olsen", "D"]
                                          ]
    voting_percentage = votes_page.search('.ig_9b9da11f_5').text.strip
    voting_mega_array = voting_percentage.split("%") #separates voting percentage amounts in order

#####################################################################
##############SANDBOX AREA BELOW
#####################################################################

    new_array_time = Hash.new    
#    i=1    
#    while i <= 100
#      new_array_time[i] = []
#      i += 1
#    end
   
    #Full scraping format below, need to master CSS Selectors
    #array_iterator = 1
    #votes_page.search('.divRace').each do |trtd|
    #  new_array_time[array_iterator] << trtd.text.strip.split("")[-2..-1].join
    #  array_iterator += 1
    #end

    #below, race_number.text.gsub(/[^\d]/,'') is the actual race number (i.e. 1, 2, 3, ... 100)
    votes_page.search('.racedisplay .divRace').each do |race_number|
      new_array_time[race_number.text.gsub(/[^\d]/,'')] = {} #intialize each race with an empty hash, #where the key of the new_array_time hash is the race number
    end



    ####EVERYTHING ABOVE WORKS .... JUST GOTTA MASTER SCRAPING IT ALL. REMEMBER SELECTOR GADGET IN THE TOOLBAR
        array_iterator = 1
    votes_page.search('.divRace').each do |trtd|
      new_array_time[array_iterator] << trtd.text.strip
      array_iterator += 1
    end


    #Checks debug and exits
   # puts new_array_time
    exit
    z += 1                     #Hourly #mtpol hashtag
  end
  sleep 30 
end