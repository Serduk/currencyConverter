class FlagConverter {
  static String getFlagByCurrency(String currency) {
    switch(currency) {
    case 'AUD': return 'AUS';
    break;
    case 'BGN': return 'BGR';
    break;
    case 'BRL': return 'BRA';
    break;
    case 'CAD': return 'CAN';
    break;
    case 'CHF': return 'LIE';
    break;
    case 'CNY': return 'CHN';
    break;
    case 'CZK': return 'CZE';
    break;
    case 'DKK': return 'DNK';
    break;
    case 'GBP': return 'GBR';
    break;
    case 'HKD': return 'HKG';
    break;
    case 'HRK': return 'HRV';
    break;
    case 'HUF': return 'HUN';
    break;
    case 'IDR': return 'IDN';
    break;
    case 'ILS': return 'ISR';
    break;
    case 'INR': return 'BTN';
    break;
    case 'ISK': return 'ISL';
    break;
    case 'JPY': return 'JPN';
    break;
    case 'KRW': return 'PRK';
    break;
    case 'MXN': return 'MEX';
    break;
    case 'MYR': return 'MYS';
    break;
    case 'NOK': return 'NOR';
    break;
    case 'NZD': return 'NZL';
    break;
    case 'PHP': return 'PHL';
    break;
    case 'PLN': return 'POL';
    break;
    case 'RON': return 'ROU';
    break;
    case 'RUB': return 'RUS';
    break;
    case 'SEK': return 'SWE';
    break;
    case 'SGD': return 'SGP';
    break;
    case 'THB': return 'THA';
    break;
    case 'TRY': return 'TUR';
    break;
    case 'USD': return 'USA';
    break;
    case 'ZAR': return 'LSO';
    break;
      default: return '';
    }
  }
}