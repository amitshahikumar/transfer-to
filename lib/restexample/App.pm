package restexample::App;
use v5.010;
use Dancer2;
require restexample::CalculatorService;
require restexample::FactorialService;

set serializer => 'JSON';
our $VERSION = '0.1';


post '/calculator' => sub{
        my $number1 = param('Number1');
        my $number2 = param('Number2');
        my $operation = param('Operation');
        if($number1 ne "" && $number2 ne "" && $operation ne ""){
                my $result = restexample::CalculatorService::Operation($number1, $number2, $operation);
                my $response = {Number1 => $number1, Number2 => $number2, Operation => $operation, Result => $result};
                return $response;
        }else{
                return {message => 'Parameter is missing !!!!!!'}
        }
};

get '/factorial/:input' => sub {
        my $inputParam = param( 'input' );
        my $result = restexample::FactorialService::fact($inputParam);
        return {factorial_of=>$inputParam,result => $result};
};
true;
