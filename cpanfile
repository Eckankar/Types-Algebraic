requires 'perl', '5.010';

requires 'Keyword::Declare';
requires 'Moops';
requires 'PPR';

on test => sub {
    requires 'Test::More', '0.96';
};