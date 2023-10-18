import os
import random
import string
from datetime import date, timedelta
NUM_FILES = 52



common_first_names = [
    "Smith", "Johnson", "Brown", "Taylor", "Lee", "Wilson", "Davis", "Evans", "Harris", "Clark",
    "Roberts", "White", "Martin", "Anderson", "Wright", "Walker", "Miller", "Thompson", "Hall", "Jackson",
    "Williams", "Moore", "Nelson", "Davis", "Baker", "Wilson", "Harris", "Young", "Lee", "Hill",
    "King", "Turner", "Adams", "Thomas", "Carter", "Mitchell", "Scott", "Parker", "Edwards", "Stewart",
    "Morris", "Collins", "Cook", "Hall", "Bell", "Ross", "Lewis", "Wood", "Scott", "Jenkins",
    "Peterson", "Cox", "Gray", "Reed", "Murphy", "Hayes", "Dixon", "Murray", "Jennings", "Bishop",
    "Bryant", "Griffin", "Mendoza", "Fowler", "Vaughan", "Carpenter", "Ramirez", "Fields", "Crawford", "Watkins",
    "Rice", "Barnes", "Graham", "West", "Sullivan", "Long", "Newton", "Gibson", "Bryant", "Black",
    "Olson", "Sanders", "Kelley", "Mills", "Fleming", "Gonzales", "Elliott", "Harper", "Reyes", "Frazier",
    "Wheeler", "King", "Snyder", "Webb", "Richards", "Burton", "Chapman", "Coleman", "Warren", "Henderson",
    "Adams", "Wells", "Gomez", "Lawrence", "Richardson", "McDonald", "Perez", "Mitchell", "Weaver", "Duncan",
    "Simmons", "Fuller", "Kennedy", "Riley", "Fisher", "Morgan", "Hudson", "Burns", "Lawson", "Harrison",
    "Reed", "Barnett", "Fields", "Garcia", "Ortiz", "Graves", "Cohen", "Hartman", "Holland", "Johnston",
    "Rojas", "Barton", "Salazar", "Brewer", "Romero", "Marshall", "Fleming", "Tucker", "Hayes", "Hawkins",
    "Wang", "Kim", "Patel", "González", "Kumar", "Nguyen", "Hernández", "Chen", "Gómez", "Ahmed",
    "López", "Kaur", "Rodríguez", "Li", "Suzuki", "Sánchez", "Saito", "Singh", "García", "Martínez",
    "Ito", "Choi", "Yamamoto", "Kawasaki", "Gupta", "Fernández", "Das", "Nakamura", "Lam", "Tan",
    "Chowdhury", "Alvarez", "Hassan", "Kimura", "Sakurai", "Sinha", "Gao", "Lee", "Lima", "Chaudhary",
    "Díaz", "Fujita", "Ma", "Ahmad", "Ali", "Yilmaz", "Chong", "Nakajima", "Saito", "Duong",
    "Das", "Ibrahim", "Gómez", "Han", "Hashimoto", "Inoue", "Yoo", "Chávez", "Kobayashi", "Wong",
    "Jain", "Fernández", "Vasquez", "Srivastava", "Chen", "Nishimura", "Kim", "Thakur", "Mendoza", "Ferreira",
    "Ng", "Agarwal", "Ngo", "Ghosh", "Rahman", "Gautam", "Yusuf", "Santos", "Miyamoto", "Villa",
    "Zhou", "Chen", "Lai", "Guo", "Lima", "Khan", "Chang", "Santos", "Perera", "Ibrahim",
    "Ali", "López", "Gomes", "Mendoza", "Nishimura", "Singh", "Ghosh", "Huang", "Santos", "Park",
    "Chowdhury", "Das", "Kobayashi", "Ahmed", "González", "Yamada", "Jain", "Chaudhary", "Yusuf", "Yoo",


]

