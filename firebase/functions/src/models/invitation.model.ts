import { firestore } from 'firebase-admin';


export interface Invitation {
  id?: string;
  email: string;
  restaurant: string;
  restaurantName: string;
  senderName: string;
  createdAt: firestore.Timestamp;
  createdBy: string;
  status?: InvitationStatus;
  userId?: string;
}


export enum InvitationStatus {
  ACCEPTED = 'accepted',
  REFUSED = 'refused'
}

