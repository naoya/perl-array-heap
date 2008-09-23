package Array::Heap;
use strict;
use warnings;

sub new {
    my $class = shift;
    bless [ undef ], $class;
}

sub size {
    my $self = shift;
    return @$self;
}

sub push {
    my ($self, $value) = @_;
    CORE::push @$self, $value;

    $self->upheap($self->size - 1);

    return $value;
}

sub upheap {
    my ($self, $node) = @_;
    my $parent = int ($node / 2);
    if ($parent < 1) {
        return;
    }

    if ($self->[$node] < $self->[$parent]) {
        swap(\$self->[$node], \$self->[$parent]);
        $self->upheap($parent);
    } else {
        return;
    }
}

sub pop {
    my $self = shift;
    my $min  = $self->[1];

    $self->[1] = CORE::pop @$self;
    $self->down_heap(1);

    return $min;
}

sub down_heap {
    my ($self, $node) = @_;

    my $left  = 2 * $node;
    my $right = 2 * $node + 1;

    if (not defined $self->[$left] and not defined $self->[$right]) {
        return;
    }

    if ((defined $self->[$left] and not defined $self->[$right]) || $self->[$left] < $self->[$right]) {
        if ($self->[$left] < $self->[$node]) {
            swap(\$self->[$left], \$self->[$node]);
            down_heap( $self, $left );
        } else {
            return;
        }
    } else {
        if ($self->[$right] < $self->[$node]) {
            swap(\$self->[$right], \$self->[$node]);
            down_heap( $self, $right );
        } else {
            return;
        }
    }
}

sub swap {
    my ($x, $y) = @_;
    ($$x, $$y) = ($$y, $$x);
}

1;
