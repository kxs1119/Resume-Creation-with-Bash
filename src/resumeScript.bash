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
header="# **$name**\n\n"    # ? Need to make name bold and centered
header+="## *Contact Information:*\n"
header+="**Email Address**: $emailAddress|\n **Phone**: $phoneNumber|\n **LinkedIn**: $linkedin\n\n"

size=3
attempts=0
maxAttempts=3

# Creating the education section
echo "What school did you attend?"
read schoolAttended    # school variable

while [ $attempts -lt $maxAttempts ]; do
    echo "How many skills would you like to list for school?"
    read school_skillSize
    if [ $school_skillSize -eq 0 ] || [ $school_skillSize == " " ]; then
        echo "Enter a valid amount of skills"
    else
        # break if a valid # of skills
        break
    fi
    # increment the amount of attempts
    ((attempts++))
done

echo "List skills you've learned from school: "
# Creating the bullet points with no more than 3 bullet points
for ((i=0; i<$school_skillSize; i++))
do
    read schoolBulletPoint
done

# Creating the Work History Section
echo "Where have you worked? "
read experience

# Creating the bullet points with no more than 3 bullet points
echo "List bullet point indicating your experience: "
for ((i=0; i<$size; i++))
do
    read experienceBulletin
done

attempts=0 # Resetting attempts for the next section

while [ $attempts -lt $maxAttempts ]; do
    echo "How many skills would you like to list? "
    read technical_skillSize
    if [ $technical_skillSize -eq 0 ] || [ $technical_skillSize == " " ]; then
        echo "Enter a valid amount of skills: \n"
    else
        # break if a valid # of skills
        break
    fi
    # increment the amount of attempts
    ((attempts++))
done

# Creating Skills Section
echo "List bullet point indicating your skillset "
#? Need to add a test case if the user just presses a blank space
for ((i=0; i<$technical_skillSize; i++))
do
    read skills
done

# Create a Development [volunteer work] section
echo "Where have you volunteered"
read volunteerLocation
echo "List bullet point indicating your volunteer work:  "
for ((i=0; i<$size; i++))
do
    read volunteerWork
done

resume="$header"

# Adding education
resume+="### **Education**:\n\n"
resume+="$schoolAttended\n\n"
for ((i=0; i<$skillSize; i++))
do
    resume+="* $schoolBulletPoint\n\n"
done

# Adding work History
resume+="### **Work Experience**:\n"
resume+="$experience\n"
for ((i=0; i<$size; i++))
do
    resume+="* $experienceBulletin\n\n"
done

# Adding skills
resume+="### **Technical Skills**:\n\n"
for ((i=0; i<$size; i++))
do
    resume+="* $skills\n\n"
done

# Adding volunteer work
resume+="### **Professional Development**:\n\n"
resume+="$volunteerLocation\n"
for ((i=0; i<$size; i++))
do
    resume+="* $volunteerWork\n\n"
done

# Adding a section to ask the user what job they are applying for.
# This will save as the pdf title
echo "What job are you applying for?"
read nameofJob

# Convert the resume to markdown (.md) and export
echo -e "$resume" > "/home/rocky/cpsc207/resume/markdown_versions/$nameofJob.md"
# once convert to markdown file, then convert to a pdf
pandoc -s "/home/rocky/cpsc207/resume/markdown_versions/$nameofJob.md" -o "/home/rocky/cpsc207/resume/$nameofJob.pdf"