common_last_names = [
    "Smith", "Johnson", "Brown", "Taylor", "Lee", "Wilson", "Davis",
    "Evans", "Harris", "Clark", "Moore", "Young", "Martin", "Anderson",
    "White", "Thompson", "Jackson", "Harris", "Turner", "Hall", "Wright",
    "Walker", "Edwards", "Collins", "Parker", "Murphy", "Morris", "Cook",
    "Rogers", "Green", "Wood", "Kelly", "Sullivan", "Bennett", "Russell",
    "Reed", "Stewart", "Ward", "Mitchell", "Scott", "Watson", "Price",
    "Bailey", "Morgan", "Roberts", "Sanders", "Ross", "Powell", "Perry",
    "Butler", "Barnes", "Ross", "Graham", "Hughes", "Edwards", "Foster",
    "Bryant", "Henry", "Hudson", "Carpenter", "Wells", "Peterson", "Warren",
    "Jenkins", "Fox", "Cunningham", "Gregory", "Garrett", "Simmons", "Snyder",
    "Holmes", "Wagner", "Ellis", "Harrison", "Murray", "Douglas", "Wheeler",
    "Warren", "Price", "Gardner", "Mills", "Nichols", "Knight", "Henderson",
    "Duncan", "Armstrong", "Carr", "Bowman", "Coleman", "Bishop", "Hudson",
    "Chapman", "Reynolds", "Richards", "Gordon", "Berry", "Harper", "Lane",
    "Pierce", "Hicks", "Hunt", "Robertson", "Black", "Holmes", "Rose",
    "Stone", "Dean", "Pierce", "Baldwin", "Price", "Freeman", "James",
    "West", "Carr", "Olson", "Morales", "Larson", "Jordan", "Banks",
    "Myers", "Owens", "Rice", "Fleming", "Fisher", "Fleming", "Ruiz",
    "Perez", "Martinez", "Sanchez", "Gomez", "Ramirez", "Gonzalez",
    "Lopez", "Castillo", "Vasquez", "Sandoval", "Reyes", "Chavez",
    "Delgado", "Fernandez", "Gutierrez", "Guerrero", "Mendoza",
    "Ortega", "Moreno", "Navarro", "Pena", "Silva", "Torres",
    "Rivas", "Rodriguez", "Alvarez", "Santos", "Romero",
    "Santana", "Valdez", "Salazar", "Reyna", "Marquez",
    "Herrera", "Soto", "Luna", "Vega", "Munoz", "Serrano"
]

common_majors = {
    "Computer Science": ["CMSC101 Intro to Programming", "CMSC202 Data Structures", "CMSC330 Computer Organization", "CMSC351 Algorithms", "CMSC420 Machine Learning"],
    "Engineering": ["ENGR101 Engineering Basics", "ENGR205 Electrical Circuits", "ENGR301 Thermodynamics", "ENGR402 Control Systems", "ENGR450 Aerospace Engineering"],
    "Biology": ["BIOL101 Intro to Biology", "BIOL203 Genetics", "BIOL402 Microbiology", "BIOL430 Cell Biology", "BIOL460 Ecology"],
    "Psychology": ["PSYC100 Intro to Psychology", "PSYC301 Cognitive Psychology", "PSYC402 Abnormal Psychology", "PSYC450 Clinical Psychology", "PSYC480 Behavioral Neuroscience"],
    "Business Administration": ["BADM101 Intro to Business", "BADM202 Marketing Principles", "BADM305 Financial Management", "BADM401 Business Ethics", "BADM450 Strategic Management"],
    "Economics": ["ECON101 Principles of Economics", "ECON302 Macroeconomics", "ECON401 Econometrics", "ECON450 International Trade", "ECON480 Development Economics"],
    "English": ["ENGL101 Composition", "ENGL203 Shakespearean Literature", "ENGL402 Modern American Poetry", "ENGL450 Romantic Literature", "ENGL480 Postcolonial Literature"],
    "History": ["HIST101 World History", "HIST205 European History", "HIST301 American Civil War", "HIST450 Ancient History", "HIST480 Modern East Asia"],
    "Mathematics": ["MATH101 Algebra", "MATH202 Calculus", "MATH401 Advanced Probability", "MATH450 Linear Algebra", "MATH480 Differential Equations"],
    "Nursing": ["NURS101 Nursing Fundamentals", "NURS202 Pediatric Nursing", "NURS405 Geriatric Care", "NURS450 Critical Care Nursing", "NURS480 Nursing Research"],
    "Political Science": ["POLS101 Introduction to Political Science", "POLS202 Comparative Politics", "POLS405 International Relations", "POLS450 Political Theory", "POLS480 Environmental Politics"],
    "Sociology": ["SOC101 Intro to Sociology", "SOC203 Social Inequalities", "SOC401 Sociology of Deviance", "SOC450 Globalization", "SOC480 Urban Sociology"]
}

