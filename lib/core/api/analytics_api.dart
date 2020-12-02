

class RestaurantAPI {
  Stream
  
  private roles: Observable<Roles[]> = this.userSrv.user$.pipe(
    map(user => user.id),
    switchMap(userId => this.fs.collection<Roles>(
        Col.ROLES,
        ref => ref.where(userId, 'in', Object.values(Role))
      ).valueChanges({ idField: 'id'})
    ),
    shareReplay(1),
  );

  restaurants$: Observable<Restaurant[]> = this.roles.pipe(
    filter(roles => roles.length > 0),
    map(roles => roles.map(role => role.id)),
    switchMap(ids => this.fs.collection<Restaurant>(
        Col.RESTAURANTS,
        ref => ref.where(firestore.FieldPath.documentId(), 'in', ids)
      ).valueChanges({ idField: 'id' })
    ),
    shareReplay(1),
  );

  hasRestaurant$: Observable<boolean> = this.roles.pipe(
    map(restaurants => restaurants && restaurants.length > 0),
    shareReplay(1)
  );

  selectedRestaurant$: Observable<Restaurant> = combineLatest([
    this.userSrv.user$,
    this.restaurants$
  ]).pipe(
    map(([user, restaurants]) => restaurants.find(r => r.id === user.restaurantSelected)),
    filter(restaurant => !!restaurant),
    tap(restaurant => this.selectedRestaurantSync = restaurant),
    shareReplay(1),
  );

  /** to make it easier to work with the selected restaurant */
  selectedRestaurantSync: Restaurant;

  constructor(
    private fs: AngularFirestore,
    private userSrv: UserService
  ) { }

  async createRestaurant(restaurant: Restaurant) {
    try {
      const added = await this.fs.collection<Restaurant>(Col.RESTAURANTS).add({
        ...restaurant,
        tables: 1,
        createdAt: firestore.FieldValue.serverTimestamp() as any,
        createdBy: this.userSrv.userSync.id
      });
      await this.userSrv.update({ restaurantSelected: added.id });
      // wait for selected restaurant
      await this.selectedRestaurant$.pipe(
        filter(r => r.id === added.id),
        take(1)
      ).toPromise();
      return added;
    } catch (e) {
      console.error(e);
    }
  }

  select(restaurant: string) {
    return this.userSrv.update({ restaurantSelected: restaurant });
  }

  update(restaurant: Restaurant) {
    return this.fs.collection(Col.RESTAURANTS)
      .doc<Restaurant>(restaurant.id)
      .set(restaurant, { merge: true });
  }

}