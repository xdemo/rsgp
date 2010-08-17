#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use Glib qw{ TRUE FALSE };
use Gtk2 '-init';
use Gtk2::MozEmbed;
use LWP::Simple;

Gtk2::MozEmbed -> set_profile_path($ENV{ HOME } . "/.rsgp", "rsgp");
	my $moz = Gtk2::MozEmbed -> new();

	my $user = `whoami`;

use subs qw{ main on_window_destroy };

main();

exit(0);

my ($builder, $window, $rsn);

# Subroutines/callbacks
sub main {
	

	$builder = Gtk2::Builder->new();
	
	# Load my glade XML file which I converted from my glade project
	# using 'gtk-builder-convert'
	$builder->add_from_file( 'gui.xml' );

	# Get my top level object as named in my glade project
	$window = $builder->get_object( 'window' );
	$builder->connect_signals( undef );

	my $gamewindow = $builder->get_object( 'scrolledwindow1' );
		$gamewindow -> add($moz);
		$window->show_all();

	$moz -> load_url("file:///home/$user/rsgp/start.html");

	# main loop
	Gtk2->main();
}

sub on_window_destroy {
	Gtk2->main_quit();
}



sub set_skill_label {
	# determines which skill label to display the level
	my ($label,$val) = @_;
	$builder->get_object($label)->set_text($val);
}


sub on_btnSearch_clicked {

	# get the text value of search_entry
	$rsn = $builder->get_object( 'search_entry' )->get_text;

		my $url = 'http://hiscore.runescape.com/index_lite.ws?player=' . $rsn;
		
		# fetch data from above url
		my $data = get $url;

	# tidy up newline characters for commas
	$data =~ s/[\n]/,/g; 

	# split everything into @s at each comma
	my @s = (split(/,/, $data));

	# set skill labels to appropriate value
	set_skill_label('lbl_attack'	, $s[4]);
	set_skill_label('lbl_defence'	, $s[7]);
	set_skill_label('lbl_strength'	, $s[10]);
	set_skill_label('lbl_hitpoints'	, $s[13]);
	set_skill_label('lbl_ranged'	, $s[16]);
	set_skill_label('lbl_prayer'	, $s[19]);
	set_skill_label('lbl_magic'	, $s[22]);
	set_skill_label('lbl_cooking'	, $s[25]);
	set_skill_label('lbl_wc'	, $s[28]);
	set_skill_label('lbl_fletch'	, $s[31]);
	set_skill_label('lbl_fishing'	, $s[34]);
	set_skill_label('lbl_fm'	, $s[37]);
	set_skill_label('lbl_craft'	, $s[40]);
	set_skill_label('lbl_smithing'	, $s[43]);
	set_skill_label('lbl_mining'	, $s[46]);
	set_skill_label('lbl_herblore'	, $s[49]);
	set_skill_label('lbl_agility'	, $s[52]);
	set_skill_label('lbl_thieveing'	, $s[55]);
	set_skill_label('lbl_slayer'	, $s[58]);
	set_skill_label('lbl_farm'	, $s[61]);
	set_skill_label('lbl_rc'	, $s[64]);
	set_skill_label('lbl_hunter'	, $s[67]);	
	set_skill_label('lbl_construction'	, $s[70]);
	set_skill_label('lbl_summon'	, $s[73]);
	set_skill_label('lbl_dungeon'	, $s[76]);

}


sub on_btnPlay_clicked {

	$moz -> load_url("http://runescape.com/game.ws?j=1");

}


sub on_btnHome_clicked {
	$moz -> load_url("file:///home/$user/rsgp/start.html");
}

sub on_about_clicked {
	my $about = $builder->get_object( 'aboutdialog' );
	$about->run;
	$about->hide;

}


sub gtk_main_quit {
	print "[+] Exit\n";	
	exit 0;
}
