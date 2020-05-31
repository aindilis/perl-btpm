package FRDCSA::BehaviorTree::ActiveSelector;

use base 'FRDCSA::BehaviorTree::Monitor';

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw /  /

  ];

=head1 NAME

FRDCSA::BehaviorTree::ActiveSelector -

=head1 DESCRIPTION

Part of a pure-Perl behavior tree implementation.  Implemention based
on 'The Behavior Tree Starter Kit' (Chapter 6) by Alex J. Champandard
and Philip Dunstan, and the BTSK GitHub code.  Documentation
paraphrased.

=head1 SYNOPSIS


=head1 AUTHOR

Andrew John Dougherty

=head1 LICENSE

GPLv3

=cut

=item init()

=cut

sub init {
  my ($self,%args) = @_;
  $self->SUPER::init(%args);
}

sub DESTROY {
  my ($self,%args) = @_;
  $self->SUPER::DESTROY(%args);
}

=item onInitialize()

=cut

sub onInitialize {
  my ($self,%args) = @_;
  $self->SUPER::onInitialize(%args);
}


=item update()

=cut

sub update {
  my ($self,%args) = @_;
  $self->SUPER::update(%args);
  my $prev = $self->m_CurrentChild;
  FRDCSA::BehaviorTree::Selector::onInitialize($self);
  my $result = FRDCSA::BehaviorTree::Selector::update($self);
  if ($prev != $self->m_Children->[-1] and $self->m_CurrentChild != $prev) {
    $prev->abort();
  }
  return $result;
}

=item onTerminate($status)

=cut

sub onTerminate {
  my ($self,%args) = @_;
  $self->SUPER::onTerminate(%args);
}

=item tick()

=cut

sub tick {
  my ($self,%args) = @_;
  $self->SUPER::tick(%args);
}

=item addChild()

=cut

sub addChild {
  my ($self,%args) = @_;
  $self->SUPER::addChild(%args);
  # $args{Child};
}

=item removeChild()

=cut

sub removeChild {
  my ($self,%args) = @_;
  $self->SUPER::removeChild(%args);
  # $args{Child};
}

=item clearChildren()

=cut

sub clearChildren {
  my ($self,%args) = @_;
  $self->SUPER::clearChildren(%args);
}

=item addCondition()

=cut

sub addCondition {
  my ($self,%args) = @_;
  $self->SUPER::addCondition(%args);
}

=item addCondition()

=cut

sub addAction {
  my ($self,%args) = @_;
  $self->SUPER::addAction(%args);
}


1;
