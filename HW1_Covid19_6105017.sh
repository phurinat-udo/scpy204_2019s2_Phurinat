#!/bin/bash

if [ $# -lt 3 ]; then
	echo "Usage: $0 <name> <lastname> <age>"
	exit 1
fi

echo "Your fullname is $1 $2."
echo "Your age is $3."

read -p "What is your physical gender? (Male/Female)" gend
if [ $gend == "Female" -o $gend == "female" -o $gend == "F" -o $gend == "f" ] ; then
	echo "Your gender is female."

elif [ $gend == "Male" -o $gend == "male" -o $gend == "M" -o $gend == "m" ] ; then
	echo "Your gender is male."
else
	echo "Please provide your gender male or female."
	exit 1
fi

echo "Did you go to high risk countries in period of 14 days?"
echo "Here is the high risk countries; China, Taiwan, South_Korea, Japan, Singapore, Italy, Iran, France, Germany, 
	Spain, England, Netherlands, Sweden, Switzerland, Denmark, Norway, USA."

read -p "Answer yes(y) or no(n)." risk

if [ $risk == "y" -o $risk == "Y" -o $risk == "Yes" -o $risk == "yes" -o $risk == "" ] ; then
	echo "Please answer the following questions."
	echo "Do you have fever more than 37.5 degree Celsius (yes/no)?"

	read -p "Answer yes(y) or no(n)." fev
	if [ $fev == "y" -o $fev == "Y" -o $fev == "Yes" -o $fev == "yes" -o $fev == "" ] ; then

		echo "You have fever!"
		echo "Do you have sore throat?"

		read -p "Answer yes(y) or no(n)." sore
		if [ $sore == "y" -o $sore == "Y" -o $sore == "Yes" -o $sore == "yes" -o $sore == "" ] ; then
			echo "You have sore throat!"	
			echo "Do you have dry cough?"

			read -p "Answer yes(y) or no(n)." coug
			if [ $coug == "y" -o $coug == "Y" -o $coug == "Yes" -o $coug == "yes" -o $coug == "" ] ; then
				echo "You have dry cough!"
				echo "You are $1 $2, age $3 years old. Please go to see a doctor right away immediately!! You are at risk of Covid-19"
				exit 0

			elif [ $coug == "No" -o $coug == "no" -o  $coug == "n" -o $coug == "N" ]; then
				echo "Do you have tiredness?"

				read -p "Answer yes(y) or no(n)." tired
				if [ $tired == "y" -o $tired == "Y" -o $tired == "Yes" -o $tired == "yes" -o $tired == "" ] ; then
					echo "You have tiredness!!"
					echo "You are $1 $2, age $3 years old. Please go to see a doctor right away immediately!! You are at risk of Covid-19"
					exit 0

				elif [ $coug == "No" -o $coug == "no" -o  $coug == "n" -o $coug == "N" ]; then
					echo "You are $1 $2, age $3 years old. Please self quarantine at home for 14 days. If you have any symptoms, please go to a hospital immediately."
					exit 2

				else
					echo "Please answer the question."
					exit 1
				fi

			else
				echo "Please answer the question."
				exit 1
			fi

		elif [ $sore == "No" -o $sore == "n" -o $sore == "N" -o $sore == "no" ]; then
			echo "Do you have runny nose?"

			read -p "Answer yes(y) or no(n)." nose
                                if [ $nose == "y" -o $nose == "Y" -o $nose == "Yes" -o $nose == "yes" -o $nose == "" ] ; then
                                        echo "You have runny nose!!"
					echo "You are $1 $2, age $3 years old. Please go to see a doctor right away immediately!! You are at risk of Covid-19"
                                        exit 0
	
                                elif [ $nose == "No" -o $nose == "no" -o  $nose == "n" -o $nose == "N" ]; then
                                        echo "You are $1 $2, age $3 years old. Please self quarantine at home for 14 days. If you have any symptoms, please go to a hospital immediately."
					exit 2
				else 
                                        echo "Please answer the question."
                                        exit 1
                                fi

		else
			echo "Please answer the question."
			exit 1
		fi

	elif [ $fev == "No" -o $fev == "n" -o $fev == "N" -o $fev == "no" ]; then
		echo "You are $1 $2, age $3 years old. Please self quarantine at home for 14 days. If you have any symptoms, please go to a hospital immediately."
		exit 2
	fi

elif [ $risk == "No" -o $risk == "n" -o $risk == "N" -o $risk == "no" ]; then 
	echo "Congratulations! You are free from COVID-19."

else
	echo "Please provide the answer. Did you go to the high risk countries?"
	exit 1
fi

exit 0
