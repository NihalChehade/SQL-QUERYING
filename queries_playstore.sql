-- Comments in SQL Start with dash-dash --

--Find the app with an ID of 1880

SELECT * FROM analytics WHERE id = 1880;

  id  |        app_name         |   category   | rating | reviews |        size        | min_installs | price | content_rating |     genres     | last_updated | current_version |  android_version
------+-------------------------+--------------+--------+---------+--------------------+--------------+-------+----------------+----------------+--------------+-----------------+--------------------
 1880 | Web Browser for Android | PRODUCTIVITY |    4.3 |  144879 | Varies with device |     10000000 |     0 | Everyone       | {Productivity} | 2016-01-24   | 3.5.0           | Varies with device
(1 row)

-- Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';--

  id  |                                     app_name
------+-----------------------------------------------------------------------------------
   10 | Clash Royale
   11 | Candy Crush Saga
   12 | UC Browser - Fast Download Private & Secure
   74 | Score! Hero
  101 | Tiny Flashlight + LED
  102 | Crossy Road
  103 | SimCity BuildIt
  111 | FIFA Soccer
  112 | Angry Birds 2
  125 | Need for Speed™ No Limits
  126 | YouCam Makeup - Magic Selfie Makeovers
  152 | Fallout Shelter
  159 | DU Recorder – Screen Recorder, Video Editor, Live
  160 | Bike Race Free - Top Motorcycle Racing Games
  161 | KakaoTalk: Free Calls & Text
  162 | Dolphin Browser - Fast, Private & Adblock🐬
  163 | Opera Browser: Fast and Secure
  164 | MARVEL Contest of Champions
  184 | Video Editor Music,Cut,No Crop
  226 | Frozen Free Fall
  260 | Chess Free
  276 | ► MultiCraft ― Free Miner! 👍
  277 | Vlogger Go Viral - Tuber Game
  300 | Bad Piggies
  301 | Skater Boy
  356 | S Photo Editor - Collage Maker , Photo Collage
  357 | Magisto Video Editor & Maker
  358 | Itau bank
  359 | DEER HUNTER 2018
  360 | Mobizen Screen Recorder for SAMSUNG
  362 | Bike Racing 3D
  425 | Bomber Friends
  426 | Lep’s World 3 🍀🍀🍀
  431 | MakeupPlus - Your Own Virtual Makeup Artist
  436 | Photo Collage Maker
  465 | ivi - movies and TV shows in HD
  466 | Calculator Plus Free
  467 | Indeed Job Search
  507 | MakeMyTrip-Flight Hotel Bus Cab IRCTC Rail Booking
  569 | Waplog - Free Chat, Dating App, Meet Singles
  570 | ESPN
  580 | Galaxy Attack: Alien Shooter
  620 | HD Camera Ultra
  663 | Fire Emblem Heroes
  664 | Daily Horoscope
  682 | Equestria Girls
  683 | Ingress
  740 | Arrow.io

-- Count the number of apps in each category, e.g. “Family | 1972”.
SELECT category, COUNT(*)
FROM analytics
GROUP BY category;

      category       | count
---------------------+-------
 BOOKS_AND_REFERENCE |   191
 COMMUNICATION       |   342
 BEAUTY              |    46
 EVENTS              |    52
 PARENTING           |    59
 PHOTOGRAPHY         |   313
 GAME                |  1110
 BUSINESS            |   313
 SOCIAL              |   269
 MEDICAL             |   350
 TOOLS               |   753
 TRAVEL_AND_LOCAL    |   234
 ART_AND_DESIGN      |    63
 LIFESTYLE           |   319
 WEATHER             |    79
 COMICS              |    59
 PRODUCTIVITY        |   360
 PERSONALIZATION     |   329
 FINANCE             |   331
 SPORTS              |   338
 ENTERTAINMENT       |   149
 NEWS_AND_MAGAZINES  |   249
 HOUSE_AND_HOME      |    82
 SHOPPING            |   241
 DATING              |   204
 HEALTH_AND_FITNESS  |   298
 EDUCATION           |   156
 MAPS_AND_NAVIGATION |   129
 LIBRARIES_AND_DEMO  |    80
 FOOD_AND_DRINK      |   110
 FAMILY              |  1789
 VIDEO_PLAYERS       |   165
 AUTO_AND_VEHICLES   |    75
(33 rows)

-- Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT app_name , reviews FROM analytics ORDER BY reviews DESC LIMIT 5;

                 app_name                 | reviews
------------------------------------------+----------
 Facebook                                 | 78158306
 WhatsApp Messenger                       | 78128208
 Instagram                                | 69119316
 Messenger – Text and Video Chat for Free | 69119316
 Clash of Clans                           | 69109672
(5 rows)

-- Find the app that has the most reviews with a rating greater than equal to 4.8.
SELECT app_name , reviews, rating FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC
 LIMIT 1;

  app_name  | reviews | rating
------------+---------+--------
 Chess Free | 4559407 |    4.8
(1 row)

-- Find the average rating for each category ordered by the highest rated to lowest rated.
SELECT category, AVG(rating)
FROM analytics
GROUP BY category
ORDER BY AVG(rating) DESC;

      category       |        avg
---------------------+--------------------
 EVENTS              |  4.395238104320708
 EDUCATION           |   4.38903223006956
 ART_AND_DESIGN      |  4.347540949211746
 BOOKS_AND_REFERENCE | 4.3423728633061645
 PERSONALIZATION     |    4.3283387457509
 BEAUTY              |  4.299999970656175
 GAME                |  4.287167731498383
 PARENTING           |  4.285714266251545
 HEALTH_AND_FITNESS  | 4.2743944663902464
 SHOPPING            |  4.253648051376507
 SOCIAL              |  4.245669291244717
 WEATHER             |   4.24399998664856
 SPORTS              |  4.233333332576449
 PRODUCTIVITY        |  4.212173904543338
 AUTO_AND_VEHICLES   |  4.200000017881393
 HOUSE_AND_HOME      |  4.197368430463891
 PHOTOGRAPHY         |  4.196116511489967
 MEDICAL             | 4.1926829182520144
 FAMILY              | 4.1904873752761995
 LIBRARIES_AND_DEMO  | 4.1784615259904125
 FOOD_AND_DRINK      |  4.155660354866172
 COMICS              |  4.155172401461108
 COMMUNICATION       |  4.151234589241169
 FINANCE             |  4.146835436549368
 NEWS_AND_MAGAZINES  |  4.130131007281974
 ENTERTAINMENT       |   4.12617449632427
 BUSINESS            |  4.116666667004849
 TRAVEL_AND_LOCAL    |   4.10179372753263
 LIFESTYLE           |  4.077076400237226
 VIDEO_PLAYERS       |  4.059748438919115
 MAPS_AND_NAVIGATION |  4.058196711735647
 TOOLS               |  4.050627608678331
 DATING              |  3.993684190825412
(33 rows)

-- Find the name, price, and rating of the most expensive app with a rating that’s less than 3.
SELECT app_name, price, rating
FROM analytics
WHERE rating < 3
ORDER BY price DESC
LIMIT 1;

      app_name      | price  | rating
--------------------+--------+--------
 Naruto & Boruto FR | 379.99 |    2.9
(1 row)

-- Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
SELECT * FROM analytics
WHERE min_installs <= 50 AND rating IS NOT NULL
ORDER BY rating DESC;

  id  |                    app_name                    |      category       | rating | reviews | size | min_installs | price | content_rating |        genres         | last_updated |  current_version   | android_version
