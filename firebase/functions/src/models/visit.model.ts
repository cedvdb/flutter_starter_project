import { firestore } from 'firebase-admin';


export interface Visit {
  restaurant: string;
  firstname: string;
  lastname: string;
  email: string;
  tel: string;
  createdAt: firestore.Timestamp;
  anonymous: boolean;
}

