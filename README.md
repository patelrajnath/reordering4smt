# CDACM-Reordering-System (ROSY) - v1.0 - 2014-11-26

This package provides a source side Reordering system (ROSY) for English, used primarily for English to Indian language machine translation. ROSY accepts an English sentence in plain text format, reorders some of the words according to a given set of rules, and outputs the resulting sentence in plain text form. For xml input it extracts sentences, reorders and put it back  in the same xml file.

(c) 2014-2024. Centre for Development of Advanced Computing, Mumbai
Knowledge Based Computer Systems Division. All Rights Reserved. 

Original Reordering code by Ananthakrishnan Ramanathan & Ritesh M. Shah. Modified code by Raj Nath Patel.
For details on the approach and reordering rules, refer to "Raj N. Patel, Rohit Gupta, Prakash B. Pimpale and Sasikumar M, Reordering rules for English-Hindi SMT, in Second Workshop on Hybrid Approaches to Translation, ACL 2013, Sofia, Bulgaria, August 4-9, 2013"

## LICENSE 

The software is licensed under GPL V3. Please see the file LICENSE.txt

For more information, bug reports, and fixes, contact:
    Raj Nath Patel / Prakash Pimpale
    CDAC, Rain tree marg, sector 7, CBD Belapur Navi Mumbai - 400614
    India
    rajnathp@cdac.in/prakash@cdac.in
    http://kbcs.in/

## CONTACT

For questions about this distribution, please contact KBCS, CDAC Mumbai at sasi@cdac.in. We provide assistance on a best-effort basis.

# TUTORIAL/QUICKSTART INSTRUCTIONS

Quickstart guidelines, primarily for end users who wish to use the reordering, are below.

### DEPENDENCIES

	-OS - Linux
	-perl should be installed 
	-python should be installed	
	-python xml library(lxml) should be installed 
	("lxml" Can be installed using command "#yum install python-lxml")

### INSTALLING

To install the system, just extract the file 'cdacm-kbcs.rosy-v1.0.tar.gz'.
On command line-
```sh
$tar -xzvf cdacm-kbcs.rosy-v1.0.tar.gz
```
### USE
You can use the system in two ways. If your input is in plain text file (example at ./sample-input.txt) you should use cdacm.ROSY-T.sh script for reordering and cdacm.ROSY-X.sh if it is in XML format (example at ./sample-input.xml), in the following way -

```sh	
$bash <SCRIPTNAME> <INPUTFILE> 

Sample Usage :
Usage 1:
	- $bash cdacm.ROSY-T.sh sample-input.txt
It takes text file sample-input.txt as input and outputs reordered sentences in file sample-input.reorderd.txt

Usage 2:
	-$bash cdacm.ROSY-X.sh sample-input.xml
it takes xml file as input, extract sentences inside the "input" tag, reorders it and put it back in the same file. Sample Input and Output given below. 
```
	
### SAMPLE XML INPUT:
	<Input sentence="01">It is beautiful.<Reordered></Reordered></Input>
	<Input sentence="02">Jaipur , popularly known as the Pink City , is the capital of Rajasthan state , India.<Reordered></Reordered></Input>
	NOTE: Its part of xml input file. For whole format see the "sample-input.xml"

	SAMPLE XML OUTPUT:
	<Input sentence="01">It is beautiful.<Reordered>It beautiful is .</Reordered></Input>
	<Input sentence="02">Jaipur , popularly known as the Pink City , is the capital of Rajasthan state , India.<Reordered>Jaipur , popularly the Pink City as known , Rajasthan state , It beautiful is India . of the capital is .
</Reordered></Input>
	
### NOTE: Intermediate outputs will be saved "cdacm.rosy-v1.0/tmp"

### PROGRAMMATIC USE

You need to make a call to cdacm.reorder-text.sh and cdacm.reorder-xml.sh from you program to use the system. 

### DETAILED

INSIDE

-cdacm-kbcs.rosy-v1.0
	-research //directory containing publications
		-input.txt //sample input text file
		-input.xml // sample input xml file
	-tools //directory containing all other tools
		-grammar //containing trained model for English parser(Stanford)
			-englishPCFG.ser.gz //model
		-Parse //directory containing Recursive Decent Parser
			-RecDescent.pm //Recursive Decent Parser
		-cdacm-reorder.pl //perl script containing reordering rules
		-changeAtt.py // To change the attribute value in xml files			-compare2files.py //To match to file at word level. In English parsing process, parser changes some words, like colour-> color.
		-convert.py // convert the parsed sentence output, compatible to "cdacm-reorder.pl"
		-getAttValue.py// To get input text from xml file
		-lexparser.sh // Its shell script to run "Stanford Parser"
		-runstanfordparser.sh // To run "lexparser.sh"
		-stanford-parser.jar // Stanford Parsing system
	-cdacm.reorder-text.sh //shell script to initiate reordering for text file
	-cdacm.reorder-xml.sh  //shell script to initiate reordering for xml file
	-sample-input.txt //sample input text file
	-sample-input.xml //sample input xml file
	-README// This file
	
### INPUT-OUTPUT SPECIFICATION

System takes input in two format
-text files //Plain English text, sentences separated by newline. Sample is given as "sample-input.txt".
-xml file //Sample is given as "sample-input.xml". For any change in xml format, you need to change "changeAtt.py" and "getAttValue.py" accordingly

### System Output
-For text input, final reordered output will be stored in "filename.reordered.txt. For Example if input file is "/some/path/input.txt", then output will be stored in "/some/path/input.reordered.txt".
-For xml input, there should be empty "Reordered" sub-tag within "Input" tag. Reordered output will be stored within "Reordered" tag.

### CONTRIBUTORS

- Ananthakrishnan Ramanathan
- Ritesh Shah
- Jayprasad Hegde
- Prakash B. Pimpale
- Rohit Gupta
- Raj Nath Patel

### OTHER SOFTWARES (included with this distribution)
-The system uses Stanford Parser [http://nlp.stanford.edu/software/lex-parser.shtml] which is licensed under GNU GPL V2 and later (http://www.gnu.org/licenses/gpl-2.0.html)
-The system also makes use of Parse-RecDescent: Perl module for generating recursive-descent parsers [https://github.com/jtbraun/Parse-RecDescent] which is licensed under PERLARTISTIC - the Perl Artistic License(http://search.cpan.org/~rjbs/perl-5.18.4/pod/perlartistic.pod)

### ACKNOWLEDGEMENT

This system is developed as part of English to Indian Language Machine Translation (EILMT) project. We would like to thank the Technology Development for Indian Languages (TDIL) program and the Department of Electronics & Information Technology(DEITY), Govt. of India for funding EILMT project.

### CHANGES

2014-11-26      1.0   Initial release

