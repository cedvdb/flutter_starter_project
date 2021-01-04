

export interface Roles {
  [userId: string]: Role;
}

export enum Role {
  OWNER = 'owner',
  MANAGER = 'manager',
  EMPLOYEE = 'employee'
}
