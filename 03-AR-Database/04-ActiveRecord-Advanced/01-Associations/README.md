## Background & Objectives

Let's take our HackerNews application where we left it. Now we want to add
a user layer, so that you need to log in first before submitting a new post.

You don't need to log in to view posts.

## Setup

We gave you a first migration to create the `posts` table.

```bash
rake db:create
rake db:migrate
```

## Specs

### Add a `User` model

We provide you the basic schema of posts (see existing migration in `db/migrate` folder).

First generate a new migration to
create the `User` model. The model should have the following fields:

- `username`
- `email`

### Migration: a User has many posts

Generate another migration to create a one-to-many reference between `User` and `Post`.

Make sure you add the code in your models to access posts from a user instance,
and the user from a given post instance.

### Seed with user and posts

Write a seed that populate your database with 5 users and between 5 and 10 posts per user. Feel free to use any strategy you want (faker or API).

Don't spend to much time trying to use the API. Remember that our goal here is to work with associations.