------+------------------------------------------------+---------------------+--------+---------+------+--------------+-------+----------------+-----------------------+--------------+--------------------+-----------------
 9468 | DT                                             | FAMILY              |      5 |       4 | 52M  |           50 |     0 | Everyone       | {Education}           | 2018-04-03   | 1.1                | 4.1 and up
 9464 | DQ Akses                                       | PERSONALIZATION     |      5 |       4 | 31M  |           50 |  0.99 | Everyone       | {Personalization}     | 2018-04-27   | 1.1                | 4.1 and up
 9453 | DM Adventure                                   | MEDICAL             |      5 |       4 | 25M  |            1 |     0 | Everyone       | {Medical}             | 2018-08-02   | 1.0.72             | 4.0.3 and up
 9427 | db Meter - sound level meter with data logging | GAME                |      5 |       5 | 4.6M |           10 |     0 | Everyone       | {Racing}              | 2018-08-01   | 1.11               | 4.0.3 and up
 9452 | Otto DM                                        | MEDICAL             |      5 |       4 | 2.5M |            5 |     0 | Everyone       | {Medical}             | 2018-08-03   | 1                  | 4.1 and up
 9431 | ElejaOnline DF                                 | FAMILY              |      5 |       5 | 15M  |           50 |     0 | Everyone       | {Education}           | 2017-10-06   | 2.3.3              | 4.4 and up
 8785 | Labs on Demand                                 | BUSINESS            |      5 |      14 | 3.3M |           50 |     0 | Everyone       | {Business}            | 2018-02-01   | 1                  | 4.0 and up
 9602 | FK Events                                      | MEDICAL             |      5 |       3 | 53M  |           10 |     0 | Everyone       | {Medical}             | 2018-07-13   | 0.1                | 4.1 and up
 8926 | My CW                                          | GAME                |      5 |      11 | 6.1M |           10 |     0 | Everyone       | {Arcade}              | 2017-03-11   | 0.1                | 2.3 and up
 8629 | Dr.Dice - Sic bo analyzer                      | FAMILY              |      5 |      18 | 1.3M |           50 |     0 | Everyone       | {Casual}              | 2018-02-13   | 1                  | 4.3 and up
 9021 | BTK-FH Online Campus                           | SHOPPING            |      5 |       9 | 169k |           10 |     0 | Everyone       | {Shopping}            | 2018-06-01   | 18060104           | 2.2 and up
 9552 | EU Whoiswho                                    | HEALTH_AND_FITNESS  |      5 |       4 | 15M  |           50 |     0 | Everyone       | {"Health & Fitness"}  | 2018-03-23   | 7.7.3              | 4.1 and up
 9057 | Wifi Mingle                                    | PRODUCTIVITY        |      5 |       9 | 25M  |           50 |     0 | Everyone       | {Productivity}        | 2018-02-11   | 1.7.8              | 4.0.3 and up
 9092 | Lord Fairfax EMS Council                       | GAME                |      5 |       8 | 25M  |           50 |     0 | Everyone       | {Arcade}              | 2018-06-26   | 1.1                | 4.1 and up
 9548 | E.U. Trademark Search Tool                     | GAME                |      5 |       4 | 33M  |           50 |  1.99 | Teen           | {Action}              | 2013-08-15   | 1.05               | 2.2 and up
 9112 | Popsicle Launcher for Android P 9.0 launcher   | FAMILY              |      5 |       8 | 14M  |           10 |     0 | Everyone       | {Education}           | 2018-08-01   | 1.1                | 4.2 and up
 9115 | Q Actions - Digital Assistant                  | GAME                |      5 |       8 | 38M  |           10 |  0.99 | Teen           | {Arcade}              | 2018-04-11   | 1.3                | 4.1 and up
 9132 | Border Ag & Energy                             | FAMILY              |      5 |       8 | 7.4M |           50 |     0 | Everyone       | {Education}           | 2018-08-07   | 1.0.2              | 4.1 and up
 9184 | AQ: First Contact                              | GAME                |      5 |       7 | 19M  |            5 |     0 | Everyone       | {Arcade}              | 2018-07-23   | 1                  | 4.1 and up
 9185 | AQ wisdom +                                    | FAMILY              |      5 |       7 | 5.6M |           10 |     0 | Everyone       | {Education}           | 2017-12-07   | 1                  | 4.0.3 and up
 9189 | AQ Dentals                                     | FAMILY              |      5 |       7 | 20M  |           50 |     0 | Everyone       | {Education}           | 2016-09-10   | 1.2.0              | 4.1 and up
 9215 | British Columbia Transit Info                  | FAMILY              |      5 |       7 | 73M  |           10 |  0.99 | Everyone       | {Puzzle}              | 2017-07-06   | 1.2                | 4.1 and up
 8661 | CI On The Go                                   | SPORTS              |      5 |      17 | 1.5M |           50 |     0 | Everyone       | {Sports}              | 2017-12-08   | 1                  | 4.0.3 and up
:

-- Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name FROM analytics
WHERE rating < 3 AND reviews >= 10000;

                    app_name
-------------------------------------------------
 The Wall Street Journal: Business & Market News
 Vikings: an Archer’s Journey
 Shoot Em Down Free
