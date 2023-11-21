import '../model/task_model.dart';

List<Map> quickReplies = [
  {
    "title": "Ask for Advice",
    "replies": [
      {
        "title": "How do I become rich in 2 days?",
        "image": "assets/icon/money_face.png",
      },
      {
        "title": "Best gift for a birthday celebration",
        "image": "assets/icon/gift.png",
      },
      {
        "title": "How can I get a promotion at work?",
        "image": "assets/icon/money.png",
      },
    ]
  },
  {
    "title": "Have fun",
    "replies": [
      {
        "title": "Tell me a joke",
        "image": "assets/icon/laugh.png",
      },
    ]
  },
  {
    "title": "Write and Edit",
    "replies": [
      {
        "title": "Create a one-page essay on The Great Gatsby",
        "image": "assets/icon/pencil.png",
      },
    ]
  },
  {
    "title": "Improve Health",
    "replies": [
      {
        "title": "How many hours of sleep does an average person need?",
        "image": "assets/icon/bed.png",
      },
    ]
  },
  {
    "title": "Explain and Clarify",
    "replies": [
      {
        "title": "What is diffraction?",
        "image": "assets/icon/torch.png",
      },
      {
        "title": "Explain wormholes like I’m 4",
        "image": "assets/icon/class_teacher.png",
      },
      {
        "title": "How does light interact with matter?",
        "image": "assets/icon/skills.png",
      },
    ]
  },
  {
    "title": "Team Philosophy",
    "replies": [
      {
        "title": "What is the meaning of life?",
        "image": "assets/icon/game.png",
      },
    ]
  },
  {
    "title": "Role play",
    "replies": [
      {
        "title": "Act as an interviewer",
        "image": "assets/icon/class_teacher.png",
      },
      {
        "title": "Act like Super man",
        "image": "assets/icon/hero.png",
      },
    ]
  },
  {
    "title": "Play Games",
    "replies": [
      {
        "title": "Let’s play word ladder. You go first!",
        "image": "assets/icon/group.png",
      },
    ]
  },
  {
    "title": "Get Travel Tips",
    "replies": [
      {
        "title": "What should I see on a 2 day trip to Barcelona?",
        "image": "assets/icon/plane.png",
      },
    ]
  },
  {
    "title": "Cook like a pro",
    "replies": [
      {
        "title": "How to make a banana smoothie",
        "image": "assets/icon/banana.png",
      },
    ]
  },
];

List<Map> shortcuts = [
  {
    "title": "Visualization",
    "image": "assets/images/visualization.png",
  },
  {
    "title": "Summary",
    "image": "assets/images/summary.png",
  },
  {
    "title": "Social",
    "image": "assets/images/social.png",
  },
  {
    "title": "Creativity",
    "image": "assets/images/creativity.png",
  },
  {
    "title": "studying",
    "image": "assets/images/studying.png",
  },
  {
    "title": "promotion",
    "image": "assets/images/promotion.png",
  },
  {
    "title": "internet",
    "image": "assets/images/internet.png",
  },
  {
    "title": "reading",
    "image": "assets/images/reading.png",
  },
  {
    "title": "fun",
    "image": "assets/images/fun.png",
  },
  {
    "title": "writing",
    "image": "assets/images/writing.png",
  },
  {
    "title": "coding",
    "image": "assets/images/coding.png",
  },
  {
    "title": "health",
    "image": "assets/images/health.png",
  },
  {
    "title": "youth",
    "image": "assets/images/youth.png",
  },
];

