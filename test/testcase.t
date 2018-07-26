use Test::More;
use Plack::Test;
use HTTP::Request::Common; # install separately

use restexample::App;

my $app  = restexample::App->to_app;
my $test = Plack::Test->create($app);

my $res = $test->request( GET '/factorial/5' );
is( $res->code, 200, '[GET /] Request successful' );
is( $res->content, '{"factorial_of":"5","result":120}', 'got expected response structure for GET /factorial/5');

my $res = $test->request( GET '/factorial' );
is( $res->code, 404, '[GET /] Page Not Found' );

$res = $test->request( POST "/calculator",Body => '{
       "Number1":"20",
       "Number2":"10",
       "Operation":"+"
}');
is( $res->code, 200, '[POST /calculator] Addition Request successful' );

$res = $test->request( POST "/calculator",Body => '{
       "Number1":"20",
       "Number2":"10",
       "Operation":"-"
}');
is( $res->code, 200, '[POST /calculator] Subtraction Request successful' );

$res = $test->request( POST "/calculator",Body => '{
       "Number1":"20",
       "Number2":"2",
       "Operation":"*"
}');
is( $res->code, 200, '[POST /calculator] Multiplication Request successful' );

$res = $test->request( POST "/calculator",Body => '{
       "Number1":"20",
       "Number2":"10",
       "Operation":"/"
}');
is( $res->code, 200, '[POST /calculator] Division Request successful' );
done_testing;