(3 rows)

-- Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT * FROM analytics WHERE price BETWEEN 0.10 AND 1 ORDER BY reviews DESC LIMIT 10;

  id  |                  app_name                   |    category     | rating | reviews | size | min_installs | price | content_rating |            genres             | last_updated | current_version | android_version
------+---------------------------------------------+-----------------+--------+---------+------+--------------+-------+----------------+-------------------------------+--------------+-----------------+-----------------
 1144 | Free Slideshow Maker & Video Editor         | GAME            |    4.6 |  408292 | 29M  |     10000000 |  0.99 | Mature 17+     | {Action}                      | 2018-07-12   | 1.7.110758      | 4.1 and up
 2298 | Couple - Relationship App                   | GAME            |    4.3 |   85468 | 36M  |      1000000 |  0.99 | Everyone       | {Arcade}                      | 2018-06-08   | 2.4.1.485300    | 4.0.3 and up
 2315 | Anime X Wallpaper                           | FAMILY          |    4.6 |   84114 | 23M  |       500000 |  0.99 | Everyone 10+   | {Puzzle}                      | 2018-07-05   | 1.13.108869     | 2.3.3 and up
 2603 | Dance On Mobile                             | FAMILY          |    4.6 |   61264 | 43M  |      1000000 |  0.99 | Everyone       | {Puzzle}                      | 2018-06-19   | 3.7.0           | 4.1 and up
 2645 | Marvel Unlimited                            | PERSONALIZATION |    4.3 |   58617 | 26M  |      1000000 |  0.99 | Everyone       | {Personalization}             | 2016-12-07   | 4.3.2           | 4.4 and up
 2646 | FastMeet: Chat, Dating, Love                | PERSONALIZATION |    4.3 |   58614 | 26M  |      1000000 |  0.99 | Everyone       | {Personalization}             | 2016-12-07   | 4.3.2           | 4.4 and up
 2811 | IHG®: Hotel Deals & Rewards                 | FAMILY          |    4.5 |   48754 | 9.3M |       100000 |  0.99 | Everyone       | {Arcade,"Action & Adventure"} | 2014-10-07   | 1.5.2           | 2.3 and up
 3050 | Live Weather & Daily Local Weather Forecast | GAME            |    4.4 |   38419 | 100M |      1000000 |  0.99 | Everyone 10+   | {Action}                      | 2018-08-03   | 2.3.24          | 4.1 and up
 3214 | DreamMapper                                 | GAME            |    4.4 |   32496 | 99M  |      1000000 |  0.99 | Teen           | {Action}                      | 2018-07-03   | 5.3.3           | 2.3 and up
 3227 | Můj T-Mobile Business                       | GAME            |    4.5 |   32344 | 29M  |      1000000 |  0.99 | Everyone       | {Adventure}                   | 2016-10-21   | 1.3.12          | 3.0 and up
(10 rows)

-- Find the most out of date app. 
SELECT app_name, last_updated FROM analytics ORDER BY last_updated LIMIT 1;

  app_name  | last_updated
------------+--------------
 CP Clicker | 2010-05-21
(1 row)

-- Find the most expensive app
SELECT app_name, price FROM analytics ORDER BY price DESC LIMIT 1;

      app_name      | price
--------------------+-------
 Cardi B Piano Game |   400
(1 row)

-- Count all the reviews in the Google Play Store.
SELECT COUNT(reviews) FROM analytics;
 count
-------
  9637
(1 row)

-- Find all the categories that have more than 300 apps in them.
SELECT category FROM analytics
GROUP BY category
HAVING COUNT(app_name) > 300;

    category
-----------------
 COMMUNICATION
 PHOTOGRAPHY
 GAME
 BUSINESS
 MEDICAL
 TOOLS
 LIFESTYLE
 PRODUCTIVITY
 PERSONALIZATION
 FINANCE
 SPORTS
 FAMILY
(12 rows)


-- Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.
SELECT app_name, reviews, min_installs, (min_installs/reviews) AS proportion
FROM analytics
WHERE min_installs >= 100000
ORDER BY proportion DESC
LIMIT 1;

     app_name     | reviews | min_installs | proportion
------------------+---------+--------------+------------
 Kim Bu Youtuber? |      66 |     10000000 |     151515
(1 row)