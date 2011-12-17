use strict;
use warnings;
use Encode;
use Encode::JP::Mobile::UnicodeEmoji;
use Encode::JP::Emoji::Property;
use Test::More;

# hare
my $auto_unicode = "\xE2\x98\x80";
my $mobile_jp_unicode = "\x{E63E}";

ok decode('x-utf8-e4u-unicode', $auto_unicode) =~ /\p{InEmojiGoogle}/;
ok decode('x-utf8-e4u-unicode', $auto_unicode) !~ /\p{InEmojiDoCoMo}/;
is decode('x-utf8-jp-mobile-unicode-emoji', $auto_unicode), $mobile_jp_unicode;
ok decode('x-utf8-jp-mobile-unicode-emoji', $auto_unicode) =~ /\p{InEmojiDoCoMo}/;
ok decode('x-utf8-jp-mobile-unicode-emoji', $auto_unicode) !~ /\p{InEmojiGoogle}/;
is encode('x-utf8-jp-mobile-unicode-emoji', $mobile_jp_unicode), $auto_unicode;

done_testing;