List<TaskModel> tasksForAiOnlineWorld = [
  TaskModel(
    title: "Twitter Profile",
    description: "Craft compelling twitter posts.",
    image: "assets/icon/ai/x.png",
  ),
  TaskModel(
    title: "Tweets",
    description: "Summarize your tex into a tweet.",
    image: "assets/icon/ai/x.png",
  ),
  TaskModel(
    title: "Linkedin Profile",
    description: "Create memorable posts on Linkedin.",
    image: "assets/icon/ai/linkedin.png",
  ),
  TaskModel(
    title: "Job search",
    description: "Make your Linkedin cover letter stand out.",
    image: "assets/icon/ai/linkedin.png",
  ),
  TaskModel(
    title: "Hiring",
    description: "Write clear and concise job descriptions.",
    image: "assets/icon/ai/linkedin.png",
  ),
  TaskModel(
    title: "Captions",
    description: "Come up with engaging captions for reel videos.",
    image: "assets/icon/ai/insta.png",
  ),
  TaskModel(
    title: "Content",
    description: "Create Instagram posts on any topic.",
    image: "assets/icon/ai/insta.png",
  ),
  TaskModel(
    title: "Reels",
    description: "Get creative descriptions for your instagram reels.",
    image: "assets/icon/ai/insta.png",
  ),
  TaskModel(
    title: "TikTok",
    description: "Boost your TikTok views with appealing captions.",
    image: "assets/icon/ai/tiktok.png",
  ),
  TaskModel(
    title: "TikTok",
    description: "Craft TikTok posts on any caption.",
    image: "assets/icon/ai/tiktok.png",
  ),
  TaskModel(
    title: "Facebook",
    description: "Stand out on Facebook with unique posts.",
    image: "assets/icon/ai/fb.png",
  ),
  TaskModel(
    title: "Virality",
    description: "Write a killer description for your YouTube video.",
    image: "assets/icon/ai/youtube.png",
  ),
  TaskModel(
    title: "YouTube World",
    description: "Pen YouTube posts to your liking.",
    image: "assets/icon/ai/youtube.png",
  ),
  TaskModel(
    title: "Chatting",
    description:
        "Get help, creative ideas and smart advice from our A.I assistant.",
    image: "assets/icon/ai/chat.png",
  ),
  TaskModel(
    title: "Roleplay",
    description: "Talk to A.I as if it’s someone else.",
    image: "image",
  ),
  TaskModel(
    title: "Social Web",
    description: "Cover any event or topic on social media.",
    image: "assets/icon/ai/chat.png",
  ),
  TaskModel(
    title: "Scripts",
    description: "Create a short creative script for your video on any topic.",
    image: "assets/icon/ai/youtube.png",
  ),
  TaskModel(
    title: "Influencers",
    description:
        "Discover who has the most followers on any social media platform.",
    image: "image",
  ),
];

List<TaskModel> communicationsTasks = [
  TaskModel(
    title: "Coffee date",
    description: "Ask your crush out for a coffee.",
    image: "assets/icon/ai/coffee.png",
  ),
  TaskModel(
    title: "Movie date",
    description: "Invite your partner to the movies.",
    image: "assets/icon/ai/tv.png",
  ),
  TaskModel(
    title: "Outdoor Date",
    description: "Come up with engaging captions for reel videos.",
    image: "assets/icon/ai/bicycle.png",
  ),
  TaskModel(
    title: "Care",
    description: "Come up with engaging captions for reel videos.",
    image: "assets/icon/ai/health.png",
  ),
  TaskModel(
    title: "Support",
    description: "Send your partner a comforting message.",
    image: "assets/icon/ai/youtube.png",
  ),
  TaskModel(
    title: "Reply ideas",
    description: "Explore possible replies to your partner’s message.",
    image: "assets/icon/ai/chat.png",
  ),
  TaskModel(
    title: "Polite refusal",
    description: "Decline a date gracefully.",
    image: "assets/icon/ai/heartbreak.png",
  ),
  TaskModel(
    title: "Friend Zone",
    description: "Politely tell them you want to be just friends.",
    image: "assets/icon/ai/handshake.png",
  ),
  TaskModel(
    title: "Dating",
    description: "Start your conversation in an original and memorable way.",
    image: "assets/icon/ai/heart_red.png",
  ),
  TaskModel(
    title: "Flirting",
    description: "Ask engaging question",
    image: "assets/icon/ai/handshake_alt.png",
  ),
  TaskModel(
    title: "Therapist",
    description:
        "Get anything off your chest and have a heart-to-heart with A.I.",
    image: "assets/icon/ai/heart_red.png",
  ),
  TaskModel(
    title: "Admiration",
    description: "Learn the art of complimenting",
    image: "assets/icon/ai/heart_green.png",
  ),
  TaskModel(
    title: "Dating",
    description: "Start your conversation in an original and memorable way.",
    image: "assets/icon/ai/bag.png",
  ),
];

