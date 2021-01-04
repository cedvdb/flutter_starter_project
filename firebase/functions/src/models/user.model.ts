import { firestore } from 'firebase-admin';


export interface User {
  id: string;
  name?: string;
  picture?: string;
  createdAt: firestore.Timestamp;
  restaurantSelected?: string;
}

