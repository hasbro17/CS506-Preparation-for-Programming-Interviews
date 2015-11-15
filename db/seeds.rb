# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'date'
require_relative "../enums.rb"


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



#supported_langs[]
supported_langs_P1 = [
	Enums::languages_enum["C/C++"],
	Enums::languages_enum["Java"],
	Enums::languages_enum["Python"]
]



#Skeleton code to prefill box

skeleton_code_toy = [
	#C/C++
	"#include <iostream>

int main()
{
	std::cout << \"Hello World\\n\";
	return 0;
}",
	#Java
	"class HelloWorld {

    public static void main(String[] args) {
        // Prints \"Hello, World\" to the terminal window.
        System.out.println(\"Hello, World\");
    }

}",
	#Python
	"print \"Hello World\""

]

skeleton_code_P1 = [
	"/*
  Insert Node at the end of a linked list 
  head pointer input could be NULL as well for empty list
  Node is defined as 
  struct Node
  {
     int data;
     struct Node *next;
  }
*/
Node* Insert(Node *head,int data)
{
  // Complete this method
}
",
	
	"/*
  Insert Node at the end of a linked list 
  head pointer input could be NULL as well for empty list
  Node is defined as 
  class Node {
     int data;
     Node next;
  }
*/
Node Insert(Node head,int data) {
// This is a \"method-only\" submission. 
// You only need to complete this method. 
  
}
",
	
	"\"\"\"
 Insert Node at the end of a linked list 
 head pointer input could be None as well for empty list
 Node is defined as
 
 class Node(object):
 
   def __init__(self, data=None, next_node=None):
       self.data = data
       self.next = next_node
 
 return back the head of the linked list in the below method
\"\"\"

def Insert(head, data):
"
	
]

solution_code_toy = [
	#C/C++
	"#include <iostream>

int main()
{
	std::cout << \"Hello World\\n\";
	return 0;
}",
	#Java
	"class HelloWorld {

    public static void main(String[] args) {
        // Prints \"Hello, World\" to the terminal window.
        System.out.println(\"Hello, World\");
    }

}",
	#Python
	"print \"Hello World\""
]

#Solution for methods
solution_code_P1 = [

	#C-Solution#
	"Node* Insert(Node *head,int data)  
 {  
  // Complete this method  
   Node *cur= new Node;  
   cur->data = data;  
   cur->next = NULL;  
   if(head==NULL){  
     head = cur;  
   }else{  
     Node *curr = new Node;  
     curr = head;  
     while(curr->next !=NULL){  
       curr = curr->next;  
     }  
     curr->next = cur;  
   }  
     return head;  
 }",

	#Java
	"Node Insert(Node head,int data) {
    if (head == null){
        head = new Node();
        head.data = data;
    }
    else {
        Node node = head;
        while (node.next != null){
            node = node.next;
        }
        node.next = new Node();
        node.next.data = data;
    }
    return head;
}",

	#No Python added yet
	"def Insert(head, data):
    runner = head
    if head == None:
        head = Node(data)
        return head
    
    while runner.next != None:
        runner = runner.next
    runner.next = Node(data)
    return head"
]

#Will generate this on the fly everytime for now with solution file
expected_stdout_toy = [
	"",
	"",
	""
]

expected_stdout_P1 = [
	"",
	"",
	""
]

#None for this problem
given_stdin_toy = [
	"",
	"",
	""
]

given_stdin_P1 = [
	"",
	"",
	""
]

#Test code prefix

test_prefix_toy = [
	"",
	"",
	""
]

test_prefix_P1 = [
	"#include <stdio.h>
#include <stdlib.h>

struct Node
{
	int data;
	struct Node *next;
};

",
	"class Test {

	class Node {
		int data;
		Node next;
	}

",

	"class Node(object):
    def __init__(self, data=None, next_node=None):
        self.data = data
        self.next = next_node

"
]

test_suffix_toy = [
	"",
	"",
	""
]