List<TaskModel> educationTasks = [
  TaskModel(
    title: "Rewriting",
    description: "Create Unique rewrites with high level authenticity.",
    image: "assets/icon/ai/book.png",
  ),
  TaskModel(
    title: "Writing",
    description: "Fight writer’s block and finish your text.",
    image: "assets/icon/ai/pen.png",
  ),
  TaskModel(
    title: "Essay",
    description: "Have a well-structured essay written especially for you.",
    image: "assets/icon/ai/book.png",
  ),
  TaskModel(
    title: "Math",
    description: "Have any question solved in a jiffy.",
    image: "assets/icon/ai/math.png",
  ),
  TaskModel(
    title: "Text check",
    description: "Check any text for written and grammatical mistakes.",
    image: "assets/icon/ai/book.png",
  ),
  TaskModel(
    title: "Text style",
    description: "See your text re-written in another style.",
    image: "assets/icon/ai/text.png",
  ),
  TaskModel(
    title: "Rephrasing",
    description: "Find other ways to convey the same thought.",
    image: "assets/icon/ai/face.png",
  ),
  TaskModel(
    title: "Explanation",
    description:
        "Get clear and precise answers to the most complicated questions.",
    image: "assets/icon/ai/language.png",
  ),
  TaskModel(
    title: "Translation",
    description: "Translate text into any language.",
    image: "assets/icon/ai/text.png",
  ),
  TaskModel(
    title: "History",
    description: "Learn which historical events happened on any given day.",
    image: "assets/icon/ai/history.png",
  ),
  TaskModel(
    title: "Outlining",
    description: "Get a summary of any work of literature",
    image: "assets/icon/ai/book.png",
  ),
  TaskModel(
    title: "Coding",
    description: "Understand the purpose and function of any code.",
    image: "assets/icon/ai/code.png",
  ),
  TaskModel(
    title: "Chemistry",
    description: "Have any chemical equation balanced in a flash.",
    image: "assets/icon/ai/lab.png",
  ),
  TaskModel(
    title: "Literature",
    description: "Discover what you can read tonight..",
    image: "assets/icon/ai/book.png",
  ),
  TaskModel(
    title: "Keywords",
    description: "Make a list of the most important words in a text.",
    image: "assets/icon/ai/word.png",
  ),
  TaskModel(
    title: "Code check",
    description: "Find bugs and errors in any code.",
    image: "assets/icon/ai/bugs.png",
  ),
];

