#!/usr/bin/perl
########################################
#             A. I. D. v1.0            #
#       add database entry script      #
#           coded by bitsmart          #
#       (c) 2000 Andrew Prentice       #
#         bitsmart@bitsmart.org        #
########################################
print "\nA. I. D. v1.0 (2000) Andrew Prentice\n";
print "\nA lbum\nI nformation\nD atabase\n";
print "\nArtist/Album: ";
chomp($info = <STDIN>); #get the name of the Artist and Album
print "creating new file or appending to existing file..."; #make it look like we're doing something
$dbentry = "BPM-$info.txt"; #add DB prefix
if (-e $dbentry) { #check if file already exists (it should't)
	open(DBENTRY, ">>$dbentry") || die "cannot open file $dbentry\n"; #open w/ error handling
	print DBENTRY "$info\n "; #append Album info (shouldn't have to append)
	close(DBENTRY); #make sure we're all neat
} else { #we should be creating a new file
	open(DBENTRY, ">$dbentry") || die "cannot create file $dbentry\n"; #open w/ error handling
	print DBENTRY "$info\n "; #add the Album info
	close(DBENTRY); #make sre we're all neat
}
print "done.\n"; #done creating or appending the file
print "How many tracks do you want to add? ";
$numberoftracks = <STDIN>; #how many tracks?
chomp($numberoftracks); #remove trailing newline
$counter = 1; #need counter to count up to no. of tracks
while ($counter <= $numberoftracks) { #cycle thru each of the tracks and get info
	print "\nTrack name $counter: ";
	chomp($trackname = <STDIN>); #name of track
	print "Track length $counter: ";
	chomp($tracklength = <STDIN>); #length of track
	print "Track BPM $counter: ";
	chomp($trackbpm = <STDIN>); #beats per minute of track
	print "adding track..."; #make it look like we're doing something
	$track = "$counter - $trackname - $tracklength - BPM=$trackbpm"; #string it together
	open(TRACK, ">>$dbentry") || die "cannot open file $dbentry"; #open w/ error handling
	print TRACK "\n$track"; #add each song to the file
	close(TRACK); #make sure we're all neat
	$counter++; #increment our counter
	print "done."; #done adding track
}
open(LAST, ">>$dbentry") || die "cannot open file $dbentry"; #one more time w/ error handling
print LAST "\n"; #add one last newline for good measure. =)
close(LAST); #make sure we're all neat
print "\nAll done! Added $info to the database.\n"; #self explanatory