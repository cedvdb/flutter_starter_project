import { db } from "../../db";
import { Col, Role, RoleName } from "../../models";


export function createInitialRoles(restaurantId: string, userId: string) {
  const ownerRole = getOwnerRoles(userId, restaurantId);
  return db.collection(Col.ROLES).doc(getId(userId, restaurantId)).set(ownerRole);
}

export function setUserRole(restaurantId: string, userId: string, role: RoleName) {
  return db.collection(Col.ROLES).doc(getId(userId, restaurantId)).update({ role });
}

function getId(restaurantId: string, userId: string) {
  return `${userId}:${restaurantId}`;
}

function getOwnerRoles(userId: string, restaurantId: string): Role {
  return {
    user: userId,
    restaurant: restaurantId,
    role: RoleName.OWNER
  };
}


