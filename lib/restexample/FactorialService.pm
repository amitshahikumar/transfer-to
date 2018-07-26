#!/usr/bin/perl
package restexample::FactorialService;
use strict;
use warnings;

sub fact{
        my ($factNumber) = @_;
        #my $arg = shift;
        if ($factNumber == 1){
                return 1;
        }
        my $var = $factNumber * fact($factNumber - 1);
        return $var;
}
1;
