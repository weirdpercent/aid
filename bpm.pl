#!/usr/bin/perl
########################################
#             A. I. D. v1.0            #
#        database search script        #
#           coded by bitsmart          #
#       (c) 2000 Andrew Prentice       #
#         bitsmart@bitsmart.org        #
########################################
print "\nThis program searches for songs with the same BPM.\n";
print "\nWhat BPM do you want to search for? ";
chomp($inpt = <STDIN>); #get the BPM to search for
print "searching..."; #make it look like we're doing something
$bpm = "BPM=$inpt"; #add our little tag
opendir(DIREC,".") || die "cannot open directory"; #open current directory w/ error handling
foreach $name(sort(readdir(DIREC))) { #for each filename beginning w/ "BPM-", add to array
	if ($name =~ /^BPM-/) { #if the name contains "BPM-"...
		@files = (@files, $name); #add it!
	}
	print "."; #add another "doing something" mark
}
closedir(DIREC); #close the dir
foreach $filename (@files) { #for each filename in the array
	chomp($filename); #chomp trailing newline
	open(PHILE, "$filename") || die "cannot open $filename"; #open file w/ error handling
	@lines = <PHILE>; #put the lines of the file into an array
	if ($lines[$linenumber]=~/$bpm/) { #if any line in the array had $bpm,
		$linenumber++; #increment the line counter
		$flag = "yes"; #turn the "bpm flag" on
	} else {
		$flag = "no"; #don't turn on the flag
	}
	print "\n"; #clean up
	if ($flag = "yes") { #if the flag is on
		print "\n$lines[0]\n"; #print the Artist/Album info
		$linenumber = 2; #reset the line counter
		foreach (@lines) { #for each line in the array
			if ($_=~/$bpm/) { #if $bpm is found,
				print; #print that line
			}
		}
	} else {
		print "sorry, no matching BPMs found."; #deliver the bad news
	}
	close(PHILE); #finish up
}