# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Fawkes.Repo.insert!(%Fawkes.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

slots = %{
  slot_1: %{
    date: "Thursday, September 6, 2018",
    time: "7:00 AM - 8:30 AM"
  },
  slot_2: %{
    date: "Thursday, September 6, 2018",
    time: "8:30 AM - 8:45 AM"
  },
  slot_3: %{
    date: "Thursday, September 6, 2018",
    time: "8:45 AM - 9:45 AM"
  },
  slot_4: %{
    date: "Thursday, September 6, 2018",
    time: "9:45 AM - 10:15 AM"
  },
  slot_5: %{
    date: "Thursday, September 6, 2018",
    time: "10:15 AM - 10:55 AM"
  },
  slot_6: %{
    date: "Thursday, September 6, 2018",
    time: "11:00 AM - 11:40 AM"
  },
  slot_7: %{
    date: "Thursday, September 6, 2018",
    time: "11:40 AM - 1:00 PM"
  },
  slot_8: %{
    date: "Thursday, September 6, 2018",
    time: "1:00 PM - 1:40 PM"
  },
  slot_9: %{
    date: "Thursday, September 6, 2018",
    time: "1:45 PM - 2:25 PM"
  },
  slot_a: %{
    date: "Thursday, September 6, 2018",
    time: "2:25 PM - 3:00 PM"
  },
  slot_b: %{
    date: "Thursday, September 6, 2018",
    time: "3:00 PM - 3:40 PM"
  },
  slot_c: %{
    date: "Thursday, September 6, 2018",
    time: "3:45 PM - 4:25 PM"
  },
  slot_d: %{
    date: "Thursday, September 6, 2018",
    time: "4:25 PM - 4:45 PM"
  },
  slot_e: %{
    date: "Thursday, September 6, 2018",
    time: "4:45 PM - 6:15 PM"
  },

  slot_e: %{
    date: "Thursday, September 7, 2018",
    time: "8:00 AM - 8:50 AM"
  },
  slot_f: %{
    date: "Thursday, September 7, 2018",
    time: "8:50 AM - 9:05 AM"
  },
  slot_g: %{
    date: "Thursday, September 7, 2018",
    time: "9:05 AM - 10:05 AM"
  },
  slot_h: %{
    date: "Thursday, September 7, 2018",
    time: "10:05 AM - 10:35 AM"
  },
  slot_i: %{
    date: "Thursday, September 7, 2018",
    time: "10:35 AM - 11:15 AM"
  },
  slot_j: %{
    date: "Thursday, September 7, 2018",
    time: "11:20 AM - 12:00 PM"
  },
  slot_k: %{
    date: "Thursday, September 7, 2018",
    time: "12:00 PM - 1:30 PM"
  },
  slot_l: %{
    date: "Thursday, September 7, 2018",
    time: "1:30 PM - 2:10 PM"
  },
  slot_m: %{
    date: "Thursday, September 7, 2018",
    time: "2:15 PM - 2:55 PM"
  },
  slot_n: %{
    date: "Thursday, September 7, 2018",
    time: "2:55 PM - 3:30 PM"
  },
  slot_o: %{
    date: "Thursday, September 7, 2018",
    time: "3:30 PM - 4:10 PM"
  },
  slot_p: %{
    date: "Thursday, September 7, 2018",
    time: "4:15 PM - 4:55 PM"
  },
  slot_q: %{
    date: "Thursday, September 7, 2018",
    time: "4:55 PM - 5:15 PM"
  },
  slot_r: %{
    date: "Thursday, September 7, 2018",
    time: "5:15 PM - 5:30 PM"
  },
  slot_s: %{
    date: "Thursday, September 7, 2018",
    time: "5:30 PM - 6:30 PM"
  }
}


