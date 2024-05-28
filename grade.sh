CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

# Step 2: Check that the student code has the correct file submitted
if [[ -f student-submission/ListExamples.java ]]
then 
    echo "ListExamples.java file found."
else 
    echo "ListExamples.java file not found."
    echo "Grade: 0"
    exit
fi

# Step 3: Put all relevant files to grading-area directory
# Relevant Files: TestListExamples.java / ListExamples.java / lib directory 
cp TestListExample.java grading-area
cp student-submission/ListExamples.java grading-area
cp -r lib grading-area

# Step 4: Compile the java files and check if they compiled successfully
cd grading-area
javac -cp $CPATH *.java
if [[ $? -eq 0 ]]
then 
    echo "Compiled Successfully."
else 
    echo "Failed to compile successfully."
    exit 
fi 

# Step 5: Run the tests and report grade based on the test results
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test_output.txt
if grep -q "FAILURES!!!" test_output.txt; 
then
    echo "There was a failure in the test." 
    echo "Grade: 50"
else
    echo "Grade: 100"
fi