List<TaskModel> funTasks = [
  TaskModel(
    title: "A.I Art",
    description: "Create detailed prompts you can use in A.I image generators.",
    image: "assets/icon/ai/art.png",
  ),
  TaskModel(
    title: "Stories",
    description:
        "Imagine engaging and imaginative stories that will captivate any audience.",
    image: "assets/icon/ai/edu.png",
  ),
  TaskModel(
    title: "Songwriting",
    description: "Compose lyrics to a song on any topic.",
    image: "assets/icon/ai/playlist.png",
  ),
  TaskModel(
    title: "Job search",
    description: "Make your Linkedin cover letter stand out.",
    image: "assets/icon/ai/idea.png",
  ),
  TaskModel(
    title: "Fun time",
    description:
        "Chat with a playful and easy going A.I that will make you laugh.",
    image: "assets/icon/ai/pad.png",
  ),
  TaskModel(
    title: "Emoji",
    description: "Turn any text into emojis.",
    image: "assets/icon/ai/youtube.png",
  ),
  TaskModel(
    title: "Ideas",
    description:
        "Toy with your bright ideas about how to spend time with friends",
    image: "assets/icon/ai/idea.png",
  ),
  TaskModel(
    title: "Guide",
    description:
        "Specify your location and get a list of nearby tourist attractions.",
    image: "assets/icon/ai/plane.png",
  ),
  TaskModel(
    title: "Travel",
    description:
        "Share your departure and destination cities and see relevant airport codes.",
    image: "assets/icon/ai/tv.png",
  ),
  TaskModel(
    title: "Movies",
    description: "Discover what you can watch tonight.",
    image: "assets/icon/ai/movie.png",
  ),
  TaskModel(
    title: "Playlist",
    description: "Get personal music recommendations.",
    image: "assets/icon/ai/playlist.png",
  ),
  TaskModel(
    title: "Birthday",
    description:
        "Consider these original ideas to make your birthday unforgettable.",
    image: "assets/icon/ai/cake.png",
  ),
  TaskModel(
    title: "Fashion",
    description: "Complete your look with the help of A.I",
    image: "assets/icon/ai/clothes.png",
  ),
  TaskModel(
    title: "Cooking",
    description: "Get quick and healthy meal ideas.",
    image: "assets/icon/ai/food.png",
  ),
  TaskModel(
    title: "Cars",
    description: "Get a list of the best cars meeting your requirements.",
    image: "assets/icon/ai/racing.png",
  ),
  TaskModel(
    title: "Recipes",
    description: "Follow a detailed recipe to make any dish you want.",
    image: "assets/icon/ai/food.png",
  ),
  TaskModel(
    title: "Presents",
    description: "Get a list of original gift ideas based on your request.",
    image: "assets/icon/ai/cake.png",
  ),
];

List<TaskModel> workTasks = [
  TaskModel(
    title: "Interview Tips",
    description: "Receive helpful tips to sail through your interview.",
    image: "assets/icon/ai/interview.png",
  ),
  TaskModel(
    title: "Emails",
    description: "Encourage your employees to act promptly.",
    image: "assets/icon/ai/mail.png",
  ),
  TaskModel(
    title: "CV",
    description:
        "Generate a short and creative resume any recruiter would greenlight.",
    image: "assets/icon/ai/cv.png",
  ),
  TaskModel(
    title: "Summarize",
    description:
        "Summarize any text and create a numbered list of its key points.",
    image: "assets/icon/ai/youtube.png",
  ),
  TaskModel(
    title: "Day Off",
    description: "Come up with the best excuse for requesting a day off.",
    image: "assets/icon/ai/sun.png",
  ),
  TaskModel(
    title: "Employment",
    description: "Find out the approximate requirements for a job.",
    image: "assets/icon/ai/job.png",
  ),
  TaskModel(
    title: "Doc Flow",
    description: "Have your project documentation outline designed.",
    image: "assets/icon/ai/youtube.png",
  ),
  TaskModel(
    title: "Interview",
    description: "Receive a short list of questions a recuiter may ask you.",
    image: "assets/icon/ai/interview.png",
  ),
  TaskModel(
    title: "Recruiting",
    description: "Define the qualifications for any position.",
    image: "assets/icon/ai/job.png",
  ),
  TaskModel(
    title: "Passwords",
    description: "Create complex passwords based on specific input parameters.",
    image: "assets/icon/ai/password.png",
  ),
];