authors = %{
  jose_valim: %{
    image: "jose-valim.jpg",
    first: "José",
    last: "Valim",
    company: "Plataformatec",
    github: "josevalim",
    twitter: "josevalim",
    description: "@plataformatec co-founder and creator of @elixirlang."
  },
  lance_halvorsen: %{
    image: "lance-halvorsen.jpg",
    first: "Lance",
    last: "Halvorsen",
    company: "LeTote",
    github: "lancehalvorsen",
    twitter: "lance_halvorsen",
    description: "Lance is a member of the Phoenix core team and author of Functional Web Development with Elixir, OTP, and Phoenix. He is currently a Senior Software Architect at LeTote living in Portland, OR."
  },
  anna_neyzberg: %{
    image: "anna-neyzberg.jpg",
    first: "Anna ",
    last: "Neyzberg",
    company: "Carbon Five",
    github: "aneyzberg",
    twitter: "aneyzb",
    description: "Anna Neyzberg is a San Francisco native who has done a lot of work in the ruby community in SF and currently sits on the board of RailsBridge. She has taken this community organizing experience and 2 years ago co-founded ElixirBridge in SF- an organization that offers free weekend long workshops, with the goal of creating an inclusive welcoming space for under-represented populations in tech to learn elixir. By day she works as a Developer at Carbon Five. When not in front of a keyboard, she is trying to get better at climbing rocks."
  },
  luke_imhoff: %{
    image: "luke-imhoff.jpg",
    first: "Luke",
    last: "Imhoff",
    company: "DockYard",
    github: "KronicDeth",
    twitter: "KronicDeth",
    description: "Luke Imhoff has been writing Elixir since June 2014 and started writing IntelliJ Elixir in July 2014 after he couldn't find pre-existing support for Elixir for JetBrains IDEs he loved like Rubymine. While developing the plugin, he's found bugs in the native Elixir lexer and parser and the OTP debugger. He has 3 hex packages for JSONAPI: Alembic (validate format of JSONAPI), Calcinator (transport neutral JSONAPI, so you can use them for APIs and RPCs), and Retort (JSONAPI over JSONRPC over RabbitMQ for RPC). He hosts the Austin Elixir meetup on the 3rd Monday of each month."
  },
  bailey_miller: %{
    image: "bailey-miller",
    first: "Bailey",
    last: "Miller",
    company: "Gaslight",
    github: "baileycmiller",
    description: "This session is co-presented by Bailey Miller and Tim Mecklem. Bailey creates amazing things as a designer at Gaslight (teamgaslight.com) and has written about her experience working with Phoenix from a front end developer perspective. Tim is a developer at Gaslight, where he builds exciting software and helps people build themselves. They have presented separately at conferences like Adobe Jam and ElixirConf, and this is their first time teaming up to show how design and development complement each other."
  },
  fahad_almusharraf: %{
    image: "fahad-almusharraf.jpg",
    first: "Fahad",
    last: "Almusharraf",
    company: "Student",
    github: "falmusha",
    twitter: "ifahad7",
    description: "I'm a Computer Engineer and graduate student currently researching ways to automate behavioral change in smoking cessation through the use of artificially intelligent conversational systems."
  },
  manu_ajith: %{
    image: "manu-ajith.jpg",
    first: "Manu",
    last: "Ajith",
    company: "9Piecesof8 Software Labs",
    github: "manusajith",
    twitter: "manusajith",
    description: "Manu is a tech entrepreneur and software engineer with a passion for building scalable web systems. He is a polyglot developer who primarily uses Ruby, Elixir, and Go at work, but also keeps a keen eye on other functional paradigms like Haskell. These days, he is into building systems using Domain Driven Design, CQRS, and Event Sourcing. Manu is also a travel enthusiast, an aspiring nomad, who has roamed 26 countries so far and plans to visit the rest soon."
  },
  aaron_renner: %{
    image: "aaron-renner.jpg",
    first: "Aaron",
    last: "Renner",
    company: "ActiveProspect",
    github: "aaronrenner",
    twitter: "bayfieldcoder",
    description: "Aaron has been developing software professionally for 10+ years and has been writing Elixir full time since 2016. He has been the technical co-founder for multiple startups and can only imagine the money he would have saved on servers if he had found Elixir sooner. Aaron enjoys clean code, refactoring and studying application design. When he’s not in front of the computer, Aaron enjoys cycling, camping and family road trips."
  },
  justus_eapen: %{
    image: "justus-eapen.jpg",
    first: "Justus",
    last: "Eapen",
    company: "SmartLogic",
    github: "Github: justuseapen",
    twitter: "Twitter: @justuseapen",
    description: "Justus is an Elixir Developer and AI Enthusiast from Baltimore. He's best known for his work on the Pavlok shocking wristband and designing single-page calendars. Accepting rap cypher invitations."
  },
  aish_dahal: %{
    image: "aish-dahal.jpg",
    first: "Aish",
    last: "Dahal",
    company: "PagerDuty",
    github: "aishraj",
    twitter: "aishrajdahal",
    description: "Aish works as an Engineer at PagerDuty in San Francisco. He current works in building PagerDuty’s event intelligence platform often dealing with fallacies of distributed computing. His recent focus has been on Elixir/OTP and building event driven microservices using Kafka and Elixir. In the past he has worked as an early stage employee at HackerRank as well as a programmer at Goldman Sachs."
  },
  catherine_zoller: %{
    image: "catherine-zoller.jpg",
    first: "Catherine",
    last: "Zoller",
    company: "Mojotech",
    github: "cathyzoller",
    twitter: "mojo_cathy",
    description: "Catherine Zoller is a software engineer in Boulder at Mojotech. Lately she spends her days working with React and Elixir. On summer weekends you’ll find her in the garden building a habitat for birds, bees & butterflies. When the snow flies (winter is coming) she spins yarn, knits socks, and programs in Elixir."
  },
  david_schainker: %{
    image: "david-schainker.jpg",
    first: "David",
    last: "Schainker",
    github: "schainker",
    twitter: "schainks",
    description: "David is a software developer who has spent the past five years focusing on building pragmatically in the IoT, \"Gig Economy\", and Education industries. After building his first Phoenix project in 2016, he has been hooked on bringing more functional programming into his production environments and tending to his herb garden when he's not out hiking."
  },
  maciej_kaszubowski: %{
    image: "maciej-kaszubowski.jpg",
    first: "Maciej",
    last: "Kaszubowski",
    company: "AppUnite",
    github: "mkaszubowski",
    twitter: "mkaszubowski94",
    description: "Maciej is a developer at AppUnite where he's been using Elixir for about two years now. Interested in software architecture, distributed systems, data synchronisation and consistency guarantees. Currently writing his Master’s Thesis on CRDTs. A frequent speaker and co-organiser of Poznań Elixir Meetup. Started to love speaking even more after giving a talk at ElixirConfEU 2018."
  },
  aaron_votre: %{
    image: "aaron-votre.jpg",
    first: "Aaron",
    last: "Votre",
    company: "Corvus Insurance",
    github: "shamshirz",
    twitter: "ShamshirzDev",
    description: "Aaron is an adventurer of all things software. He came to Elixir from a Java and Node background to fall in love with the community and the functional coding style. Currently working for Corvus Insurance, Aaron writes primarily in Elm and Elixir while experimenting with game development in his spare time. Often found in his natural habitat of soccer fields located near coffee shops."
  },
  frank_kumro: %{
    image: "frank-kumro.jpg",
    first: "Frank",
    last: "Kumro",
    github: "fkumro",
    twitter: "frigidcode",
    description: "Frank Kumro is a software engineer from Buffalo, NY. He loves working with Elixir/Nerves, playing with his kids, and working on his car. Enjoys long walks on the beach, pina coladas and getting caught in the rain."
  },
  ben_marx: %{
    image: "ben-marx.jpg",
    first: "Ben",
    last: "Marx",
    company: "Bleacher Report",
    github: "bgmarx",
    twitter: "bgmarx",
    description: "Ben is the software architect at Bleacher Report, co-author of Adopting Elixir and co-organizer of the Erlang Elixir meet up in San Francisco. In his free time, he's also programming in Rust, playing guitar, and building guitar pedals."
  },
  anil_wadghule: %{
    image: "anil-wadghule.jpg",
    first: "Anil",
    last: "Wadghule",
    company: "Skatter",
    github: "anildigital",
    twitter: "anildigital",
    description: "Anil was a long time Ruby developer, then turned Polyglot developer to do Node.js, Java, and Scala. For last 1.5 years, he is writing an Elixir Phoenix web application to build a team collaboration product. This product involves WebRTC and chat taking full benefit of BEAM's way of concurrency and OTP abstractions. Anil loves to listen to world music. He is an avid reader. Anil is interested in solving problems with better software architectures and learning distributed systems."
  },
  todd_resudek: %{
    image: "todd-resudek.jpg",
    first: "Todd",
    last: "Resudek",
    company: "Weedmaps",
    github: "supersimple",
    twitter: "sprsmpl",
    description: "I am a reformed graphic designer that got my start in web development 15 years ago. I have made a career in front-end development, PHP, Rails, and for the last year or so, in Elixir. I am a contributor to hex and hex.pm and in my spare time I tinker with hardware projects."
  },
  mathew_gardner: %{
    image: "mathew-gardner.jpg",
    first: "Mathew",
    last: "Gardner",
    company: "Toyota Connected",
    github: "mathewdgardner",
    description: "Mathew is a software engineer at Toyota Connected where he helps to power mobility. He graduated with a computer science degree from the University of North Texas and enjoys all things tech. He's always learning new technologies to hone his craft, and lately, it's been all about machine learning."
  },
  justin_schneck: %{
    image: "justin-schneck.jpg",
    first: "Justin",
    last: "Schneck",
    github: "mobileoverlord",
    twitter: "mobileoverlord",
    description: "I’m in a constant state of wanting to make the world around me bend to my imagination. At one time I wondered how hard it would be to start my motorcycle from my phone. Rewiring the motorcycle and writing an interface was easy, but connecting it all together proved to be a challenge. A challenge that would define my career. That invisible, often impenetrable layer in the air between all the hardware in the world has become my stomping ground. Hardware is hard, so I’ve been working on nerves to make it easy."
  },
  renan_ranelli: %{
    image: "renan-ranelli.jpg",
    first: "Renan",
    last: "Ranelli",
    company: "Telnyx LLC",
    github: "rranelli",
    twitter: "renanranelli",
    description: "I'm a Brazilian software developer focused on backend, operations and databases, working with Elixir since 2015. I worked in companies both very large and very small. I'm also a frequent speaker in technology events in Brazil, and have spoken numerous times about elixir, both locally and abroad. Currently, I work remotely for Telnyx LLC, a Chicago based company whose mission is to democratize global comunications. When I'm not talking about software, I like to cook, make cocktails and dance."
  },
  james_smith: %{
    image: "james-smith.jpg",
    first: "James",
    last: "Smith",
    company: "Gaslight",
    github: "st23am",
    twitter: "st23am",
    description: "Event Sourcing is a way of ensuring all changes to an application's state are stored as a sequence of events. Those events can be queried, logged and used to reconstruct past states. In this talk I'll cover the benefits and challenges with Event Sourcing and the solutions we came up with."
  },
  michael_stalker: %{
    image: "michael-stalker.jpg",
    first: "Michael",
    last: "Stalker",
    company: "RentPath",
    github: "michaelstalker",
    description: "Michael is a senior software engineer at RentPath, currently working with Elixir. He got into programming by dabbling in BASIC and writing games for his TI-82 calculator. Michael entered the world of web development in 2007. A few years afterward, he discovered the joy of testing and TDD."
  },
  jeff_schomay: %{
    image: "jeff-schomay.jpg",
    first: "Jeff",
    last: "Schomay",
    company: "Adobe (Seattle)",
    github: "jschomay",
    twitter: "jschomay",
    description: "I am a polyglot and functional programing enthusiast, with a background in screenwriting, and a hobby of making web games. I have lived and worked in Denver, LA, Bristol (UK), and Seattle."
  },
  zach_porter: %{
    image: "zach-porter.jpg",
    first: "Zach",
    last: "Porter",
    company: "Viget",
    github: "zporter",
    description: "For the past decade, Zach has been helping several companies solve problems with software written in a variety of languages and frameworks. Zach is currently a Senior Developer at Viget where he provides custom software solutions for a mix of companies including Dick's Sporting Goods, the Wildlife Conservation Society, and the Privia Health Group."
  },
  andrew_bennett: %{
    image: "andrew-bennett.jpg",
    first: "Andrew",
    last: "Bennett",
    company: "Toyota Connected",
    github: "potatosalad",
    twitter: "potatosaladx",
    description: "Andrew Bennett is a polyglot programming enthusiast who enjoys using Erlang and Elixir to build distributed systems at Toyota Connected. He enjoys systems performance challenges, security and cryptography research, cooking, and robotics. Away from the computer, he loves spending time with his wonderful wife and their two little girls."
  },
  eric_oestrich: %{
    image: "eric-oestrich.jpg",
    first: "Eric",
    last: "Oestrich",
    company: "SmartLogic, LLC",
    github: "oestrich",
    twitter: "ericoestrich",
    description: "Eric Oestrich works at SmartLogic building applications with Elixir. In his spare time he works on ExVenture, a multiplayer text based game server. He also helps run the REST Fest Midwest unconference."
  },
  daniel_azuma: %{
    image: "daniel-azuma.jpg",
    first: "Daniel",
    last: "Azuma",
    company: "Google",
    github: "dazuma",
    twitter: "danielazuma",
    description: "Daniel Azuma is a senior engineer at Google Cloud Platform, where he leads the Ruby and Elixir teams, building libraries and tools for users of his favorite languages. He lives with his wife in the Seattle area, and loves playing the piano, skiing, and having deep conversations with cats."
  },
  rafal_studnicki: %{
    image: "rafal-studnicki.jpg",
    first: "Rafal",
    last: "Studnicki",
    github: "studzien",
    description: "Rafal and Simon have spent the last few years building and running distributed BEAM systems in production, in various professional roles."
  },
  emerson_macedo: %{
    image: "emerson-macedo.jpg",
    first: "Emerson",
    last: "Macedo",
    company: "OLX Brazil",
    github: "emerleite",
    twitter: "emerleite",
    description: "Software Engineer professionally for the last 20 years."
  },
  jerel_unruh: %{
    image: "jerel-unruh.jpg",
    first: "Jerel",
    last: "Unruh",
    company: "Toyota Connected",
    github: "jerel",
    twitter: "jerelunruh",
    description: "Jerel worked for a number of years as an independent contractor building software in the public safety, medical research, and agriculture spaces. He now uses his Elixir skills at Toyota Connected building software for car sharing around the world."
  },
  boyd_multerer: %{
    image: "boyd-multerer.jpg",
    first: "Boyd",
    last: "Multerer",
    company: "Kry10 Industries",
    github: "boydm",
    twitter: "boydmulterer",
    description: "After many years at Microsoft, where he founded Xbox Live, XNA and ran engineering for the Xbox One console, Boyd dived into the Elixir/Erlang community and is now focused on next-generation apps across both single-purpose and general devices."
  },
  joao_britto: %{
    image: "joao-britto.jpg",
    first: "João",
    last: "Britto",
    company: "Plataformatec",
    github: "britto",
    twitter: "noteu",
    description: "With about 10 years of experience in the software industry –7 of which as a consultant at Plataformatec– I have worked with a diverse and rich ecosystem of applications: from e-commerces to news portals and mobile APIs, from monoliths to microservices and enterprise integrations. During this long journey I've had the opportunity to learn a lot about evolving and maintaining applications to last."
  },
  jeffrey_gillis: %{
    image: "jeffrey-gillis.jpg",
    first: "Jeffrey",
    last: "Gillis",
    company: "Optoro, Inc.",
    description: "Jeffrey Gillis is an Infrastructure Engineer at Optoro, Inc. He loves to learn new technologies and programming languages to solve difficult problems. He spends his free time with his wife and three children playing outdoors in their home state of West Virginia."
  },
  dan_mcguire: %{
    image: "dan-mcguire.jpg",
    first: "Dan",
    last: "McGuire",
    company: "Rentpath",
    github: "dgmcguire",
    twitter: "dgmcguire",
    description: "Dan McGuire has been a software developer for around 5 years. He's most interested in how different tools can be used to solve people problems. Hailing from Nashville, TN he writes elixir remotely for Rentpath and loves watching instructional youtube videos before confidently breaking everything around him."
  },
  alex_garibay: %{
    image: "alex-garibay.jpg",
    first: "Alex",
    last: "Garibay",
    company: "DockYard",
    github: "alexgaribay",
    twitter: "_alexgaribay",
    description: "Alex Garibay is an Elixir developer at DockYard where he helps others develop exciting applications as well as spread Elixir knowledge. In his free time, he enjoys developing his own applications, spending time with his family, and eating Kansas City barbecue."
  },
  guilherme_de_maio: %{
    image: "guilherme-de-maio.jpg",
    first: "Guilherme",
    last: "de Maio",
    company: "Telnyx",
    github: "nirev",
    twitter: "nirev",
    description: "I’m a software engineer with 10 years of experience, focused on web applications, from ops to backend. Currently working at Telnyx, a Chicago based telecom company with the mission of democratizing universal communications. I’ve been in love with Elixir since I started working with the language in 2015, being an active member of Elixir Meetups in São Paulo, Brazil and spreading Elixir love all around :) I also love science fiction books, movies and tv series."
  },
  enio_lopes: %{
    image: "enio-lopes.jpg",
    first: "Enio",
    last: "Lopes",
    company: "uSwitch",
    github: "eniolopes",
    twitter: "eniolps",
    description: "I love coding, distributed systems and all the different challenges that come with them. I'm a Brazilian living in London trying to work and learn from the best."
  },
  chris_mccord: %{
    image: "chris-mccord.jpg",
    first: "Chris",
    last: "McCord",
    github: "chrismccord",
    twitter: "chris_mccord",
    description: "Chris McCord is a programmer with a passion for science and building things. He spends his time crafting the Phoenix Framework, working with the fine folks at DockYard, writing books like Metaprogramming Elixir, and teaching others the tools of the trade."
  }
}

