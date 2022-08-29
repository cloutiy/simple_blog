# README

This is my first Rails application.

I'm sure it's a bit messy, but it will get cleaner as I get more comfortable and with my mentor's feedback.

My main focus was:

- Getting to know Rail's CRUD
- Build a simple authentication and authorization system (no small feat for a first application)

Following the course https://mixandgo.com/lp/practical-ruby-on-rails-for-beginners.

## The basic requirements

### Simple login and registration

- From scratch
- Ability to create an account
- Ability to log in (but not log out yet)

### Users should be able to:

- Create posts
- List all the posts (displaying the title and author - each post should belong to a user)
- Update posts
- See the details page of a specific post
- If someone is not logged in, he/she can only see posts, but not edit them.

### Things I'm not concerned about at the moment:

- CSS or styling
- UX
- Optimizing layout and extracting out partials for reuse
- Optimizing code. The `PostsController` has some repeating code which should ideally be extracted into separate methods for reuse.

### Things I know don't work properly

- `flash` messages sometimes "stick". I need to consult on best practices on this one. When is clearing flash messages typically done?
- No ability to log out (was not a requirement)
