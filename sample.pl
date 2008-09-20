#!/usr/bin/env perl
use strict;
use warnings;

use Perl6::Say;
use FindBin::libs;
use Data::Dumper;

use Array::Heap;

my $heap = Array::Heap->new;
$heap->push(10);
$heap->push(6);
$heap->push(12);
$heap->push(4);
$heap->push(3);

warn Data::Dumper::Dumper( $heap );

say $heap->pop; # 3
say $heap->pop; # 4
say $heap->pop; # 6

warn Data::Dumper::Dumper( $heap );
