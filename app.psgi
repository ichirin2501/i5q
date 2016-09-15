use FindBin;
use lib "$FindBin::Bin/local/lib/perl5";
use lib "$FindBin::Bin/lib";
use File::Basename;
use Plack::Builder;
use Isucon5::Web;

my @nytprof_opts = qw(addpid=1 start=no sigexit=1 blocks=1 file=/tmp/nytprof.out);
$ENV{"NYTPROF"} = join ":", @nytprof_opts;
require Devel::NYTProf;

my $root_dir = File::Basename::dirname(__FILE__);

my $app = Isucon5::Web->psgi($root_dir);
builder {
   enable sub {
     my $app = shift;
       sub {
         my $env = shift;
         DB::enable_profile();
         my $res = $app->($env);
         DB::disable_profile();
         return $res;
       };
     };
   ;
    enable 'ReverseProxy';
    enable 'Static',
        path => qr!^/(?:(?:css|fonts|js)/|favicon\.ico$)!,
        root => File::Basename::dirname($root_dir) . '/static';
    enable 'Session::Cookie',
        session_key => "isuxi_session",
        secret => $ENV{ISUCON5_SESSION_SECRET} || 'beermoris',
    ;
    $app;
};
