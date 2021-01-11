

export interface Role {
  user: string;
  restaurant: string;
  role: RoleName;
}

export enum RoleName {
  OWNER = 'owner',
  MANAGER = 'manager',
  EMPLOYEE = 'employee'
}
