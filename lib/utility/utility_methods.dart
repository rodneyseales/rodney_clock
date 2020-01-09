String getDayofMonthSuffix(final int n) {
  if (n >= 1 && n <= 31) {
    if (n >= 11 && n <= 13) {
      return 'th';
    }
    switch (n % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
  return 'Something bad happened';
}

String dateString(DateTime date) {
  String strDate = '';
  String strWeekday = '';
  String strSuffix = '';

  switch (date.weekday) {
    case 1:
      strWeekday += 'Monday';
      break;
    case 2:
      strWeekday += 'Tuesday';
      break;
    case 3:
      strWeekday += 'Wednesday';
      break;
    case 4:
      strWeekday += 'Thursday';
      break;
    case 5:
      strWeekday += 'Friday';
      break;
    case 6:
      strWeekday += 'Saturday';
      break;
    case 7:
      strWeekday += 'Sunday';
      break;
  }

  switch (date.month) {
    case 1:
      strDate += 'January';
      break;
    case 2:
      strDate += 'February';
      break;
    case 3:
      strDate += 'March';
      break;
    case 4:
      strDate += 'April';
      break;
    case 5:
      strDate += 'May';
      break;
    case 6:
      strDate += 'June';
      break;
    case 7:
      strDate += 'July';
      break;
    case 8:
      strDate += 'August';
      break;
    case 9:
      strDate += 'September';
      break;
    case 10:
      strDate += 'October';
      break;
    case 11:
      strDate += 'November';
      break;
    case 12:
      strDate += 'December';
      break;
  }

  strSuffix = getDayofMonthSuffix(date.day);

  return '$strWeekday, $strDate ${date.day}$strSuffix';
}