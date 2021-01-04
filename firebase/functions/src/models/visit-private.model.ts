import { firestore } from 'firebase-admin';

export interface VisitPrivate {
  restaurant: string;
  user: string;
  createdAt: firestore.Timestamp;
  skip: boolean;
}
