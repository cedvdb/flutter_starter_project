
import { firestore } from 'firebase-admin';
import { db } from '../../db';
import { Col } from '../../models';

export function createInitialMenu(id: string) {
  const menu = getMenu();
  return db.collection(Col.MENUS).doc(id).set(menu);
}

function getMenu() {
  return {
    createdAt: firestore.Timestamp.now(),
    sections: [],
    items: {}
  };
}
