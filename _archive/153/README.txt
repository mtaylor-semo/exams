To generate 3 exams for BI 153, do the following:

Create three files with 10 questions each for:

multiplechoice.txt	-- Multiple Choice questions
truefalse.txt		-- True False questions
matching.txt		-- Matching questions.

Each question should be in the proper TeX format.  Eventually, you should have a test bank with all of your questions in proper TeX format.

######################
## Question Formats ##
######################
For Matching, the format is

\question\MatchingQuestion{Answer}{Question}

 
For True False, the format is

\question\TFquestion{Answer}{Question}

Answer must be either 'T' or 'F' in the braces.


For Multiple Choice, the format is

%BeginMC
\question
Actual Question

\begin{choices}
\choice Choice 1%EndChoice
\choice Choice 2%EndChoice
\choice Choice 3%EndChoice
\correctchoice Choice 4%EndChoice
\end{choices}
%EndMC

Use as many choices as you need. \correctchoice is the correct answer but can be any one of the choices (first, second, third, etc.)

#############################
## Randomize the questions ##
#############################

Open the terminal window. Type:

153shuffle.py    

If successful, three files for each question set will be generated

matchingA.tex
matchingB.tex
matchingC.tex
multiplechoiceA.tex
multiplechoiceB.tex
multiplechoiceC.tex
truefalseA.tex
truefalseB.tex
truefalseC.tex

153shuffle.py is located in the ~/bin/python/ directory.

###############################
## Other files you will need ##
###############################

## Short essays

shortessay1.tex
shortessay2.tex
etc.

Each file includes only 1 question, TeX formated.  The format for short essays follows the exam.cls format for essay questions:

\question[5]
Actual question goes here. Can be as long as needed. Change point values as necessary but short answers are typically 5 points for a BI 153 exam. Adjust formatting for any images, centering, etc.  Be sure to include any images in the same directory as these files.

## Long Essays

longessays.tex

If you include a long essay questions (full page), put all questions in one file. Separate each question with a \newpage command.  The format is

\question[15]
Actual question goes here. Can be as long as needed. Change point values as necessary but short answers are typically 10-15 points for a BI 153 exam. Adjust formatting for any images, centering, etc.  Be sure to include any images in the same directory as these files.

Be sure to include all images needed by the questions.

########################
## Generate the exams ##
########################

Open each exam TeX file, such as

BI153 exam1a.tex, etc.

Type set the exam, then begin adjusting the location of page breaks, short essay questions, etc., to fit on the pages.  After each exam is generated, rename them in the Finder.

Open the BI153_exam_preamble.tex file and uncomment the \printanswers line. Typeset each exam again to print the answer keys.
