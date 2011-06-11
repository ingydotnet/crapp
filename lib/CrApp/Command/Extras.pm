# This is a CrApp plugin called Extras. It want's to add 2 new commands: baz
# and gorch.
use 5.010;
use CrApp 0.01 ();

package CrApp::Command::Extras;
use base 'CrApp::Command';
# If I don't define this class at all I get this error:
#   CrApp::Command::Extras is not a App::Cmd::Command at
#   /usr/local/share/perl/5.10.1/App/Cmd.pm line 87.
# And if I do define it, I get the 'extras' command, that I don't want.


# Finally, these two commands defined below are not picked up at all.

# baz command. opts => up, down, right
package CrApp::Command::baz;
use base 'CrApp::Command';
use constant abstract => 'None of your baziness!';
sub opt_spec { $_[0]->SUPER::opt_spec, [ right => "Move to the right" ] }
sub execute { say "Baz baz baz" }

# gorch command. opts => up, down
package CrApp::Command::gorch;
use base 'CrApp::Command';
use constant abstract => 'I gorch your back';
sub execute { say "It's gonna be a gorcher" }

1;
