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

echo "What is your LinkedIn?"
read linkedin

# Combine all sections 
header="\033[1m$name\033[0m\n\n"    # ? Need to make name bold and centered
header+="Contact Information:\n\n"
header+="Email Address: $emailAddress\n|Phone: $phoneNumber\n|LinkedIn: $linkedin"

size=3
skillSize=6

# Creating the education section
echo "What school did you attend?"
read schoolAttended    # school variable

echo "List skills you've learned from school: "
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
    
    read experienceBulletin\n
    
done

# Creating Skills Section
echo "List bullet point indicating your skillset[type 'q' to quit]: "
#? Need to add a test case if the user just presses a blank space
for ((i=0; i<=$skillSize;i++))
do
   read skills\n
done

# Create a Development [volunteer work] section
echo "Where have you volunteered"
read volunteerLocation
echo "List bullet point indicating your volunteer work:  "
for ((i=0; i<=$size;i++))
do
   read volunteerWork\n

done

resume="$header"

# Adding eduction 
resume+="Education:\n\n"
resume+="$schoolAttended\n\n"
for ((i=0; i<$size;i++))
do
    resume+="* $schoolBulletPoint\n\n"
done

# Adding work History
resume+="Work Experience:\n"
resume+="$experience\n"

for ((i=0; i<$size;i++))
do
    resume+="$experienceBulletin\n\n"
done
# Adding skills
resume+="Skills:\n\n"
for ((i=0; i<$size;i++))
do
    resume+="* $skills\n\n"

done
# Adding volunteer work 
resume+="Professional Development:\n\n"
resume+="$volunteerLocation\n"
for ((i=0; i<$size;i++))
do
    resume+="* $volunteerWork\n\n"

done

# Adding a section to ask the user what job they are applying for. 
# This will save as the pdf title
echo "What job are you applying for?"
read nameofJob

# Print/Save document
echo -e "$resume" | pandoc -o /home/rocky/cpsc207/resumeBuilder
# Convert the resume to PDF and export 
echo -e "$resume" | pandoc -o "$nameofJob.pdf"