List<TaskModel> emailTasks = [
  TaskModel(
    title: "Linkedin",
    description: "Write a compelling cover letter.",
    image: "assets/icon/ai/linkedin.png",
  ),
  TaskModel(
    title: "Manager’s Email",
    description: "Encourage your employees to enhance their performance.",
    image: "assets/icon/ai/mail.png",
  ),
  TaskModel(
    title: "Advertising",
    description: "Describe the benefits of your product.",
    image: "assets/icon/ai/advert.png",
  ),
  TaskModel(
    title: "Discount",
    description: "Promote truly tempting discounts.",
    image: "assets/icon/ai/discount.png",
  ),
  TaskModel(
    title: "Event",
    description: "Craft an email to arrange an event.",
    image: "assets/icon/ai/event.png",
  ),
  TaskModel(
    title: "Late for work",
    description: "Inform your boss you are running late for work.",
    image: "assets/icon/ai/work.png",
  ),
  TaskModel(
    title: "Closing Deal",
    description: "Compose an email to finalize a deal.",
    image: "assets/icon/ai/deal.png",
  ),
  TaskModel(
    title: "Email to staff",
    description: "Inform employees of the latest company news.",
    image: "assets/icon/ai/mail.png",
  ),
  TaskModel(
    title: "Co-operation offer",
    description: "Propose a deal or other form of co-operation",
    image: "assets/icon/ai/handshake.png",
  ),
  TaskModel(
    title: "Raise Request",
    description: "Ask your boss to raise your salary",
    image: "assets/icon/ai/git.png",
  ),
  TaskModel(
    title: "Presentation",
    description:
        "Write an email to present your product or service to partners.",
    image: "assets/icon/ai/present.png",
  ),
  TaskModel(
    title: "Personal proposal",
    description:
        "Describe the costs and benefits of your business to a potential partner.",
    image: "assets/icon/ai/youtube.png",
  ),
  TaskModel(
    title: "Rewrite",
    description: "Create a unique rewrite of any text.",
    image: "assets/icon/ai/pen.png",
  ),
];

List<TaskModel> emailLetterTasks = [
  TaskModel(
    title: "Content",
    description:
        "Plan your content ahead and stay on top of any social media network.",
    image: "assets/icon/ai/edu.png",
  ),
  TaskModel(
    title: "Sales",
    description: "Create an ideal landing page title for your product.",
    image: "assets/icon/ai/Vector.png",
  ),
  TaskModel(
    title: "Emails",
    description: "Generate powerful sales emails with strong CTAs.",
    image: "assets/icon/ai/mail.png",
  ),
  TaskModel(
    title: "Sales copy",
    description:
        "Create professional grade rewrites with high level authenticity.",
    image: "assets/icon/ai/podium.png",
  ),
  TaskModel(
    title: "Event",
    description: "Craft an email to arrange an event.",
    image: "assets/icon/ai/cake.png",
  ),
  TaskModel(
    title: "Late for work",
    description: "Inform your boss you are running late for work.",
    image: "assets/icon/ai/work.png",
  ),
  TaskModel(
    title: "Google ads",
    description: "Create a Google ad description with SEO keywords.",
    image: "assets/icon/ai/google.png",
  ),
  TaskModel(
    title: "Co-operation offer",
    description: "Propose a deal or other form of co-operation",
    image: "assets/icon/ai/work.png",
  ),
  TaskModel(
    title: "Ad Rewrites",
    description: "Rewrite your ads in original ways.",
    image: "assets/icon/ai/pen.png",
  ),
  TaskModel(
    title: "Headlines",
    description: "Create a one-line title for your product.",
    image: "assets/icon/ai/edu.png",
  ),
  TaskModel(
    title: "FAQ",
    description: "Get a list of potential questions to your texts.",
    image: "assets/icon/ai/faq.png",
  ),
  TaskModel(
    title: "Discounts",
    description: "Create unbeatable discount offers for your product.",
    image: "assets/icon/ai/discount.png",
  ),
];

List<TaskModel> ideasTasks = [
  TaskModel(
    title: "Starting business",
    description:
        "Come up with numerous ideas for starting a business without spending money.",
    image: "assets/icon/ai/edu.png",
  ),
  TaskModel(
    title: "Business ideas",
    description:
        "Get ideas for starting your business with the money you have.",
    image: "assets/icon/ai/Vector.png",
  ),
  TaskModel(
    title: "Sales",
    description: "Get a creative product description to market online",
    image: "assets/icon/ai/youtube.png",
  ),
  TaskModel(
    title: "Startups",
    description:
        "Get a list of ambitious startup ideas based on your area of interest.",
    image: "assets/icon/ai/youtube.png",
  ),
  TaskModel(
    title: "Products",
    description: "Come up with solutions that combine two ideas.",
    image: "assets/icon/ai/youtube.png",
  ),
  TaskModel(
    title: "New Venture",
    description:
        "List your best qualities and find a startup that suits you the most.",
    image: "assets/icon/ai/youtube.png",
  ),
  TaskModel(
    title: "Production",
    description:
        "Describe your product and share the keywords you want to use.",
    image: "assets/icon/ai/youtube.png",
  ),
];

