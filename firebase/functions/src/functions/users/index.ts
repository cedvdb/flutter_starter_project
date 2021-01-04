import { firestore } from 'firebase-admin';
import * as functions from 'firebase-functions';
import { createUser } from './create-user';

export const createUserOnAuth = functions.auth.user().onCreate((authUser) => {
  return createUser({
    id: authUser.uid,
    name: authUser.displayName,
    picture: authUser.photoURL,
    createdAt: firestore.Timestamp.now()
  });
});