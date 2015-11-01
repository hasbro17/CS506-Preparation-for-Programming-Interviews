# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'date'


users_list = [
	#[username, email, simple_password, salt, first_name, last_name, join_date, company, git_accnt, fb_accnt, resume_pdf, profile_pic]
  [ "haseeb", "hasbro17@gmail.com", "haseeb_password", BCrypt::Engine.generate_salt, "Haseeb", "Tariq", Date.new(2014,8,20), "Some Company", "https://github.com/hasbro17", "https://www.facebook.com/hasbro17", nil, nil ],
  [ "jacob", "jacobwurtz@gmail.com", "jacob_password", BCrypt::Engine.generate_salt, "Jacob", "Wurtz", Date.new(2015,4,20), "Another Company", "https://github.com/JacobWurtz", "https://www.facebook.com/", nil, nil ]
]


users_list.each do |username, email, simple_password, salt, first_name, last_name, join_date, company, git_accnt, fb_accnt, resume_pdf, profile_pic |
  #Simply hash the password without a salt for now, can add salt field later
  encrypt_pass = BCrypt::Engine.hash_secret(simple_password, salt)
  User.create( username: username, email: email, hashed_password: encrypt_pass, 
  	first_name: first_name, 
	last_name: last_name, join_date: join_date, company: company, 
	git_accnt: git_accnt, fb_accnt: fb_accnt, resume_pdf: resume_pdf, profile_pic: profile_pic, salt: salt )
  
end


#Seed problems
problems_list = [
	#[problem_title, problem_area, total_score, problem_description, input_description, output_description, sample_input, sample_output, accomplish_rate, solution_file, difficulty_level],#
	

	#Picked from:https://www.hackerrank.com/challenges/insert-a-node-at-a-specific-position-in-a-linked-list
	["Insert a node at a specific position in a linked list",

	"Linked Lists",
	 
	 100, 
	 
	 "You’re given the pointer to the head node of a linked list, an integer to add to the list and the position at which the integer must be inserted. Create a new node with the given integer, insert this node at the desired position and return the head node. A position of 0 indicates head, a position of 1 indicates one node away from the head and so on. The head pointer given may be null meaning that the initial list is empty.",
	 
	 "You have to complete the Node* Insert(Node* head, int data, int position) method which takes three arguments - the head of the linked list, the integer to insert and the position at which the integer must be inserted. You should NOT read any input from stdin/console. position will always be between 0 and the number of the elements in the list (inclusive).",
	 
	 "Insert the new node at the desired position and return the head of the updated linked list. Do NOT print anything to stdout/console.",
	 
	 "NULL, data = 3, position = 0
3 --> NULL, data = 4, position = 0",
	 
	 "3 --> NULL 
4 --> 3 --> NULL",

	 0,

	 nil,

	 "Easy" ],


	 ["Merge two sorted linked lists",

	  "Linked Lists",

	  100,

	  "You’re given the pointer to the head nodes of two sorted linked lists. The data in both lists will be sorted in ascending order. Change the next pointers to obtain a single, merged linked list which also has data in ascending order. Either head pointer given may be null meaning that the corresponding list is empty.",

	  "You have to complete the Node* MergeLists(Node* headA, Node* headB) method which takes two arguments - the heads of the two sorted linked lists to merge. You should NOT read any input from stdin/console.",

	  "Change the next pointer of individual nodes so that nodes from both lists are merged into a single list. Then return the head of this merged list. Do NOT print anything to stdout/console.",

	  "1 -> 3 -> 5 -> 6 -> NULL
2 -> 4 -> 7 -> NULL
15 -> NULL
12 -> NULL
NULL 
1 -> 2 -> NULL",

	  "1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7
12 -> 15 -> NULL
1 -> 2 -> NULL",

	  0,
	  
	  nil,

	  "Medium"],



	 ["Detect Cycle",
	  
	  "Linked Lists",
	  
	  100,
	  
	  "You’re given the pointer to the head node of a linked list. Find whether the list contains any cycle (or loop). A linked list is said to contain cycle if any node is re-visited while traversing the list. The head pointer given may be null meaning that the list is empty.",
	  
	  "You have to complete the int HasCycle(Node* head) method which takes one argument - the head of the linked list. You should NOT read any input from stdin/console. Number of nodes in a linked list doesn't exceed 100.",

	  "Check whether the linked list has a cycle and return 1 if there is a cycle. Otherwise, return 0. Do NOT print anything to stdout/console.",
	  
	  "1 --> NULL
1 --> 2 --> 3
      ^     |
      |     |
       ----- ",
	  
	  "0
1",

	  0,

	  nil,
	  
	  "Hard"],


	 ["Binary Search Tree : Insertion",
	  
	  "Trees",
	  
	  100,
	  
	  "You are given a pointer to the root of a binary search tree and a value to be inserted into the tree. Insert this value into its appropriate position in the binary search tree and return the root of the updated binary tree. You just have to complete the function.",
	  
	  "You are given a function,

node * insert (node * root ,int value)
{

}
node is defined as :

struct node
{
int data;
node * left;
node * right;
}node;",


	  "Return the root of the binary search tree after inserting the value into the tree.",

	  "        4
       / \
      2   7
     / \
    1   3
    The value to be inserted is 6.",
	  
	  "         4
       /   \
      2     7
     / \   /
    1   3 6",
	  
	  0,
	  
	  nil,

	  "Easy"]

]

