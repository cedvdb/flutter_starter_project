import { firestore } from 'firebase-admin';

export interface Order {
  id?: string;
  total: number;
  items: OrderItem[];
  restaurant: string;
  quantity: number;
  status: OrderStatus;
  paid?: boolean;
  error?: string;
  table: number;
  createdAt?: firestore.Timestamp;
  tzOffset?: number;
}

export interface OrderItem {
  total: number;
  price: number;
  name: string;
  size?: string;
  menuItem: string;
  quantity: number;
}

export enum OrderStatus {
  PENDING = 'pending',
  UNVERIFIED = 'unverified',
  VERIFIED = 'verified',
  PROCESSED = 'processed',
  READY = 'ready',
  SERVED = 'served',
  PAID = 'paid'
}
