import { db } from '../../db';
import { Col } from '../../models';
import { User } from '../../models/user.model';


export function createUser(user: User) {
  return db.collection(Col.USERS).doc(user.id).set(user);
}