problems_list.each do | problem_title, problem_area, total_score, problem_description, input_description, output_description, sample_input, sample_output, accomplish_rate, solution_file, difficulty_level |
	Problem.create(problem_title: problem_title, problem_area: problem_area, total_score: total_score, problem_description: problem_description,
	 input_description: input_description, output_description: output_description, sample_input: sample_input,
	  sample_output: sample_output, accomplish_rate: accomplish_rate, solution_file: solution_file, difficulty_level: difficulty_level)
end


#Seed jobs
jobs_list = [

	#[job_title, job_status, num_views, date_posted, job_description, skills_required, job_type, role_type, location, company_name, company_logo_image]

	["Senior Full-Stack Web Developer",
	"Open",
	3,
	Date.new(2015,10,24),
	"Xometry is seeking a senior full-stack web developer to conceptualize, build, and maintain a state of the art customer-facing website and API. This role is key in integrating internet technology with the manufacturing process to give customers digital access to our advanced prototyping and manufacturing capabilities.
Duties will include:
• Working closely with the rest of the software development team to maintain a website for customers to upload designs, receive instant quotes, and place orders.
• Build, maintain, and connect our website to a RESTful API to our proprietary quoting and assessment software.
• Build automated regression tests and benchmarks for the API and website.
• Develop best practices for maintaining modern web applications.",
	
	"• Bachelors degree in Computer Science, Applied Math, Engineering or Physics
• 3+ years of experience building live web applications
• Experience with maintaining web applications that regularly receive traffic of at least 1,000 visitors per day
• Fluency in HTML, CSS, Python, JavaScript and jQuery
• Proficiency with MongoDB
• Experience with Flask and Angular.JS preferred
• Eagerness to gain proficiency in the latest web technologies
• Experience with both building and consuming RESTful APIs
• Demonstrated ability to efficiently solve problems and debug code
• A portfolio demonstrating clean and compliant code
• Familiarity with automated unit/regression testing and continuous integration
• Familiarity with versioning systems such as Git
• Familiarity with agile software development methodologies",
	"Full-Time",
	"Full-Stack",
	"Gaithersburg, MD",
	"Xometry",
	nil],
	

	["Software Engineer",
	"Open",
	7,
	Date.new(2015,9,22),
	"Role & Responsibilities
● The 4G/LTE Mobility group is looking for a motivated individual who can contribute towards software development in this growing field. You will get to work on state-of-the-art 4G/LTE technology. This technology is deployed on Cisco ISR products. As software engineer working on 4G LTE products you will design and develop LTE solutions that will drive the demand and satisfy wide range of customers.",
	"Minimum Qualifications
● BS CS/EE or equivalent experience
● Proficiency in C
● Thorough knowledge of embedded software development
● ability to work on device drivers

Desired Skills
● Thorough in embedded programming environment and C. 
● Ability to understand a complex problem and work on a small section of the problem. 
● Ability to generate specifications for smaller part of the bigger problem. 
● Cisco iOS knowledge is preferable but not a must. ",
	"Full-Time",
	"Sofware-Engineer",
	"San Jose, CA",
	"Cisco Systems",
	nil],


	["Applications Engineer (iOS)",
	"Open",
	13,
	Date.new(2015,6,12),
	"• Responsible for ToolKit Packaging.
• Verification of Toolkit Requirements.
• Co-ordinating extended documentation Version/Release management of the ToolKits.
• Distribution to Portal hosting all the deliverables.
• Validation of Bugs/Deep Analysis for inbound problems with Integrations team.
• Test harness management (hosting, requirements definition & availability to team).
• White box testing.
• Working with internal engineering and other QA teams to deliver robust toolkits to GoPro’s partner.
• Providing feedback and improvements for seamless integration experience.",
	" Masters degree in Computer Science
• 3+ years of experience as a developer, QA Engineer or Test Engineer
• Strong analytical skills - a problem solving attitude
• Strong communication (written and verbal) skills
• Self-motivated and willing to work as independent contributor
• API automation testing including working experience with unit test automation frameworks
• Experience with:
- Application development for iOS devices
- BLE (Bluetooth Low energy), working with sensors and telemetry
• Experience with both writing and executing automated test scripts
• Experience with open source test tools
• Hands-on experience with scripting in at least one of the following: Ruby, Shell, Perl, Python, C, C++, C#. 
• Familiarity with XML, JSON and REST-based APIs
• Experience using test reporting & JIRA
• Expertise in Objective-C or Java and developing native mobile apps
• Ability to quickly learn and apply new technologies and methodologies - Ability to manage multiple projects and issues concurrently
• Have some familiarity with Linux embedded programming
• Experience working with external partners and suppliers",
	"Full-Time",
	"Software-Engineering",
	"San Mateo, CA",
	"GoPro",
	nil],


	["Security/Big-Data Research Internship",
	"Open",
	60,
	Date.new(2015,10,12),
	"Our security group has several intern openings in the areas of systems and security with a focus on big-data enabled enterprise security for advanced persistent threats (APT). We have built a surveillance system that collects the data of system activities for various security analysis. To facilitate the querying and management of such large amount of the data, we plan to build a novel querying system that provides user-friendly language to describe security-related activities and efficient query processing on the data.",
	"The internship typically produces high quality publications, patents, and the implementation of a research prototype. Our previously internships have resulted in publications in top conferences such as ACM CCS, NDSS, ACM SIGMETIRCS, etc.
Candidates should be pursuing a PhD or be engaged in active research and have strong system design and building skills. We have multiple intern positions that cover a diverse set of research directions. Previously hands-on experiences on any of the following topics are a plus.
- Big-data platform design and implementation
- Big-data storage/database systems, data management and data engineering
- Program analysis and domain specific language design
- System programming, kernel instrumentation, kernel event tracing
- Security big-data analytics (data mining, machine learning for security)",
	"Internship",
	"Data Science/Engineering",
	"Princeton, NJ",
	"NEC Laboratories America",
	nil]
]


jobs_list.each do | job_title, job_status, num_views, date_posted, job_description, skills_required, job_type, role_type, location, company_name, company_logo_image |
	Job.create(job_title: job_title, job_status: job_status, num_views: num_views, date_posted: date_posted, job_description: job_description,
	 skills_required: skills_required, job_type: job_type, role_type: role_type, location: location, company_name: company_name, company_logo_image: company_logo_image)
end