#! /bin/bash

# Getting the information from the user 
echo " Hello! Welcome to Resume Creation!"


# Creating an intro 
echo "What is your name?" 
read name

echo "What is your email" 
read emailAddress

echo "What is your phone number?"
read phoneNumber

# Creating the education section
echo "What school did you attend? : "
read schoolAttended    # school variable

# Creating the bullet points with no more than 3 bullet points 
for ((i=0; i<3; i=i++))
do
    echo "List a skill: "
    read schoolBulletPoint

fi

# Creating the Work History Section 
echo "Where have you worked"
read experience

# Creating the bullet points with no more than 3 bullet points
echo "List bullet point indicating your experience: "
for ((i=0; i<3; i=i++))
do
    
    read experienceBulletin

fi

# Creating Skills Section
echo "List bullet point indicating your skillsett: "
for ((i=0; i<=6; i=i++))
do
   read skills

fi

# Create a Development [volunteer work] section
echo "Where have you volunteered"

echo "List bullet point indicating your volunteer work:  "
for ((i=0; i<=3; i=i++))
do
   read volunteerWork

fi



