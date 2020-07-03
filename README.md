# GitHubUsers

## Requirements:
1. to download Github User list from Github API
2. to show Github users in a list (optional: with pagination)
3. (optional) create a single user page for each user
4. Reauired: implement with MVVM architecture

## Implementation
1. implemente `User` for data model
2. `APIManager` will be a central control for API calls
3. implemented `UserListViewModel` for fetch from api and store User model
4. implemented `UserItemViewModel` for displaying a user cell in table
5. extract protocols for `ListViewModel` and `ItemViewModel`
6. implement a general list ViewController to show users in table
7. implement a general cell for displaying a user item
