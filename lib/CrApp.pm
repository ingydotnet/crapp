use 5.010;
# This all works except I want 'crapp help' to list foo before bar.
# If I could get that from the class order it would be nice.

# command base class
package CrApp::Command;
use App::Cmd::Setup -command;

use constant opt_spec => (
    [ "up", "Do it up" ],
    [ "down", "Do it down" ],
);

# main class - setup app
# MUST BE DEFINED *AFTER* THE COMMAND CLASS EXISTS -- rjbs, 2011-06-20
package CrApp;
use App::Cmd::Setup -app;

our $VERSION = '0.01';

use Module::Pluggable
  require     => 1,
  search_path => [ 'CrApp::Extras' ];

__PACKAGE__->plugins;

# foo command. opts => up, down, left
package CrApp::Command::foo;
CrApp->import( -command );
use constant abstract => 'I pity the Foo!';
sub opt_spec { $_[0]->SUPER::opt_spec, [ left => "Move to the left" ] }
sub execute { say "Foo man choo" }

# bar command. opts => up, down
package CrApp::Command::bar;
CrApp->import( -command );
use constant abstract => 'Belly up to the Bar!';
sub execute { say "12 bar bloos" }

1;
