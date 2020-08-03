requires 'perl', '5.022';

requires 'List::Util', '0.07';
requires 'List::MoreUtils', '1.33';
requires 'Keyword::Declare', '0.001015';
requires 'Moops';
requires 'PPR';

on test => sub {
    requires 'Test::More', '0.96';
};
