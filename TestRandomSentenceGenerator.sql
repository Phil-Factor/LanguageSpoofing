

DECLARE @jsonData nvarchar(MAX)=N'{
  "adjective":[
    "carnivalesque", "rhetorical","divided","new","neoliberal", "sustainable","socially-responsible",
    "multimedia","historical","formalist","gendered","historical","heterotopian", "collective",
    "cultural","female","transformative","intersectional","political","queer","critical","social",
    "spiritual","visual","Jungian","unwanted","Pre-raphaelite","acquired","gender","surreal",
    "the epicentre of", "midlife","emotional","coded","fleeting","ponderous","expressive",
    "self-descriptive","theoretical","multi-dimensional","dystopic","fragments of","humanistic",
    "interpretive","critical","probablistic","aphoristically constructed","disconnected",
    "subtle","ingenious","deep","shrewd","astute","sophistical"
    ],
  "doesSomethingWith":[
    "evokes","explores","describes","summarises","deliniates","traces","relates","characterises",
    "depicts","focuses on","narrates","educes","draws inspiration from", 
    "tracks the many influences on","meditates on","reflects on","examines","observes",
    "offers","scrutinises"
    ],
  "interaction":[
    "relationship","affinity","resonance","narrative ","interaction"
    ],
  "something":[
    "the body","experience","archetype","queerness","gifts","tenets","synesthesia","politics",
    "subculture","memories","oppression","space","abjection","telesthesia","transnationalism",
    "care","Ambivalence","neoliberalism","^adjective identity","transcendence","resistance",
    "performance","masochism","spectatorship","play","masculinity","aesthetics","phenomenology",
    "Blaxpoitation","plasticity","annihilation","identity","regeneration","Narrative",
    "Metaphysics","Normativity","progress","erasure","gender perception","complexity","power",
    "exceptionalism","surreality","scrutiny","inequality","auto-ethnography","opacity",
    "utopic self-invention","experience", "identity", "intellection","approach to ^noun",
    "epistemology","contexts","hermeneutics","the role of shame","the aesthetic of detachment"
   ],
  "somethings":[
    "bodies","experiences","archetypes","gifts","tenets","synesthesias","political thoughts",
    "subcultures","memories","oppressions","Spaces","Abjections","Telesthesias","Transnationalisms",
    "Ambivalences","Neoliberalisms","^adjective Identities","Transcendences","Resistances",
    "performances","Masochisms","Spectatorships","Aesthetics","Phenomenologies","Identities",
    "Regenerations","Narratives", "Normativities","Erasures","gender perceptions","complexities",
    "exceptionalisms","inequalities","utopic self-inventions","experiences", "intellections",
    "approaches to ^noun",  "epistemologies","contexts"
  ],
  "and":[
    "and its relationship to","in combination with", "in contrast to", "and its intersections with",
    "in its paradoxical relationship to","in conjunction with"],
  "stuff":[
    "particular texts","diary entries","painstaking research","diary musings","sporadic poetry",
    "personal letters","early drafts of a memoir","newspaper articles","letters to the newspapers",
    "august research"
   ],
  "note":[
    "The author ^doesSomethingWith ^something ^and ^something in ^stuff by ^writer, and ^doesSomethingWith ^personal, ^personal ^thought on topics from the mundane to the profound.",
    "This ^book ^doesSomethingWith various ^adjective ^somethings and their relation to ^source: and the influence of the ^doingSomethingTo ^noun ^doesSomethingWith the ^something ^terminator.", 
    "^something is at the intersection of ^something, ^something and ^something. it offers a new approach; not only ^doingSomethingTo the ^noun, but ^doingSomethingTo the ^noun",
    "This ^book ^doesSomethingWith the ^interaction between ^something and ^something. ^inspiredby, and by ^meditating, new ^feelings are ^made ^terminator","the ^interaction between ^something ^and ^something in this ^book is ^pretty.  ^inspiredby, new ^feelings which dominate the early chapters ^doesSomethingWith ^something ^terminator.",
    "It is ^likely that this will ^remain the most ^positive ^book on the subject, balancing as it does the ^interaction between ^something and ^something. ^inspiredby, it ^doesSomethingWith ^something ^terminator.",
    "^tracing influences from ^something, ^something and ^something, the ^book ^doesSomethingWith ^noun through time",
    "This ^book provides a ^positive, ^positive introduction to ^adjective ^something ^terminator, with a focus on ^noun., By ^meditating, new ^feelings are ^made ^terminator",
    "^doingSomethingTo ^adjective ^something is ^positive, ^positive and ^positive. This ^book ^doesSomethingWith the ^adjective and ^adjective imperatives of ^adjective ^noun.",
    "^positive, ^positive and yet ^positive, this ^book is unusual in that it is ^inspiredby. It will make you appreciate ^doingSomethingTo ^something ^terminator"
   ],
  "book":[
    "book","book","^positive book","^positive exposition","booklet","republished series of lectures",
    "dissertation","^positive compilation","^positive work","volume","^positive monograph","tract",
    "thesis","publication","expanded journal article","research paper"
  ],
  "likely":[
    "probable","likely","quite possible","debatable","inevitable","a done deal",
    "probably just a matter of time","in the balance","to be expected"
   ],
  "tracing":[
    "tracing","tracking","following","uncovering","trailing","investigatiing","exploring"
   ],
  "remain":[
    "estabilsh itself as","be accepted as","remain","be hailed as","be received by the public as",
    "be recommended as","become"
   ],
  "pretty":[
    "a source of ^positive insights","a ^positive reference","a ^positive statement",
    "demanding but ^positive"
   ],
  "positive":[
    "comprehensive","challenging","exciting","discoursive","interesting","stimulating","evocative",
    "nostalgic","heartwarming","penetrating","insightful","gripping","unusual","didactic","instructive",
    "educative","informative","edifying","enlightening","illuminating","accessible","effective","resonant",
    "vibrant"
   ],
  "meditating":[
    "^doingSomethingTo the ^something and ^something",
    "balancing the intricate issues, especially the ^adjective ^something",
    "steering clear of the obvious fallacies in their thinking about ^adjective ^something",
    "arguing that it is equal in complexity and power to ^something",
    "clearing away the misconceptions about ^something"
   ],
  "inspiredby":[
    "with a nod to both ^source and ^source",
    "It draws inspiration from influences as diverse as ^source and ^source",
    "With influences as diverse as as ^source and ^source",
    "at the intersection of ^source, ^source and ^source",
    "Drawing from sources such as ^source, ^source and ^source as inspiration",
    "Taking ideas from writers as diverse as as ^writer and ^writer"
   ],
  "source":[
   "Impressionism","Nihilism","left-bank decedence","Surrealism","Psycholinguistics",
   "Post-modermnism","Deconstructionism","Empiricism","Existentialism","the humanities",
   "Dialectical materialism","Feminist Philosophy","Deontological Ethics","Critical Realism",
   "Christian Humanism","Anarchist schools of thought","Eleatics","Latino philosophy","design",
   "the Marburg School","the Oxford Franciscan school","Platonic Epistemology","Process Philosophy",
   "Shuddhadvaita","urban planning"
  ],
 "writer":[
   "Edward Abbey","JG Ballard","Henry James","Kurt Vonnegut","Evelyn Waugh","Wyndham Lewis",
   "T E Lawrence","Timothy Leary","Hugh MacDiarmid","William Faulkner","Gabriel Garcia Marquez",
   "Henrik Ibsen","Franz Kafka","Mary Wollstonecraft","Henry David Thoreau","Levi Strauss"
   ],
  "terminator":[
    "as a means of ^adjective and ^adjective ^something","representing ^adjective claims to ^something",
    "as a site of ^something","as ^something","without a connection","as ^adjective ^something",
    "as ^adjective ^something and ^something","as ^adjective mediators","in contemporary society",
    "and the gendering of space in the gilded age","as ^adjective justice","as violence",
    "in the digital streaming age","in an ^adjective framework","in a global context",
    "in new ^adjective media","and the violence of ^something","as a form of erasure",
    "and the negotiation of ^something","signifying ^adjective relationships in ^adjective natures",
    "as a site of ^adjective contestation","in crisis","as ^adjective devices","through a ^adjective lens",
    "through a lens of spatial justice","within the ^adjective tradition of ^something."

   ],
  "title":[
    "^doingSomethingTo ^something ^terminator.","^noun ^terminator.",
    "^doingSomethingTo ^adjective ^something: The ^adjective ^noun.",
    "^doingSomethingTo ^noun",
    "^doingSomethingTo the ^adjective ^something" 
   ],
  "doingSomethingTo":[
    "understanding","intervening in", "engaging with", "interpreting",
    "speculating about", "tracing the narrative of","introducing the theory of",
    "presenting methods and practices of","offering case practices of","describing changes in",
    "reinterpreting","critiquing","reimagining","evoking","exploring","describing","summarising",
    "deliniating","tracing","relating","characterising","depicting","methodically restructuring", 
    "focusing on","narrating","educing","tracking the many influences on","meditating on",
    "situating","transforming","disempowering","a reading of","transcending",
    "activating","the politics of","representations of","interrogating","erasing","redefining",
    "identifying","performing","the legibility of","democratizing","de-centering",
    "gender and","debating","signaling","embodying","building","the role of","historicizing",
    "repositioning","destabilizing","mapping","eliminating","engaging with"
   ],
  "noun":[
    "Genre and Justice","^doingSomethingTo Uncertainty","Identity","^something and ^something of ^something",
    "Bodies and Static Worlds","^noun of ^adjective Spaces","^something as resistance,",
    "Modes of witnessing","representations of trauma","concept of freedom","multimedia experiences",
    "bodies","theory and empirical evidence","ecology of ^something","^adjective Labor Migration",
    "^something and ^something","^adjective possibilities","^adjective limitations",
    "aesthetic exchange","Immersion","abstraction","Revolutionary Sexuality","politics and power",
    "aesthetics","aepresentation","^adjective categories","pluralities","gender","gaze",
    "forms of ^something","silences","power structures","dissent","^adjective approach","self",
    "queerness","modes of being","ontology","agency","epistemologies","intertextuality",
    "Hyper-Extensionality","fields of belonging","hybridization","literary justice","visualisation",
    "Interpretation","epistemology","narrative experimentation"
   ],
  "feelings":[
    "combinations","tensions","synergies","resonances","harmonies","contradictions","paradoxes",
    "superimpositions","amalgamations","syntheses"
   ],
    "personal":["deeply personal", "emotionally wrenching","highly charged","itensely private","dark",
    "profound","heartfelt","heartwarming","spiritual","nuanced","reflective","deep","unflinching"],
    "thought":["ruminations","meditations","interpositions","insights","perceptions"],
    "made":[
      "distilled","manufactured","woven","synthesised","uncovered","determined","observed","portrayed"
   ]
}'


SELECT TOP 2000 dbo.TitleCase(dbo.SentenceFrom(@jsonData, '$.title', 5)) AS title,
  dbo.SentenceFrom(@jsonData, '$.note', 5) AS notes
  FROM sys.objects;



select dbo.SentenceFrom('{
   "malename":[
      "^prefix ^malefirstname ^lastname ^suffix",
	  "^prefix ^malefirstname ^lastname",
	  "^malefirstname ^lastname"
   ],
   "femalename":[
      "^prefix ^femalefirstname ^lastname ^suffix",
	  "^prefix ^femalefirstname ^lastname",
	  "^femalefirstname ^lastname"
   ],
   "prefix":[
      "Mr","Mrs","Miss","Sir","Dr","professor"
   ],
   "malefirstname":["Noah","Oliver","William","Elijah","James","Benjamin",
   "Lucas,","Mason","Ethan","Alexander","Henry","Jacob","Michael","Daniel",
   "Logan","Jackson","Sebastian","Jack","Aiden"
   ],
   "femalefirstname":["Olivia","Emma","Ava","Sophia","Isabella","Charlotte",
   "Amelia","Mia","Harper","Evelyn","Abigail","Emily","Ella","Elizabeth",
   "Camila","Luna","Sofia","Avery","Mila","Aria","Scarlett","Penelope",
   "Layla","Chloe","Victoria","Madison","Eleanor","Grace","Nora","Riley"
   ],
   "lastname":["Smith","Johnson","Patel","Williams","Brown","Jones","Garcia",
   "Miller","Davis","Rodriguez","Martinez","Hernandez","Lopez","Gonzalez",
   "Wilson","Anderson","Li","Thomas","Taylor","Moore","Jackson","Martin","Lee",
   "Perez","Thompson","White","Wong","Harris","Sanchez","Clark","Ramirez","Lewis",
   "Robinson","Walker","Young","Allen","King","Wright","Scott","Torres",
   "Nguyen","Hill","Flores","Green" ],
   "suffix":[
      "3rd","MA","BSc","","","","",""
   ]
}
','$.malename',5)


