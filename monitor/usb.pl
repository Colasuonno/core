#!/usr/bin/perl

my $output = qx("dmesg");

foreach my $line (split /[\r\n]+/, $output) {
	system("bash /home/colasuonno/Desktop/Dev/general_project/Core/utils/log.sh \"green\" \"$line\" ");
}
system("bash /home/colasuonno/Desktop/Dev/general_project/Core/utils/log.sh \"white\" \"Searching usb connections...\" ");
system("sleep 2");
foreach my $line (split /[\r\n]+/, qx("lsusb")) {
	system("bash /home/colasuonno/Desktop/Dev/general_project/Core/utils/log.sh \"green\" \"$line\" ". " OK");
}
print "\n";