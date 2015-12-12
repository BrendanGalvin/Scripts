# This is a script that can take a web page, parse it for all file links that have the specified extensions
# from the user, and download them all to the specified location.
# It can skip certain downloads or allow you to pick whether a download should be skipped, if necessary.
# It was used by my Father's patent business to get the patent bulk downloads from Google, overnight.

#!/usr/bin/perl -w

use strict;
use warnings;
use LWP::UserAgent;
use LWP::Simple;
use WWW::Mechanize;
use Digest::MD5    qw( md5_hex );


my $flag=0;
print"\n\nURL for mass-downloading (only download links using the <a href> tag, not images or other embedded elements): ";
chomp(my $url = <STDIN>);
print"\nExtensions to download (seperated by comma's): ";
chomp(my $extensions = <STDIN>);
$extensions =~ s/[.]//g;
print"\nLocation to store downloaded files: ";
chomp(my $location = <STDIN>);

print"\nHow many downloads would you like to skip starting from the first (in case you started this download earlier and have already downloaded some of the files)? ";
chomp(my $skips = <STDIN>);

print"\nAre you going to want to skip any files while the program is running (y/n)?";
chomp(my $skiporno = <STDIN>);
my $error = "";

my @extension = split(',', $extensions);
my %extens = map{$_ => 1} @extension;

sub GetFileSize{
        my $url=shift;
        my $ua = new LWP::UserAgent;
        $ua->agent("Mozilla/5.0");
        my $req = new HTTP::Request 'HEAD' => $url;
        $req->header('Accept' => 'text/html');
        my $res = $ua->request($req);
        if ($res->is_success) {
                 my $headers = $res->headers;
                 return $headers;
        }else{
		$flag = 1;
		$error .= "Error retrieving file information at $url ";
	}
return 0;
}


my $mech = WWW::Mechanize->new();
$mech->get($url);
my $base = $mech->base;

my @links = $mech->links();


for my $link ( @links ) {
	my $skip = 'n';
	if($link->url() =~ m/([^.]+)$/){
		my $ext = ($link->url() =~ m/([^.]+)$/)[0];


		if(exists($extens{$ext})){
			my $newurl = $link->url();
			if($newurl !~ /http::\/\/$/ig){
				my $baseurl = URI->new_abs($newurl, $base);
				$newurl = $baseurl;
			}
			my $filename = $newurl;
			$filename =~ m/.*\/(.*)$/;
			$filename = $1;
			if($skips > 0){
				$skips -= 1;
				print "\n\nSkipped $filename at " . $link->url();
				next;
			}else{
				my $header = GetFileSize($newurl);
				my $urlmech = WWW::Mechanize->new();
				$urlmech->show_progress("true");
				print"\n\n\n$filename at $newurl\n";
				print "File size: ".$header->content_length." bytes\n" unless $flag==1;
				print "Last modified: ".localtime($header->last_modified)."\n" unless $flag==1;
				if($skiporno eq 'y'){
					print"Skip file (y/n)?";
					chomp($skip = <STDIN>);
				}
				if($skip ne 'y'){
					print " downloading...\n";
					my $response = $urlmech->get($newurl, ':content_file' => "$location\\$filename", )->decoded_content;
					
				}else{
					print"\nSkipping...\n\n";
					next or print"Error skipping.\n";
				}
			}
		}
	}
}
print"\n\n\nTasks completed.\n";
if($error ne ""){
	print"\nErrors: $error";
}else{
	print"No errors.\n";
}