SELECT dbo.SentenceFrom('{
      "firstname":["Dick","Bob","Ravi","Jess","Karen",
	  "Alan","Mo","Jenny","Arthur","Masie","Alice"
      ]
    }','$.firstname',0 ) as Name;


select dbo.SentenceFrom('{
     "name":[ "^prefix ^firstname ^lastname ^suffix",
	   "^prefix ^firstname ^lastname","^firstname ^lastname"
      ],
      "prefix":["Mr","Mrs","Miss","Sir","Dr","professor"
      ],
      "firstname":["Dick","Bob","Ravi","Jess","Karen"
      ],
      "lastname":["Stevens","Payne","Boyd","Sims","Brown"
      ],
      "suffix":["3rd","MA","BSc","","","","",""
      ]
    }
    ','$.name',5) as Name
from AdventureWorks2016.person.person

DROP TABLE IF EXISTS #TableWithExistingData --in case we rerun
CREATE TABLE #TableWithExistingData (Prefix NVARCHAR(40) NOT NULL, FullName NVARCHAR(255))
INSERT INTO #TableWithExistingData (Prefix) --insert sample prefixes into our table
  VALUES ('Mr'),('Mrs'),('Ms'),('Dr'),('Dr'),('Sir'),('Lady'),('Mr'),
	('Miss'),('Professor'),('Captain'),('Bishop'),('Mr'),('Mrs'),('Ms')
