#!/usr/bin/perl
package RegexJapaneseWordList;
use strict;
use warnings;
use utf8;
use YAML::Syck;
use Encode;
use feature 'say';

sub new {
	my $proto = shift;
	my $class = $proto || $proto;
	my $self ={};
	bless $self = {};
	return $self;
}

sub regex {
	my ($self, $text, $loadfile) = @_;
	my $loaded = LoadFile($loadfile);
	for (@$loaded) {
		my $str = decode('UTF-8', $_);
		my $regex = qr/$str/;
		if ($text =~ /$regex/){
#			say "$text include $str :match";
			return $str;
		}else{
#			say "$text not include $str :no match";
			next;
		}
	}
	return 0;
}
1;