test_suffix_P1 = [
	"
int main(){
	Node* head = NULL;
	int numNodes = 4;
	int i;
	for(i=0; i<numNodes; i++){
		head = Insert(head, i);
	}

	Node* runner = head;
	printf(\"%d\",runner->data);
	for(i=1; i<numNodes; i++){
		runner = runner->next;
		printf(\"->%d\", runner->data);
	}
	return 0;
}",

	"
	public static void main (String[] args) throws java.lang.Exception
	{
		// your code goes here
		Test test = new Test();
		Node head = null;
		
		for(int i=0; i<4; i++){
			head = test.Insert(head, i);
		}
		
		System.out.print(head.data);
		for(int i=1; i<4; i++){
			head = head.next;
			System.out.print(\"->\"+head.data);
		}

	}
}",

	"
head = None
for i in range(4):
    head = Insert(head, i)

runner = head
print runner.data,
for i in range(4):
    runner = runner.next
    print \"->\" + str(runner.data),
"
]

problems_list = [
	#[problem_title, problem_area, total_score, problem_description, input_description, output_description, sample_input, sample_output, accomplish_rate, solution_file, difficulty_level #
	# skeleton_code[], supported_langs[], solution_code[], expected_stdout[],
	# given_stdin[], test_prefix[], test_suffix[] ],#
	
	["Hello World Test", 
	Enums::problem_areas_enum["Linked Lists"], 
	100, 
	"Print out \"Hello World\". Write out the entire program with preprocessing directives and main function. For Java do not make the class public. Solution is given in skeleton codes.", 
	"None", 
	"Print out Hello World", 
	"None", 
	"Hello World", 
	0, 
	nil, 
	Enums::problem_difficulty_enum["Easy"],
	skeleton_code_toy,
	supported_langs_P1,
	solution_code_toy,
	expected_stdout_toy,
	given_stdin_toy, 
	test_prefix_toy, 
	test_suffix_toy

	],


	#Picked from:https://www.hackerrank.com/challenges/insert-a-node-at-the-tail-of-a-linked-list
	["Insert a node at the tail of a linked list",

	Enums::problem_areas_enum["Linked Lists"],
	 
	 100,
	 
	 "You’re given the pointer to the head node of a linked list and an integer to add to the list. Create a new node with the given integer, insert this node at the tail of the linked list and return the head node. The head pointer given may be null meaning that the initial list is empty.",
	 
	 "You have to complete the Node* Insert(Node* head, int data) method which takes two arguments - the head of the linked list and the integer to insert. You should NOT read any input from stdin/console.",
	 
	 "Insert the new node at the tail and just return the head of the updated linked list. Do NOT print anything to stdout/console.",
	 
	 "NULL, data = 2 
2 --> NULL, data = 3",
	 
	 "2 -->NULL
2 --> 3 --> NULL",

	 0,

	 nil,

	 Enums::problem_difficulty_enum["Easy"],

	 skeleton_code_P1,
	 supported_langs_P1,
	 solution_code_P1,
	 expected_stdout_P1,
	 given_stdin_P1, 
	 test_prefix_P1, 
	 test_suffix_P1

	 ],


	 ["Merge two sorted linked lists",

	  Enums::problem_areas_enum["Linked Lists"],

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

	  Enums::problem_difficulty_enum["Medium"],

	nil,
	nil,
	nil, 
	nil,
	nil,
	nil,
	nil

	  ],



	 ["Detect Cycle",
	  
	  Enums::problem_areas_enum["Linked Lists"],
	  
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
	  
	  Enums::problem_difficulty_enum["Hard"],

	 nil,
	 nil,
	 nil, 
	 nil,
	 nil,
	 nil,
	 nil

	  ],


	 ["Binary Search Tree : Insertion",
	  
	  Enums::problem_areas_enum["Trees"],
	  
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

	  Enums::problem_difficulty_enum["Easy"],

	 nil,
	 nil,
	 nil, 
	 nil,
	 nil,
	 nil,
	 nil

	]

]

problems_list.each do | problem_title, problem_area, total_score, problem_description, input_description, output_description, sample_input, sample_output, accomplish_rate, solution_file, difficulty_level,
						skeleton_code, supported_langs, solution_code, expected_stdout,
						given_stdin, test_prefix, test_suffix |
	Problem.create(problem_title: problem_title, problem_area: problem_area, total_score: total_score, problem_description: problem_description,
	 input_description: input_description, output_description: output_description, sample_input: sample_input,
	  sample_output: sample_output, accomplish_rate: accomplish_rate, solution_file: solution_file, difficulty_level: difficulty_level,
	  skeleton_code: skeleton_code, supported_langs: supported_langs, solution_code: solution_code, expected_stdout: expected_stdout,
	  given_stdin: given_stdin, test_prefix: test_prefix, test_suffix: test_suffix)
end


#Seed jobs
jobs_list = [

	#[job_title, job_status, num_views, date_posted, job_description, skills_required, job_type, role_type, location, company_name, company_logo_image, job_link]

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
	Enums::job_type_enum["Full Time"],
	Enums::role_type_enum["Full-Stack Developer"],
	"Gaithersburg, MD",
	"Xometry",
	nil,
	["https://www.xometry.com/careers/senior-full-stack-web-developer/"]
	],
	

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
	Enums::job_type_enum["Internship"],
	Enums::role_type_enum["Software Engineer"],
	"San Jose, CA",
	"Cisco Systems",
	nil,
	["https://www.jobs.cisco.com/job/San-Jose-Embedded-Senior-Software-Engineer-CA-95101/271615500/"]
	],


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
	Enums::job_type_enum["Full Time"],
	Enums::role_type_enum["Software Engineer"],
	"San Mateo, CA",
	"GoPro",
	nil,
	["https://www.gopro.com/careers/"]
	],


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
	Enums::job_type_enum["Internship"],
	Enums::role_type_enum["Data Scientist"],
	"Princeton, NJ",
	"NEC Laboratories America",
	nil,
	["http://www.nec-labs.com/working-at-nec-labs/"]
	]
]


jobs_list.each do | job_title, job_status, num_views, date_posted, job_description, skills_required, job_type, role_type, location, company_name, company_logo_image, job_link |
	Job.create(job_title: job_title, job_status: job_status, num_views: num_views, date_posted: date_posted, job_description: job_description,
	 skills_required: skills_required, job_type: job_type, role_type: role_type, 
	 location: location, company_name: company_name, company_logo_image: company_logo_image, job_link: job_link)
end