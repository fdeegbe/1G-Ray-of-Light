def create_transcript_file(student_info, transfer_credits, past_courses, current_courses):
    heading = """\
                                   UNIVERSITY OF MARYLAND
                                        COLLEGE PARK
                                   Office of the Registrar
                                   College Park, MD 20742
                                   UNOFFICIAL TRANSCRIPT
                                FOR ADVISING PURPOSES ONLY 
                                     As of:  {date}
{student_name}
E-Mail: {student_email}
Major: {student_major}
{student_status}                    {student_degree}
{student_gened}                    Current Status: {student_status_date}
{transfer_credits}
** Transfer Credit Information **                   ** Equivalences **
################################ PAST COURSE INFORMATION ####################""".format(
        date=student_info['date'],
        student_name=student_info['name'],
        student_email=student_info['email'],
        student_major=student_info['major'],
        student_status=student_info['status'],
        student_degree=student_info['degree'],
        student_gened=student_info['gened'],
        student_status_date=student_info['status_date'],
        transfer_credits=transfer_credits
    )

    with open("transcript.txt", "w") as file:
        file.write(heading)
        
        for semester, courses in past_courses.items():
            file.write("\n" + semester + "\n")
            for course in courses:
                file.write(course + "\n")
        
        file.write("\n** Current Course Information **\n")
        for course in current_courses:
            file.write(course + "\n")

# Student information
student_info = {
    'name': 'Deegbe, Frank Delali',
    'email': 'fdeegbe1@terpmail.umd.edu',
    'major': 'Computer Science',
    'status': 'Freshman - First Time',
    'degree': 'Undergraduate Degree Seeking',
    'gened': 'GenEd Program',
    'status_date': 'Registered Fall 2023',
    'date': '10/09/23'
}

# Transfer credit information
transfer_credits = "Transcripts received from the following institutions:\n\nAdvanced Placement Exam                  on 07/16/22\nMontgomery College                       on 08/21/22"

# Past course information
past_courses = {
    'Fall 2022': [
        "MAJOR: COMPUTER SCIENCE          COLLEGE: COMP, MATH, & NAT SCI",
        "CMSC216  INTRO TO CMPTR SYSTEMS   B+ 4.00  4.00 13.20",
        "FMSC341  PERSNAL & FAMILY FINANCE A- 3.00  3.00 11.10 DSSP",
        "HACS100  FND IN CYBERSECURITY I   A+ 2.00  2.00  8.00",
        "INST123  DATABASES FOR ALL        A+ 3.00  3.00 12.00 DSSP",
        "** Semester Academic Honors **",
        "Semester:       Attempted 12.00; Earned 12.00; QPoints   44.30; GPA 3.691",
        "UG Cumulative:            12.00;        12.00;           44.30;     3.691"
    ],
    'Spring 2023': [
        "MAJOR: COMPUTER SCIENCE          COLLEGE: COMP, MATH, & NAT SCI",
        "CMSC330  ORGNZTN PROGM LANG       A  3.00  3.00 12.00",
        "CMSC351  ALGORITHMS               B  3.00  3.00  9.00",
        "EDHD320  DEVELMNT THRU LIFE       A  3.00  3.00 12.00 DSHS",
        "HACS101  APPLIED CYBERSECURITY I  A- 2.00  2.00  7.40",
        "STAT400  APPLIED PROB & STAT I    A- 3.00  3.00 11.10",
        "** Semester Academic Honors **",
        "Semester:       Attempted 14.00; Earned 14.00; QPoints   51.50; GPA 3.678",
        "UG Cumulative:            26.00;        26.00;           95.80;     3.684"
    ]
}

# Current course information
current_courses = [
    "Fall 2023      Course   Sec  Credits  Grd/ Drop   Add      Drop    Modified GenEd",
    "                                      Meth /Add  Date      Date      Date",
    "               ======== ==== =======  ==== ==== ======== ========  ======== ==================",
    "               HACS297  0101    3.00  REG  A    08/23/23           08/23/23",
    "               EDHD412  0101    3.00  REG  A    08/23/23           08/23/23 DSHS",
    "               CMSC451  0201    3.00  REG  AW   07/17/23           07/28/23",
    "               MATH401  0201    3.00  REG  DW   05/31/23 07/28/23  07/28/23",
    "               STAT401  0201    3.00  REG  DW   05/23/23 08/23/23  08/23/23",
    "               HACS200  0101    2.00  REG  A    05/
