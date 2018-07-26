#!/usr/bin/perl
use v5.10;
use strict;
use warnings;
require "./CalculatorService.pm";
require "./FactorialService.pm";

no warnings 'experimental::smartmatch';

print "\nWelecome to Megasoft calculator\n\n";
print "1) Add\n";
print "2) Subtract\n";
print "3) Multiple\n";
print "4) Divide\n";
print "5) Factorial\n";

my $operationInput;

print "Select Operation : ";
$operationInput = <STDIN>;

given($operationInput){
        when(1){
                my $result;
                my $first =  inputFunction('First');
                my $second = inputFunction("Second");
                $result = restexample::CalculatorService::Operation($first, $second, '+');
                print "Result of $first + $second = $result\n";
        }
        when(2){
                my $result;
                my $first = inputFunction("First");
                my $second = inputFunction("Second");
                $result = restexample::CalculatorService::Operation($first, $second, '-');
                print "Result of $first - $second = $result\n";
        }
        when(3){
                my $result;
                my $first = inputFunction("First");
                my $second = inputFunction("Second");
                $result = restexample::CalculatorService::Operation($first, $second, '*');
                print "Result of $first * $second = $result\n";
        }
        when(4){
                my $result;
                my $first = inputFunction("First");
                my $second = inputFunction("Second");
                $result = restexample::CalculatorService::Operation($first, $second, '/');
                print "Result of $first / $second = $result\n";
        }
        when(5){
                my $result;
                my $first = inputFunction("First");
                $result =  restexample::FactorialService::fact($first);
                print "Factorial of $first = $result\n";
        }
        default{
                print "Operation does not support...";
        }
}

sub inputFunction{
        my ($text) = @_;
        print "Enter $text number: ";
        my $inputNumber = <STDIN>;
    chomp($inputNumber);
        return $inputNumber;
}
