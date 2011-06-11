use 5.010;
# This all works except I want 'crapp help' to list foo before bar.
# If I could get that from the class order it would be nice.

# main class - setup app
package CrApp;
use App::Cmd::Setup -app;

our $VERSION = '0.01';

# command base class
package CrApp::Command;
use base 'App::Cmd::Command';
use constant opt_spec => (
    [ "up", "Do it up" ],
    [ "down", "Do it down" ],
);

# foo command. opts => up, down, left
package CrApp::Command::foo;
use base 'CrApp::Command';
use constant abstract => 'I pity the Foo!';
sub opt_spec { $_[0]->SUPER::opt_spec, [ left => "Move to the left" ] }
sub execute { say "Foo man choo" }

# bar command. opts => up, down
package CrApp::Command::bar;
use base 'CrApp::Command';
use constant abstract => 'Belly up to the Bar!';
sub execute { say "12 bar bloos" }

1;
