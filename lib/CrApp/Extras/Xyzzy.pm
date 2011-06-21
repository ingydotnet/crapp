# This is a CrApp plugin called Extras. It want's to add 2 new commands: baz
# and gorch.
use 5.010;
use CrApp 0.01 ();

package CrApp::Extras::Xyzzy;

# baz command. opts => up, down, right
package CrApp::Command::baz;
CrApp->import( -command );
use constant abstract => 'None of your baziness!';
sub opt_spec { $_[0]->SUPER::opt_spec, [ right => "Move to the right" ] }
sub execute { say "Baz baz baz" }

# gorch command. opts => up, down
package CrApp::Command::gorch;
CrApp->import( -command );
use constant abstract => 'I gorch your back';
sub execute { say "It's gonna be a gorcher" }

1;
