my $input_line = <STDIN>;
for ($i = 0; $i < $input_line; $i++) {
    my $s = <STDIN>;
    chomp($s);
    @s = split(/ /,$s);
    print "hello = ".$s[0]." , world = ".$s[1]."\n";
}
