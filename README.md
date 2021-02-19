[![Build Status](https://travis-ci.org/Eckankar/Types-Algebraic.svg?branch=master)](https://travis-ci.org/Eckankar/Types-Algebraic)
[![Kwalitee status](http://cpants.cpanauthors.org/dist/Types-Algebraic.png)](https://cpants.cpanauthors.org/dist/Types-Algebraic)

# NAME

Types::Algebraic - Algebraic data types in perl

# SYNOPSIS

    use Types::Algebraic;

    data Maybe = Nothing | Just :v;

    my $sum = 0;
    my @vs = ( Nothing, Just(5), Just(7), Nothing, Just(6) );
    for my $v (@vs) {
        match ($v) {
           with (Nothing) { }
           with (Just $v) { $sum += $v; }
        }
    }
    say $sum;

# DESCRIPTION

Types::Algebraic is an implementation of [algebraic data types](https://en.wikipedia.org/wiki/Algebraic_data_type) in perl.

These kinds of data types are often seen in functional languages, and allow you to create and consume structured data containers very succinctly.

The module provides two keywords: ["data"](#data) for creating a new data type, and ["match"](#match) to provide pattern matching on the type.

# USAGE

## Creating a new type with `data`

The `data` keyword is used for creating a new type.

The code

    data Maybe = Nothing | Just :v;

creates a new type, of name `Maybe`, which has 2 _data constructors_, `Nothing` (taking no parameters), and `Just` (taking 1 parameter).

You may insantiate values of this type by using one of the constructors with the appropriate number of arguments.

    my $a = Nothing;
    my $b = Just 5;

## Unpacking values with `match`

In order to access the data stored within one of these values, you can use the `match` keyword.

    my $value = Just 7;
    match ($value) {
        with (Nothing) { say "There was nothing in there. :("; }
        with (Just $v) { say "I got the value $v!"; }
    }

The cases are matched from the top down, and only the first matching case is run.

You can also create a default fallback case, which will always run if reached.

    data Color = Red | Blue | Green | White | Black;
    match ($color) {
        with (Red) { say "Yay, you picked my favorite color!"; }
        default    { say "Bah. You clearly have no taste."; }
    }

## Nested patterns

Note, patterns can be nested, allowing for more complex unpacking:

    data PairingHeap = Empty | Heap :head :subheaps;
    data Pair = Pair :left :right;

    # Merge two pairing heaps (https://en.wikipedia.org/wiki/Pairing_heap)
    sub merge {
        my ($h1, $h2) = @_;

        match (Pair($h1, $h2)) {
            with (Pair Empty $h) { return $h; }
            with (Pair $h Empty) { return $h; }
            with (Pair (Heap $e1 $s1) (Heap $e2 $s2)) {
                return $e1 < $e2 ? Heap($e1, [$h2, @$s1])
                                 : Heap($e2, [$h1, @$s2]);
            }
        }
    }

# LIMITATIONS

- Currently, match statements can't be nested.

# BUGS

Please report bugs directly on [the project's GitHub page](https://github.com/Eckankar/Types-Algebraic).

# AUTHOR

Sebastian Paaske Tørholm <sebbe@cpan.org>

# COPYRIGHT

Copyright 2020- Sebastian Paaske Tørholm

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO
