#!/usr/bin/perl
package restexample::CalculatorService;
use strict;
use warnings;

sub Operation($){
        my ($first, $second, $oper) = @_;
        try{
         my $result = eval "$first $oper $second";
         return $result;
        }catch{
         return $@;
        }
}
1;