--now we create a variable for our JSON

DECLARE @JSONNameData NVARCHAR(MAX)='{
  "malename":[
      "^malefirstname ^lastname ^suffix",
	  "^malefirstname ^lastname",
	  "^malefirstname ^lastname"
   ],
  "femalename":[
      "^femalefirstname ^lastname ^suffix",
	  "^femalefirstname ^lastname",
	  "^femalefirstname ^lastname"
   ],
  "name":["^malename","^femalename"],
  "malefirstname":["Noah","Oliver","William","Elijah","James","Benjamin",
   "Lucas,","Mason","Ethan","Alexander","Henry","Jacob","Michael","Daniel",
   "Logan","Jackson","Sebastian","Jack","Aiden"
   ],
  "femalefirstname":["Olivia","Emma","Ava","Sophia","Isabella","Charlotte",
   "Amelia","Mia","Harper","Evelyn","Abigail","Emily","Ella","Elizabeth",
   "Camila","Luna","Sofia","Avery","Mila","Aria","Scarlett","Penelope",
   "Layla","Chloe","Victoria","Madison","Eleanor","Grace","Nora","Riley"
   ],
  "lastname":["Smith","Johnson","Patel","Williams","Brown","Jones","Garcia",
   "Miller","Davis","Rodriguez","Martinez","Hernandez","Lopez","Gonzalez",
   "Wilson","Anderson","Li","Thomas","Taylor","Moore","Jackson","Martin","Lee",
   "Perez","Thompson","White","Wong","Harris","Sanchez","Clark","Ramirez","Lewis",
   "Robinson","Walker","Young","Allen","King","Wright","Scott","Torres",
   "Nguyen","Hill","Flores","Green" ],
   "suffix":[
      "3rd","MA","BSc","","","","",""
   ]
}'
/* now we can add the fullnames with random gender-appropriate names */
UPDATE #TableWithExistingData 
SET FullName= dbo.SentenceFrom (@JSONNameData,'$.'
  +CASE WHEN Prefix IN ('Ms','Mrs','Lady','Miss')
          THEN 'femalename' 
	    WHEN Prefix IN ('Mr','Sir') 
		  THEN 'malename' 
		ELSE 'name' END,5)
  FROM #TableWithExistingData  