locations = %{
  grand_ballroom: "Grand Ballroom",
  evergreen_ab: "Evergreen AB",
  evergreen_e: "Evergreen E"
}

categories = %{
  blockchain: "Blockchain",
  bots: "Bots",
  code_quality: "Code Quality",
  deployment: "Deployment",
  distributed_systems: "Distributed Systems",
  elixir: "Elixir",
  genstage: "GenStage",
  hex: "Hex",
  keynote: "Keynote",
  nerves: "Nerves",
  nif: "NIF",
  phoenix: "Phoenix",
  phoenix_production: "Phoenix / Production",
  production: "Production",
  testing: "Testing",
  ui: "UI",
  otp: "OTP",
  monitoring: "Monitoring",
}

audiences = %{
  intermediate: "Intermediate",
  beginner: "Beginner",
  general: "General",
  advanced: "Advanced"
}

talks = [
  %{
    title: "Keynote",
    slot: :slot_3,
    author: :jose_valim,
    category: :keynote,
    audience: :general,
    location: :grand_ballroom,
    description: ""
  },
  %{
    title: "Elixir at a Walking Pace",
    slot: :slot_5,
    author: :lance_halvorsen,
    category: :phoenix_production,
    audience: :intermediate,
    location: :grand_ballroom,
    description: "<p>Many of us are initially attracted to Elixir because of its performance and fault tolerance. Make no mistake, these are stellar, but there are times when they are not the most critical requirements for our applications.</p>\n
  <p>We’re going to take a look at a warehouse management system, originally written as part of a Rails monolith, for which data consistency and message ordering matter more.</p>\n
  <p>That original system was deployed with Puma, forking multiple OS level processes on multiple nodes to gain parallel execution. That greatly increased the potential for multiple representations of an item in the system at any given moment. The result was an increase in stale data errors and inconsistent state.</p>\n
  <p>As we rebuilt the system in Elixir, we turned these problems inside out. Stateful BEAM processes and their mailboxes allowed us to ensure that there would only be a single representation of each item in the system as well as order the messages each process receives. Throughout this talk, we’ll see how we accomplished this. We’ll also see how we handled some issues associated with this approach, like the cold start problem and keeping memory usage in check.</p>\n"
  },
  %{
    title: "Exchange of Crypto Coins",
    slot: :slot_5,
    author: :anna_neyzberg,
    category: :blockchain,
    audience: :beginner,
    location: :evergreen_ab,
    description: "<p>We know that OTP is an important part of the elixir ecosystem. But why is it important and how does it work? How do we leverage OTP appropriately to build highly concurrent systems at scale. We will walk through the why and the how by building a crypto-currency exchange, and then adding load to the exchange to see OTP at work.</p>\n
<p>This talk will also provide context about crypto-currency and how the protocol is implemented - so that the audience has appropriate context for understanding building an exchange.</p>\n"
  },
  %{
    title: "You Can Never Debug the Code You Run, But You Can View the Code the Debugger is Running",
    slot: :slot_5,
    author: :luke_imhoff,
    category: :elixir,
    audience: :advanced,
    location: :evergreen_e,
    description: "<p>Elixir supports various ways to debug code: printing with `IO.inspect`, prying with `IEx.pry`, or using more advanced OTP tools like `:debugger` and `:int`. Choosing when to use these different tools can be confusing, and understanding how they work can prove downright intimidating.</p>\n
<p>Throughout this talk we'll peel back the covers on the more advanced debugging techniques and dissect exactly how each debugging tool can be used to examine our compiled code. None of debugging techniques leave your code the same as how it was running in production. Adding `IO` and `IEx.pry` calls obviously changes the code as you edit the source, but using the OTP debugger, either with `:debugger`, IntelliJ Elixir, or Elixir Language Server, or by adding new `break` points from the `IEx.pry` shell changes the module code being run.</p>\n
<p>Luke Imhoff will show how each type of debugging changes the code by revealing how `IEx.pry` and `:debugger` are implemented. You'll see why sometimes the debuggers can't reproduce bugs because the modifications to make the code debuggable also subtly changes the execution of the code by looking at changes to the bytecode and AST. Although the modified code never exists as source, we can recover the Abstract Syntax Tree (AST) of either the Elixir quoted form or the Erlang Abstract Code from the Dbgi chunk, but the Dbgi chunk ASTs aren't terribly easy to read, so we can use tools to decompile the code and translate it to Elixir or Erlang modules.</p>\n
<p>When looking at Dgbi code isn't enough, we can drop down to the Code chunk and look at the bytecode. The bytecode is a unique binary format, so once again we reach for for tools to render it, so instead of having to read machine code, we can read assembly. Looking at this bytecode also allows us to check if our high-level optimizations, such as module attribute reuse, compute variables once, and the order of pattern matching, have an impact on the code run by the VM, as unlike Dbgi, the Code chunk is actually loaded by the VM when running code without debugging.</p>\n"
  },
  %{
    title: "UX Design Practices for Real Time Apps",
    slot: :slot_6,
    author: :bailey_miller,
    category: :phoenix,
    audience: :general,
    location: :grand_ballroom,
    description: "<p>Elixir and Phoenix have unlocked a new world of responsiveness in our applications. Gone are the days of mashing the refresh button to see updates to data that frequently changes. You can send near real-time updates to every user on your site about every change that happens, but should you?</p>\n
<p>We’ll share some of the design questions we’ve learned to consider when deciding how and when to notify users of changes. When the session ends, you’ll have some design tools from real-world examples to ensure your users aren’t drinking from a firehose of updates or making decisions from stale data.</p>\n"
  },
  %{
    title: "Beyond Command and Response Chatbot",
    slot: :slot_6,
    author: :fahad_almusharraf,
    category: :bots,
    audience: :general,
    location: :evergreen_ab,
    description: "<p>Elixir and Phoenix have unlocked a new world of responsiveness in our applications. Gone are the days of mashing the refresh button to see updates to data that frequently changes. You can send near real-time updates to every user on your site about every change that happens, but should you?</p>\n
<p>We’ll share some of the design questions we’ve learned to consider when deciding how and when to notify users of changes. When the session ends, you’ll have some design tools from real-world examples to ensure your users aren’t drinking from a firehose of updates or making decisions from stale data.</p>\n"
  },
  %{
    title: "Building a Distributed, Parallel ETL Pipeline Using GenStage, Flow, Mnesia",
    slot: :slot_6,
    author: :manu_ajith,
    category: :genstage,
    audience: :beginner,
    location: :evergreen_e,
    description: "<p>The will be about a tale of building a data segregation system built using GenStage, Flow, and Mnesia.</p>\n
<p>We will explore how we used GenStage for various pipelines to feed the data into the system, and ran some computation on it in parallel using Elixir Flow, and how we leveraged Mnesia's fast and distributed nodes and clustering capabilities to make the data available for each step in the flow, and finally writing the segregated result back to a PostgreSQL database.</p>\n
<p>We will also cover some of the mistakes made, lessons learned while working with Mnesia, and how we recovered from Mnesia crashes and other pitfalls.</p>\n"
  },
  %{
    title: "Growing Applications and Taming Complexity",
    slot: :slot_8,
    author: :aaron_renner,
    category: :phoenix,
    audience: :beginner,
    location: :grand_ballroom,
    description: "<p>Growing an application is hard. We started our app with the best of intentions and promised ourselves we were going to \"design it right\". However as the app grew, complexity increased, dependencies piled up, and changes that were once small now felt like slogging through mud.</p>\n
<p>Driven by the need to keep our sanity, we decided to apply ideas from Phoenix’s contexts and Domain Driven Design with the hope that we could put boundaries around the complex parts of our system and keep the code from turning into a tangled rat’s nest. This talk covers many of the lessons we learned along the way, including:</p>\n
<ul>
  <li>How to start tackling complexity by teasing apart the app into multiple layers.</li>
  <li>How to simplify testing and reduce mental burden by defining contracts between these layers.</li>
  <li>How to verify contracts using tools like dialyzer, automated tests and mocks.</li>
  <li>How to document these contracts and use them to guide the application design.</li>
</ul>
<p>After applying these ideas to our codebase for almost a year, we’re eager to share our experiences and provide strategies you can use to tame complexity in your own applications.</p>\n"
  },
  %{
    title: "Meet Virtuoso: The Chatbot Orchestration Framework Built with Elixir",
    slot: :slot_8,
    author: :justus_eapen,
    category: :bots,
    audience: :intermediate,
    location: :evergreen_ab,
    description: "<p>Chatbots have gotten a lot of hype over the last few years. Now that the hype is dying down, it’s clear that there is a long way to go before chatbots are ubiquitous tools for interacting with our favorite services.</p>\n
<p>There are many tools to help you develop a bot, but when SmartLogic wanted to develop \"The Incredible Baltimore Bill Bot\", we couldn’t find anything in the Elixir ecosystem that suited our needs.</p>\n
<p>So we decided to roll our own.</p>\n
<p>In the process, we learned that a chatbot architecture based on our own cognitive processes was easier to develop for and more efficient in its use of resources.</p>\n
<p>Out of this attempt, I’ve developed a platform-agnostic framework for developing chatbots using Elixir and Phoenix. The architecture is loosely inspired by modern cognitive psychology and easy to grasp at a glance.</p>\n
<p>The result of this is a framework called Virtuoso (WIP) which I will describe in this talk. If you follow along you should have a working FB Messenger bot in about 30 minutes.</p>\n"
  },
  %{
    title: "Simple is Beautiful: Building an SLA Monitoring Tool Using Elixir/OTP at PagerDuty",
    slot: :slot_8,
    author: :aish_dahal,
    category: :production,
    audience: :intermediate,
    location: :evergreen_e,
    description: "<p>Starting in 2016, PagerDuty started replacing a lot of its in-house custom monitoring tools and SLA calculators with off the shelf software. However, for one critical piece of monitoring that involved detailed business logic, could not be replaced with anything off the shelf. As a result, PagerDuty built its own highly available Elixir powered monitoring tool that used Kafka not only as a communication layer but also as a storage layer.</p>\n
<p>This talk is a story of how PagerDuty replaced a complex in-house monitoring tool with a rather simpler and more reliable/scalable one all by using Elixir/OTP.</p>\n"
  },
  %{
    title: "Ticket to Fly: Porting an Application from Rails to Phoenix",
    slot: :slot_9,
    author: :catherine_zoller,
    category: :phoenix,
    audience: :beginner,
    location: :grand_ballroom,
    description: "<p>While porting a project from Ruby on Rails to Phoenix/React, I’ve realized just how deceiving looks can be. “Ticket to Fly” focuses on finding solutions to unexpected challenges along the way. Specifically, we’ll look into working with images, including svg file parsing, and converting ruby methods to elixir by taking advantage of recursion and function piping.</p>\n"
  },
  %{
    title: "My first Nerves Project: Bioreactor",
    slot: :slot_9,
    author: :david_schainker,
    category: :nerves,
    audience: :beginner,
    location: :evergreen_ab,
    description: "<p>Living in a vibrant Asian city can have its downsides, especially with regards to air quality. While buying the Latest and Greatest IoIT air filter can help with particulate matter in the air, there is little help with increased CO2 levels in your home, except installing and taking care of lots and lots of plants - an interesting challenge if you live in a high rise apartment building.</p>\n
<p>Armed with The Nerves Project and available literature on growing algae to remove CO2 from air, this talk will summarize the process of building and testing a basic \"breeder\" bioreactor that uses algae to create more fresh oxygen in the home. The ultimate goal of this project is to build a reactor that can self-sustain an \"optimzed\" state of maximum CO2 removal for a given reactor vessel size, with the aid of artificial light, and electricity.</p>\n"
  },
  %{
    title: "We're Just Getting Started - Our Three Years with Elixir",
    slot: :slot_9,
    author: :maciej_kaszubowski,
    category: :production,
    audience: :beginner,
    location: :evergreen_e,
    description: "<p>The story begins on August 12th, 2015, not even one year after the Elixir 1.0 release. Phoenix is on version 0.16.1, Ecto callbacks haven’t been deprecated yet. My current boss pushes our first Elixir commit to Gitlab.</p>\n
<p>ElixirConf is happening on September 4th, 2018. Three years and 60 thousand lines of code later, the project is still alive, serving one million registered users. We’re now on Elixir 1.6 and Phoenix 1.3. Ecto callbacks are long gone and only few of us can remember them.</p>\n
<p>A lot has changed. We’ve made a lot of mistakes. This is a success story, though. Running the same project for such a long time gave us a unique opportunity to observe how the language changed and became really mature. This talk will try to share some of the lessons learned during this time and insights on how changes in the ecosystem affected our codebase.</p>\n"
  },
  %{
    title: "Making a GraphQL Server with Absinthe & Dataloader",
    slot: :slot_b,
    author: :aaron_votre,
    category: :phoenix,
    audience: :intermediate,
    location: :grand_ballroom,
    description: "<p>The GraphQL query language has been growing in popularity since it's release by Facebook in 2015. It gives servers more flexibility than REST and Elixir already has an amazing library supporting the GraphQL Spec - Absinthe! If our API adapts, so should the way we access the database, that's where Dataloader makes writing Ecto queries easy and less repetitive.</p>\n
<p>See how we can make a simple graphQL server with as little code as possible.</p>\n
<p>- It will be helpful to have a basic understanding of Phoenix, Ecto, and the objective of GraphQL.</p>\n"
  },
  %{
    title: "Did You Hear That Wind?",
    slot: :slot_b,
    author: :frank_kumro,
    category: :nerves,
    audience: :intermediate,
    location: :evergreen_ab,
    description: "<p>I've been fascinated with the weather, unknowingly, for years. When I first met my wife we would watch a movie during storms to pass the time. Then when a gust of wind hit the house, I would turn to her and say \"Did you hear that wind?\".</p>\n
<p>Fast forward many years, we now live at a higher elevation with lots of wind. Storms would roll in and wind would hit the house. A few seconds later I would receive a message from my wife, \"Did you hear that wind!\". The trolling led me to dive into the hardware space and luckily enough I would be able to use my favorite language, Elixir!</p>\n
<p>The weather station is comprised of a Raspberry Pi 3, wind speed sensor, weather proof temperature sensor, and a few other bits to make it all work. As this was my first attempt at a hardware hacking project, we can laugh (together I hope) at my mix ups and take a peak at the many components. Elixir is used with Nerves to communicate with the hardware (1 wire Dallas and MCP3008 analog to digital), persist readings to an external API (Phoenix), and display with live updates via Elm.</p>\n
<p>The talk will cover the entire stack giving a look into a project that many commented that \"they wish they could do\" or \"I have no idea where to start\".</p>\n"
  },
  %{
    title: "Take Your Time",
    slot: :slot_b,
    author: :ben_marx,
    category: :nif,
    audience: :advanced,
    location: :evergreen_e,
    description: "<p>OTP20 officially introduced dirty schedulers. In this talk, we'll cover why they're part of OTP and what function they perform. Using Rust NIFs, we'll compare schedulers and dirty schedulers to illustrate the trade-offs between scheduler types. By the talk's end, it should be apparent why dirty schedulers are part of OTP and how and when you should consider using them.</p>\n"
  },
  %{
    title: "Building Video Chat with Elixir & Phoenix",
    slot: :slot_c,
    author: :anil_wadghule,
    category: :phoenix,
    audience: :intermediate,
    location: :grand_ballroom,
    description: "<p>In this talk, I will share my experience and learnings about how I built a production-grade video chat system with Elixir and Phoenix.</p>\n
<p>My video chat app makes use of following features of Elixir and Phoenix.</p>\n
<ul>
  <li><strong>Real-time with Phoenix channels</strong><br />How a Video Chat benefits with real-time features of Phoenix framework. In a Video Chat app, there are so many interactions which happen in a group, so you need real-time capabilities on your server.</li>
  <li><strong>Agents, Tasks, GenSevers</strong><br />How I used Agents to wrap the state, I need to talk to a third party server, how I used Tasks to perform certain operations, how I used GenServers for long-running features like Cache servers and recorded media file uploaders.</li>
  <li><strong>Supervisors</strong><br />Instead of crashing, how we gracefully stop services. When users close tabs, other users in video chat should be gracefully informed that users have quit. I will cover, how we make use of supervisors and GenServers for the use case.</li>
  <li><strong>GenStage for events processing with a remote WebRTC media server</strong><br />Third party media server has API and continually sends different events such as network is slow, user's video is unpublished or audio went off etc. We will see how I make use of GenStage's event handling to show user's feedback interactively.</li>
  <li><strong>Debugging</strong><br />We will see how Erlang's debugging tools come in handy when there is something wrong.</li>
</ul>"
  },
  %{
    title: "A Deep Dive Into Hex",
    slot: :slot_c,
    author: :todd_resudek,
    category: :hex,
    audience: :general,
    location: :evergreen_ab,
    description: "<p>Hex is one of the few tools that virtually every Elixir and Erlang developer relies on, yet many people never get past deps.get. Hex can do a lot more to make you more productive, and is taking steps to proactively prevent issues (like leftpad) from ever happening.</p>\n
<p>I want to take you on a journey through this incredible piece of software, including some interesting features, the security measures taking place behind the scenes, and other interesting nuances that live deep in the source code.</p>\n"
  },
  %{
    title: "Interfacing with Machine-Learned Models",
    slot: :slot_c,
    author: :mathew_gardner,
    category: :nif,
    audience: :advanced,
    location: :evergreen_e,
    description: "<p>Much of today's problems can be solved using machine learning algorithms, even really simple ones. More and more teams are incorporating their use into their product and solution offerings. While these algorithms themselves aren't the focus of this talk, Mathew will show how one may go about working with them in Elixir. From basic black box API calls, to using ports and NIFs, showing how to bring machine learning closer to the Elixir application.</p>\n"
  },

  %{
    title: "Keynote",
    slot: :slot_g,
    author: :justin_schneck,
    category: :keynote,
    audience: :general,
    location: :grand_ballroom,
    description: "Keynote"
  },

  %{
    title: "Understanding Elixir's (Re)compilation",
    slot: :slot_i,
    author: :renan_ranelli,
    category: :elixir,
    audience: :general,
    location: :grand_ballroom,
    description: "<p>Elixir's code-generation capabilities require a sophisticated compiler with complex dependency tracking. Given such complexity, it is often unclear why sometimes changing a single line in a single file triggers the recompilation of 100 other files. This talk aims to clarify that.</p>\n
<p>Most of the content presented in this talk was \"discovered\" while struggling with recompilations of 500+ files in a 2000+ .beam file Phoenix app. We learned things the hard way so that you don't have to.</p>\n
<p>In this talk we are going to take a deep dive into what happens when you type \"mix compile\", why and when modules need to be recompiled, and how compilation behavior interacts with umbrella apps. You will learn how to \"debug\" recompilation problems, which tools to use, and how to avoid common pitfalls.</p>\n"
  },
  %{
    title: "Event Sourcing in Real World Applications: Challenges, Successes and Lessons Learned.",
    slot: :slot_i,
    author: :james_smith,
    category: :code_quality,
    audience: :advanced,
    location: :evergreen_ab,
    description: "<p>Our client came to us wanting to build a real time auction application for supplying fuel to ships.</p>\n
<p>This was exciting! We were going to be auctioning upwards of 1000 metric tons of fuel using Elixir and Phoenix! What could go wrong?</p>\n
<p>From the beginning of the project there was a hard requirement for auditing. Anything that happened in the system needed to be recorded. This lead us to the idea of Event Sourcing.</p>\n"
  },
  %{
    title: "Picking Properties to Test in Property-Based Testing",
    slot: :slot_i,
    author: :michael_stalker,
    category: :testing,
    audience: :general,
    location: :evergreen_e,
    description: "<p>The developer stared at the screen in frustration and grumbled, \"Example-based testing is straightforward. I pick a few inputs, and verify the output. I don't get property-based testing. How can I write a test if I don't know what the inputs are?\"</p>\n
<p>Maybe you're like this developer. Maybe you're sold on the value of property-based testing. Maybe you're convinced that it will help you write effective specs. But where do you go from here?</p>\n
<p>Identifying properties to test is your next step toward property-based testing greatness. You'll learn what properties are. You'll gain strategies to identify them in your code. You'll see practical examples using StreamData, a new addition to the Elixir language. You might even start to view code verification in a new light.</p>\n
<p>You'll get the most out of this presentation if you have used example-based testing in any language. You'll go from \"property-based testing looks awesome\" to \"I can do it!\"</p>\n"
  },

  %{
    title: "Behavior Trees and Battleship: Tapping into the Power of Advanced Data Structures",
    slot: :slot_j,
    author: :jeff_schomay,
    category: :elixir,
    audience: :general,
    location: :grand_ballroom,
    description: "<p>I wrote the Elixir Behavior Tree library. This talk explores what a behavior tree is, how it is used in AI and robotics, and how it differs from decision trees and state machines. I describe how it relies on the Zipper Tree, emphasizing the technique of encoding logic into declarative data structures, and I will contrast my design decisions and implementation in Elixir against other mutable, non-functional languages that behavior trees are usually written in. I will pull it all together with a cool demo, iterating on a behavior tree AI that plays Battleship.</p>\n"
  },
  %{
    title: "Breaking Down the User Monolith",
    slot: :slot_j,
    author: :zach_porter,
    category: :code_quality,
    audience: :beginner,
    location: :evergreen_ab,
    description: "<p>Coming from Ruby on Rails, the convention is to have a `User` model handle multiple aspects of an account such as login, logout, password reset, and email confirmation. While there is a temptation to bring that convention with us when building an Elixir application, we can do better by leveraging bounded contexts, Ecto's embedded schemas, and `Ecto.Multi` to break these separate pieces of functionality into isolated chunks that are easier to maintain and extend.</p>\n
<p>Come on a journey with me as I take a large Elixir `User` module and break it down into smaller, focused modules. We'll employ a test-driven development approach and may even end up with a better database design for managing user accounts in an Elixir application.</p>\n"
  },
  %{
    title: "Sustainable Testing",
    slot: :slot_j,
    author: :andrew_bennett,
    category: :testing,
    audience: :intermediate,
    location: :evergreen_e,
    description: "<p>Sustainable test suites are long lived and effective at revealing bugs. However, the complexity of distributed cloud applications can make it challenging to have much confidence in system correctness. What testing practices are present in other functional languages? How is property-based testing related to model checking and formal verification?</p>\n
<p>We'll explore test frameworks and practices from other functional languages and academic sources in hopes of improving the way we test software in Elixir. We'll discuss tools as they exist today, as well as future tools being developed at Toyota Connected and among the Elixir community to empower developers to more efficiently test their systems.</p>\n"
  },

  %{
    title: "Going Multi-Node",
    slot: :slot_l,
    author: :eric_oestrich,
    category: :distributed_systems,
    audience: :advanced,
    location: :grand_ballroom,
    description: "<p>You have an application that works well on a single node, and you’ve heard that Erlang lets you scale out in a cluster. How do you go about doing that?</p>\n
<p>We’ll walk through the steps I took to turn ExVenture (a multiplayer game server) into a distributed application.</p>\n
<p>Starting with connecting nodes in development and production, to picking a cluster leader via the Raft protocol, and dealing with process groups to fan calls throughout the cluster.</p>\n
<p>Finally we’ll see some of the hurdles I encountered when spanning multiple nodes.</p>\n"
  },
  %{
    title: "Docker and OTP: Friends or Foes?",
    slot: :slot_l,
    author: :daniel_azuma,
    category: :deployment,
    audience: :advanced,
    location: :evergreen_ab,
    description: "<p>Docker is the hot deployment technology across the industry, and many workloads are moving into cloud services. But for Elixir and other BEAM languages, there's some hesitation. Will containers work with stateful processes? What about hot code upgrades?</p>\n
<p>This talk will survey the sources of friction, real or perceived, between Docker and OTP. You'll discover techniques and tools that let your stateful Elixir applications thrive in a container-based cloud environment.</p>\n"
  },
  %{
    title: "Empirical Monkeys: A Practitioner’s Take on Breaking Distributed Elixir Systems via Property-Based Testing",
    slot: :slot_l,
    author: :rafal_studnicki,
    category: :testing,
    audience: :intermediate,
    location: :evergreen_e,
    description: "<p>Suppose you have a distributed system deployed in production and you are on the hook for its uptime metrics. Having been there ourselves, we have come to believe that it’s essential for software developers to understand what guarantees a system provides, and to have a good picture of *how* it will behave under unfavorable conditions.</p>\n
<p>In this talk, we’ll outline the basic theory of safety and liveness properties; the link between modeling properties in your head and converting them into working PropCheck code; and showcase the results of applying our philosophy to example applications. You’ll see how ETS-based, Mnesia-based, and Phoenix-PubSub-based Elixir apps fare when in dire straits.</p>\n
<p>We hope to convince you that getting from zero to one in property-based testing in not that hard, and show you how to gain confidence in your Elixir application’s performance in production.</p>\n"
  },

  %{
    title: "Using Elixir GenStage to Track Video Watch Progress",
    slot: :slot_m,
    author: :emerson_macedo,
    category: :genstage,
    audience: :intermediate,
    location: :grand_ballroom,
    description: "<p>This talk is a history of how GenStage became the perfect fit to a Video Watch Progress software.</p>\n
<p>In the beginning of 2016, we started to migrate a High Throughput Ruby Web API to Elixir. Starting with a single 1:1 rewrite, we did lots of improvements and in the beginning of 2018, GenStage was a great fit to deliver the best solution we could. We did load-shedding, back-pressure and lots of techniques using this powerful Elixir tool.</p>\n"
  },
  %{
    title: "Handling Success: Development and Deployment Beyond Hello World",
    slot: :slot_m,
    author: :jerel_unruh,
    category: :deployment,
    audience: :advanced,
    location: :evergreen_ab,
    description: "<p>So your project has gotten popular. More funding, more traffic, more developers contributing code. Just SSH'ing into your production server and running mix phx.server & isn't going to cut it. Now the business requirements need the application to integrate with Service A but possibly run a second, almost identical, deployment that integrates with Service B. And part of the current functionality is a candidate for being shaved off into a separate product in the future.</p>\n
<p>In this talk I'll give a few ideas for structuring your umbrella project, running lots of tests quickly, and building and deploying flexible releases.</p>\n"
  },
  %{
    title: "Introducing Scenic - A Functional UI Framework",
    slot: :slot_m,
    author: :boyd_multerer,
    category: :ui,
    audience: :beginner,
    location: :evergreen_e,
    description: "<p>After years of work, I am releasing Scenic, a UI framework you can use to build UI directly in Elixir or Erlang without using a browser. Scenic can create small, fast, and robust interactive applications on Nerves devices, MacOS, Linux and more.</p>\n
<p>In this talk, I’ll give an overview of the framework, how it works and demonstrate it running in addition to connecting it to a Phoenix service to remote the application across the net.</p>\n"
  },

  %{
    title: "Erlang/OTP: What's in the Box?",
    slot: :slot_o,
    author: :joao_britto,
    category: :otp,
    audience: :beginner,
    location: :grand_ballroom,
    description: "<p>20 years ago Erlang/OTP was released as Open Source. And we have a lot to celebrate.</p>\n
<p>When we are first introduced to Elixir we notice that although it does an excellent job in simplifying and abstracting the thorny parts of the platform, every once in a while we encounter some straight calls to Erlang code. Why do we need them? How do they work? Fear not, for these are in fact the tips of amazing, old, beautiful icebergs.</p>\n
<p>This talk opens the box of Erlang/OTP and introduces some of the coolest built-in tools and libraries available in a standard Erlang/OTP installation, such as wx, ssh, timer, crypto and digraph. We will go over the most popular ones, without forgetting to stop by the most underground (and often underrated) ones, showing some examples of how they can come in handy in numerous occasions.</p>\n"
  },
  %{
    title: "Using Elixir and OTP behaviors to monitor infrastructure",
    slot: :slot_o,
    author: :jeffrey_gillis,
    category: :monitoring,
    audience: :beginner,
    location: :evergreen_ab,
    description: "<p>Using Elixir and OTP behaviors, infrastructure engineers at Optoro, Inc. monitor and interact with legacy infrastructure. This talk describes how SSHex, GenServers, Supervisors, and a Registry were used to monitor and interact with processes across multiple servers. It will also describe how the main library was created to be used across multiple projects (command line and a Phoenix web application).</p>\n"
  },
  %{
    title: "Texas: Virtual DOM Library for Server-Side V-DOM.",
    slot: :slot_o,
    author: :dan_mcguire,
    category: :ui,
    audience: :intermediate,
    location: :evergreen_e,
    description: "<p>Client-side applications are expensive to make, difficult to maintain and practically impossible to account for all edge cases. We've gotten so caught up in the front-end framework fever that we haven’t yet taken the time to consider if there are better ways to achieve the goal of building rich user interactions.</p>\n
<p>Texas takes the Virtual DOM approach for updating the DOM with lightweight patches, but instead of calculating patches on the client, it does all the heavy lifting on the server-side bringing control back to the developer and keeping your source of truth closer to your business logic. The end result is faster initial page loads, less data over the wire, more flexibility in choosing your transport methods, graceful application degradation, and maybe the most attractive feature is the development speed increase you'll see when you come back to the server and stop struggling with client-side code!</p>\n"
  },

  %{
    title: "Scaling Concurrency Without Getting Burned",
    slot: :slot_p,
    author: :alex_garibay,
    category: :otp,
    audience: :intermediate,
    location: :grand_ballroom,
    description: "<p>We all know Elixir is fast and scalable, but knowing how to leverage its strengths can be the difference between a fast program and one unrivaled by other platforms. Whether you're reaching for Tasks and GenServers, or wrangling data with Ecto, understanding subtle nuances of each tool is the key to avoiding bottlenecks and writing efficient applications.</p>\n
<p>Starting from real-world scenarios, we'll explore various OTP tricks and concurrency patterns to drive maximum performance. Along the way, we'll see how features built into Elixir and OTP can apply to applications from small to large. We'll also navigate the unexpected pitfalls that come with cheap concurrency and how to safeguard from each trap.</p>\n
<p>Whether you're an intermediate or seasoned Elixir developer, you'll leave with some new performance tricks and a mental model for writing highly concurrent applications.</p>\n"
  },
  %{
    title: "Down the Memory Lane: a Tale of Memory Leaks",
    slot: :slot_p,
    author: :guilherme_de_maio,
    category: :elixir,
    audience: :intermediate,
    location: :evergreen_ab,
    description: "<p>Much is said about the BEAM and how it’s GC per process is amazing, but sometimes memory leaks do happen! While developing Elixir apps I encountered such cases more than once, and this talk is about why that happens and what to do when it does.</p>\n
<p>Understanding how the Erlang runtime is different from other platforms we’re used to is crucial for solving such issues. How can you pinpoint what’s causing the leak? What are common reasons and solutions? These are the questions that will drive this talk.</p>\n"
  },
  %{
    title: "Building a Stateful Web Application with Elixir",
    slot: :slot_p,
    author: :enio_lopes,
    category: :production,
    audience: :intermediate,
    location: :evergreen_e,
    description: "<p>The concurrency primitives provided by Erlang are a perfect match to build stateful web applications.</p>\n
<p>Nowadays it is common to see stateless applications that depend on databases to keep any kind of state, but that adds some overhead.</p>\n
<p>Arguably, not using databases will create more problems than solve them. I will try to describe the trade-offs in building a databaseless web application and what are the different scenarios befitting such an approach. A web application that is independent of databases also has its own set of problems, specially when thinking about running that application in a distributed manner.</p>\n
<p>We've built such an application at uSwitch and I will walk you through the steps and different challenges we've faced while building it.</p>\n
<p>We hope that after hearing this talk you will be able to identify scenarios where databases won't be needed and thus write a stateless application.</p>\n"
  },

  %{
    title: "Keynote",
    slot: :slot_s,
    author: :chris_mccord,
    category: :keynote,
    audience: :general,
    location: :evergreen_e
  }
]









