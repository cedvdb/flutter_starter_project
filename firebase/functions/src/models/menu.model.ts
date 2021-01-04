import { firestore } from 'firebase-admin';

export interface Menu {
  id: string;
  restaurant: string;
  sections: MenuSection[];
  createdAt: firestore.Timestamp;
  items: { [key: string]: MenuItem };
}

export interface MenuSection {
  id: string;
  title: string;
  type: MenuSectionType;
  items: string[];
}

export type MenuSectionType = 'foods' | 'drinks';

export interface MenuItem {
  id: string;
  name: string;
  prices: Price[];
  description?: string;
  section: string;
}

export interface Price {
  size: string;
  price: number;
  currency: 'eur';
}