List<TaskModel> healthTasks = [
  TaskModel(
    title: "Fitness",
    description: "Get a list of exercises made especially for you.",
    image: "assets/icon/ai/exercise.png",
  ),
  TaskModel(
    title: "Gaining Muscle",
    description: "Get useful tips to bulk up faster.",
    image: "assets/icon/ai/muscle.png",
  ),
  TaskModel(
    title: "Healthy Diet",
    description: "Get a creative product description to market online",
    image: "assets/icon/ai/food.png",
  ),
  TaskModel(
    title: "Slimming",
    description: "Develop optimal diet strategies.",
    image: "assets/icon/ai/food_1.png",
  ),
  TaskModel(
    title: "Sleep Problems",
    description: "Find remedies for insomnia to start sleeping better.",
    image: "assets/icon/ai/solar.png",
  ),
  TaskModel(
    title: "Calorie Burn",
    description:
        "Calculate the number of calories you burn off based on your daily activities.",
    image: "assets/icon/ai/food.png",
  ),
  TaskModel(
    title: "Dieting",
    description: "Make a smooth transition to healthy foods.",
    image: "assets/icon/ai/food.png",
  ),
  TaskModel(
    title: "Calorie Intake",
    description: "Learn how many calories you’ve consumed.",
    image: "assets/icon/ai/calories.png",
  ),
];

List<TaskModel> codingTasks = [
  TaskModel(
    title: "Web",
    description: "Develop a perfect website for your product.",
    image: "assets/icon/ai/web.png",
  ),
  TaskModel(
    title: "Coding",
    description: "Understand the purpose and function of any code.",
    image: "assets/icon/ai/code_fill.png",
  ),
  TaskModel(
    title: "Software",
    description: "Build the frontend and backend of your software.",
    image: "assets/icon/ai/laptop.png",
  ),
  TaskModel(
    title: "Developer",
    description: "Let A.I become your Senior Front-end developer.",
    image: "assets/icon/ai/code.png",
  ),
  TaskModel(
    title: "UX/UI",
    description: "Let A.I help you improve your user experience.",
    image: "assets/icon/ai/redux.png",
  ),
  TaskModel(
    title: "M.L Engineer",
    description:
        "Communicate with an A.I machine learning engineer to extend your expertise.",
    image: "assets/icon/ai/engine.png",
  ),
];

List<TaskModel> gameTasks = [
  TaskModel(
    title: "Fun",
    description: "Play text based games",
    image: "assets/icon/ai/park.png",
  ),
  TaskModel(
    title: "Skills",
    description: "Learn how to improve your gaming skills.",
    image: "assets/icon/ai/cricket.png",
  ),
  TaskModel(
    title: "Mobile games",
    description: "Explore a list of the top mobile games.",
    image: "assets/icon/ai/pad.png",
  ),
  TaskModel(
    title: "A.I Gamer",
    description: "Have all your gaming questions answered.",
    image: "assets/icon/ai/die.png",
  ),
];

Map<String, List<TaskModel>> tasksForAiList = {
  "Online World": tasksForAiOnlineWorld,
  "Communications": communicationsTasks,
  "Education": educationTasks,
  "Fun": funTasks,
  "Work": workTasks,
  "Email": emailTasks,
  "Marketing": emailLetterTasks,
  "Ideas": ideasTasks,
  "Health": healthTasks,
  "Coding": codingTasks,
  "Gaming": gameTasks,
};
