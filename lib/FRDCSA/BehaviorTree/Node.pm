package FRDCSA::BehaviorTree::Node;

use Data::Dumper;

use Time::HiRes qw(usleep);

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / Name Description Parent Children Status /

  ];

sub init {
  my ($self,%args) = @_;
  my $ref = ref($self);
  $ref =~ s/.*:://;
  $self->Name($args{Name} || $ref.'-'.rand());
  $self->Description($args{Description} || '');
  $self->Parent($args{Parent});
  $self->Children($args{Children} || []);
  $self->Status($args{Status});
  foreach my $child (@{$self->Children}) {
    if (! defined $child->Parent) {
      $child->Parent($self);
    }
  }
}

# some comments from:
# http://magicscrollsofcode.blogspot.com/2010/12/behavior-trees-by-example-ai-in-android.html


# As in any BT node, a CheckConditions and a DoAction functions,

sub CheckConditions {
  my ($self,%args) = @_;
  # to check if the node can be updated,
}

sub DoAction {
  my ($self,%args) = @_;
  # and to actually update the node, respectively.
}

# sub Start {
#   my ($self,%args) = @_; 
# }

sub Stop {
  my ($self,%args) = @_; 
  $self->Status($args{Status});
  if (defined $self->Children) {
    foreach my $child (@{$self->Children}) {
      $child->Stop(Status => $self->Status);
    }
  }
}

# The Start and End functions are called

sub Start {
  my ($self,%args) = @_;
  # just before starting to update the node,
}


sub End {
  my ($self,%args) = @_;
  # and just after finishing the logic of the node.
}

sub Tick {
  my ($self, %args) = @_;
  $self->Status('running');
  $self->Log(Message => 'Ticking node: '.$self->Name);
  return {
	  Status => $self->Status,
	 };
}

sub Log {
  my ($self, %args) = @_;
  print $args{Message}."\n";
}

sub NonblockingSleep {
  my ($self, %args) = @_;
  usleep(100);
}

1;


