enum SubscriptionMonth {
  one,
  three,
  six;

  String get asTitle {
    switch (this) {
      case SubscriptionMonth.one:
        return '1 ay/10 tmt';
      case SubscriptionMonth.three:
        return '3 ay/30 tmt';
      case SubscriptionMonth.six:
        return '6 ay/60 tmt';
    }
  }

  int get asSentValue {
    switch (this) {
      case SubscriptionMonth.one:
        return 1;
      case SubscriptionMonth.three:
        return 3;
      case SubscriptionMonth.six:
        return 6;
    }
  }
}
