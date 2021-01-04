

export interface Analytics {
  orders: number;
  quantity: number;
  total: number;
  monthly: Record<Months, AnalyticData>;
  daily: Record<Days, AnalyticData>;
  hourly: Record<Hours, AnalyticData>;
  items: ItemData;
}

export interface AnalyticData {
  orders: number;
  quantity: number;
  total: number;
  items: ItemData;
}

export interface ItemData {
  [id: string]: {
    id: string;
    name: string;
    quantity: number;
    total: number;
  };
}


export enum Months {
  JANUARY = 'january',
  FEBRUARY = 'february',
  MARCH = 'march',
  APRIL = 'april',
  MAY = 'may',
  JUNE = 'june',
  JULY = 'july',
  AUGUST = 'august',
  SEPTEMBER = 'september',
  OCTOBER = 'october',
  NOVEMBER = 'november',
  DECEMBER = 'december'
}

export const monthsArray = [
  Months.JANUARY,
  Months.FEBRUARY,
  Months.MARCH,
  Months.APRIL,
  Months.MAY,
  Months.JUNE,
  Months.JULY,
  Months.AUGUST,
  Months.SEPTEMBER,
  Months.OCTOBER,
  Months.NOVEMBER,
  Months.DECEMBER
];


export enum Days {
  MONDAY = 'monday',
  TUESDAY = 'tuesday',
  WEDNESDAY = 'wednesday',
  THURSDAY = 'thursday',
  FRIDAY = 'friday',
  SATURDAY = 'saturday',
  SUNDAY = 'sunday'
}

export const daysArray = [
  Days.MONDAY,
  Days.TUESDAY,
  Days.WEDNESDAY,
  Days.THURSDAY,
  Days.FRIDAY,
  Days.SATURDAY,
  Days.SUNDAY
];

export enum Hours {
  H00 = '00',
  H01 = '01',
  H02 = '02',
  H03 = '03',
  H04 = '04',
  H05 = '05',
  H06 = '06',
  H07 = '07',
  H08 = '08',
  H09 = '09',
  H10 = '10',
  H11 = '11',
  H12 = '12',
  H13 = '13',
  H14 = '14',
  H15 = '15',
  H16 = '16',
  H17 = '17',
  H18 = '18',
  H19 = '19',
  H20 = '20',
  H21 = '21',
  H22 = '22',
  H23 = '23'
}

export const hoursArray = [
  Hours.H00,
  Hours.H01,
  Hours.H02,
  Hours.H03,
  Hours.H04,
  Hours.H05,
  Hours.H06,
  Hours.H07,
  Hours.H08,
  Hours.H09,
  Hours.H10,
  Hours.H11,
  Hours.H12,
  Hours.H13,
  Hours.H14,
  Hours.H15,
  Hours.H16,
  Hours.H17,
  Hours.H18,
  Hours.H19,
  Hours.H20,
  Hours.H21,
  Hours.H22,
  Hours.H23
];