electives_list = [
    "ART101 Introduction to Art", "MUSC202 Music Theory", "CHEM101 General Chemistry", "PHYS201 Physics I",
    "COMM301 Public Speaking", "PHIL201 Ethics", "HIST202 European History II", "PSYC201 Social Psychology",
    "ENGL305 Creative Writing", "MATH301 Probability and Statistics", "ECON305 Microeconomics", "BIOL305 Environmental Biology",
    "BADM302 Business Law", "SOCI305 Gender Studies", "PHYS305 Quantum Mechanics", "CHEM305 Organic Chemistry",
    "POLS305 Human Rights", "ART305 Modern Art", "MUSC305 Jazz History", "ENGR305 Environmental Engineering",
    "PSYC305 Child Development", "PHIL305 Philosophy of Mind", "HIST305 African History", "COMM305 Mass Communication",
    "BIOL405 Human Anatomy", "ECON405 Economic Development", "SOCI405 Social Change", "ENGR405 Robotics",
    "CHEM405 Analytical Chemistry", "POLS405 Comparative Government", "ENGL405 Shakespearean Drama", "ART405 Contemporary Art",
    "MATH405 Number Theory", "PHYS405 Astrophysics", "PSYC405 Abnormal Child Psychology", "PHIL405 Existentialism"
]



if not os.path.exists("/home/student_transcripts"):
    os.makedirs("/home/student_transcripts")

# Function to generate random data for the files


def generate_random_data():
    first_name = random.choice(common_first_names)
    last_name = random.choice(common_last_names)
    student_name = f"{first_name} {last_name}"
    student_email = ''.join(random.choices(string.ascii_lowercase, k=8))
    student_email_masked = student_email[:random.randint(1, len(
student_email)//2)] + '*'*random.randint(3, 6) + "@umd.edu"
    student_major = random.choice(list(common_majors.keys()))
    student_status = random.choice(
        ["Freshman", "Sophomore", "Junior", "Senior"])
    student_degree = random.choice(
        ["Undergraduate Degree Seeking", "Graduate Degree Seeking"])
    student_gened = "GenEd Program"
    status_date = 'Registered Fall 2023'

    # Add classes associated with the major
    major_classes = random.sample(common_majors[student_major], random.randint(2, 3))
    
    # Add 1 or 2 elective classes
    elective_classes = random.sample(electives_list, random.randint(2,2))

    today = date.today()
    past_date = today - timedelta(days=random.randint(365, 730))  # 1 to 2 years ago
    status_date = past_date.strftime("%m/%d/%y")
    
    class_information = "\n".join([f"     {course}" for course in major_classes + elective_classes])
    return f"""\
                                   UNIVERSITY OF MARYLAND
                                        COLLEGE PARK
                                   Office of the Registrar
                                   College Park, MD 20742
                                   UNOFFICIAL TRANSCRIPT
                                FOR ADVISING PURPOSES ONLY 
                                     As of:  {status_date}
{student_name}
E-Mail: {student_email_masked}
Major: {student_major}
{student_status} - {student_degree}
{student_gened}                    Current Status: {status_date}
################################ PAST COURSE INFORMATION ####################
{class_information}
"""


for i in range(NUM_FILES):
    filename = f"/home/student_transcripts/transcript_{random.randint(1, 100)}{i+1}{random.randint(1, 100)}.txt"
    with open(filename, "w") as file:
        file.write(generate_random_data())
