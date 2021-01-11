

import { firestore } from 'firebase-admin';
import * as functions from 'firebase-functions';
import { db } from '../../db';
import { Col } from '../../models/collections.enum';
import { createInitialAnalytics } from './create-initial-analytics';
import { createInitialMenu } from './create-initial-menu';
import { createInitialRoles } from './create-initial-roles';



export const createRestaurant = functions.https.onCall(async (data, context) => {
  const restaurant = data;
  const uid = context.auth?.uid;
  if (!uid) {
    return;
  }
  restaurant.createdBy = context.auth?.uid;
  restaurant.createdAt = firestore.Timestamp.now();
  const restaurantDoc = db.collection(Col.RESTAURANTS).doc();
  const restaurantId = restaurantDoc.id;
  const restaurantPromise = restaurantDoc.set(restaurant);
  const rolesPromise = createInitialRoles(restaurantId, uid);
  const menuPromise = createInitialMenu(restaurantId);
  const analyticsPromise = createInitialAnalytics(restaurantId);
  await Promise.all([restaurantPromise, rolesPromise, menuPromise, , analyticsPromise]);
  return restaurantId;
});
