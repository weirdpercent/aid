#!/usr/bin/perl
########################################
#             A. I. D. v1.0            #
#        database search script        #
#           coded by weirdpercent      #
#         (c) 2011 Drew Prentice       #
#          weirdpercent@gmail.com      #
########################################
print "\nThis program searches for songs with the same BPM.\n";
print "\nWhat BPM do you want to search for? ";
chomp($inpt = <STDIN>); #get the BPM to search for
print "searching..."; #make it look like we're doing something
$bpm = "BPM=$inpt"; #add our little tag
opendir(DIREC,".") || die "cannot open directory"; #open current direc
+tory w/ error handling
foreach $name(sort(readdir(DIREC))) { #for each filename beginning w/ 
+"BPM-", add to array
    if ($name =~ /^BPM-/) { #if the name contains "BPM-"...
        push @files, $name; #add it!
    }
    print "."; #add another "doing something" mark
}
closedir(DIREC); #close the dir
foreach my $filename ( @files ) { #for each filename in the array
    open(PHILE, '<', $filename) || die "cannot open $filename: $!"; #o
+pen file w/ error handling
    my @lines = scalar <PHILE>; #get the Artist/Album info
    while ( <PHILE> ) {
        push @lines, $_ if /$bpm/;
    }
    if ( @lines > 1 ) {
        print @lines;
    }
    else {
        print "sorry, no matching BPMs found."; #deliver the bad news
    }
    close PHILE; #finish up
}
