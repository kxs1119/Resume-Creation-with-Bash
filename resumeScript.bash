#!/bin/bash

# Getting the information from the user 
echo " Hello! Welcome to Resume Creation!"



# Creating an intro 
echo "What is your name?" 
read name

echo "What is your email" 
read emailAddress

echo "What is your phone number?"
read phoneNumber

size=3
skillSize=6

# Creating the education section
echo "What school did you attend?"
read schoolAttended    # school variable

echo "List a skill: "
# Creating the bullet points with no more than 3 bullet points 
for ((i=0; i<$size;i++))
do
    read schoolBulletPoint

done

# Creating the Work History Section 
echo "Where have you worked? " 
read experience

# Creating the bullet points with no more than 3 bullet points
echo "List bullet point indicating your experience: "
for ((i=0; i<$size;i++))
do
    
    read experienceBulletin

done

# Creating Skills Section
echo "List bullet point indicating your skillset: "
#? Need to add a test case if the user just presses a blank space
for ((i=0; i<=$skillSize;i++))
do
   read skills

done

# Create a Development [volunteer work] section
echo "Where have you volunteered"
read volunteerWork

echo "List bullet point indicating your volunteer work:  "
for ((i=0; i<=$size;i++))
do
   read volunteerWork

done

# Combine all sections 
header="$name\n\n"
header+="Contact Information:\nEmail: $emailAddress\nPhone: $phoneNumber\n\n"
header+="Education:$schoolAttended\n"

resume="$header"

# Adding eduction 
resume+="Education:\n$schoolAttended\n"
for ((i=0; i<$size;i++))
do
    resume+="* $schoolBulletPoint"
done

# Adding work History
resume+="Work Experience:\n$experience\n"
for ((i=0; i<$size;i++))
do
    resume+="* $experienceBulletin\n"
done
# Adding skills
resume+="Skills:\n"
for ((i=0; i<$size;i++))
do
    resume+="* $skills\n"
done
# Adding volunteer work 
resume+="Volunteer Work:\n"
for ((i=0; i<$size;i++))
do
    resume+="* $volunteerWork\n"
done

# Print/Save document
echo -e "$resume" | pandoc -o /home/rocky/cpsc207/resumeBuilder
# Convert the resume to PDF and export 
echo -e "$resume" | pandoc -o "$name.pdf"