DECLARE @JSONBarName NVARCHAR(MAX)='{
  "club":["The Red Lion","The Royal Oak","Red Lion","Royal Oak","The Crown Inn",
"The White Hart","The Crown","The Plough Inn","The New Inn","New Inn",
"Crown Inn","The Ship Inn","The Wheatsheaf","The White Horse","Kings Arms",
"ROYAL BRITISH LEGION","The Swan","The Plough","The Bell Inn", 
"The *** Golf Club","*** Bowling Club","The Royal *** Cricket Club","*** Conservative Club","*** RUGBY CLUB",
"The *** Rugby Football Club","The *** Town Football Club","*** Masonic Hall","The *** Football Club",
"North-East *** Social Club","The *** Bowls Club","*** Sailing Club ","The *** Sports Club","West *** Working Mens Club",
"*** Masonic Club","*** Arms","*** Club","*** Constitutional Club","North *** Yacht Club","*** Snooker Club",
"*** Town Cricket Club","East *** Lawn Tennis Club","*** Inn","The *** Rugby Union Football Club",
"*** Sports & Social Club","West Ward *** Labour Club","The *** Snooker Centre","*** United Football Club",
"*** Conservative Club Ltd"]
 }'

Select replace (dbo.SentenceFrom (@JSONBarName,'$.club',1),'***',town) as [Best Bar],
   town from (values
('Bristol'),('Hartlepool'),('Harlow'),('Cardiff'),('Hawick'),('Rugby'),('Billingham'),('Eastbourne
'),('Boston'),('Enfield'),('Herne Bay'),('Hereford'),('Coventry'),('Gateshead'),('Bedford'),('Wigan
'),('Brighton'),('Harrogate'),('Exeter'),('Scarborough'),('Southport'),('Lincoln'),('York'),('Darlington
'),('Leeds'),('Cheltenham'),('Ayr'),('Whitby'),('Durham')
)f(town)



declare @Ranking nvarchar(max)='{"number":[],
  "sentence":[" a ^sincere ^number","^number, which was ^sincere",
              "^number, which was ^sincere"],
  "sincere": ["carefully judged","much debated",
              "fairly discussed","well-considered","carefully chosen"]}'

Select  'The '+[language]+' vote for this song is '+
		dbo.SentenceFrom (json_modify(@ranking, 'strict  $.number', 
          json_query('["'+one+'","'+two+'","'+three+'","'+four+'","'+five+'"]')), 
		'$.sentence', 1) as decision
from (values
	('English','one','two','three','four','five'),
	('Spanish','uno','dos','tres','cuatro','cinco'),
	('French','un','deux','trois','quatre','cinq'),
	('German','eins','zwei','drei','vier','fünf'),
	('Roman','unus','duo','tres','quattuor','quinque')
)OneToFive([Language],one,two,three,four,five)



