import { firestore } from 'firebase-admin';


export interface Restaurant {
  id?: string;
  name?: string;
  description?: string;
  tables?: number;
  createdAt?: firestore.Timestamp;
  createdBy?: string;
}
