## Installing dependencies for Haplopainter
cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
cpanm install --notest Cairo
cpanm install Data::Dumper
cpanm install DBI
cpanm install File::Basename
cpanm install File::Spec::Functions
cpanm --force --notest Gtk2
cpanm install Math::Trig
cpanm install Sort::Naturally
cpanm install Storable
cpanm install --force Tk

echo "export PERL5LIB=/home/rstudio/perl5/lib/perl5/:$PERL5LIB" >> .bashrc
