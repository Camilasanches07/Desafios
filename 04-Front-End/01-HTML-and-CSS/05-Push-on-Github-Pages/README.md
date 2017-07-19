## Setup

We don't want to keep your profile within `fullstack-challenges` because we want to version it with `git` as a separate project. So let's copy your profile as an independent folder and jump into it:


```bash
cp -r ../04-Advanced-selectors/profile ~/code/$GITHUB_USERNAME
cd ~/code/$GITHUB_USERNAME/profile
```

## Create the Github repo

Let's install the `hub` gem to create a Github repo from your terminal without opening your browser (very cool when you are lazy 😉)

```bash
gem install hub
```

Now you can init a git repository, commit your changes, and create the associated Github repo.

```bash
git init
git add .
git commit -m "my profile page"
hub create # this creates the associated repo on Github!
```

To open the Github repo from your browser you can run:

```bash
hub browse
```

## Github Pages

[Github Pages](https://pages.github.com/) is a sub-service of Github, very convenient to deploy any **static website** in 10 seconds (static == not a Rails app). It is based on a "magic" branch, called `gh-pages`. When Github detects this branch, it puts your website online, how cool! Let's create this magic branch and push it.

```bash
git co -b gh-pages
git push origin gh-pages # we push the gh-pages branch, not master!
```

Now you can build the URL `http://<user.github_nickname>.github.io/profile/` (it's the URL built automatically by Github) and have a look at your masterpiece, it's online! Share it on Slack with your buddies.

From now and until the end of the day, you can keep working in your `~/code/<user.github_nickname>/profile` directory AND on the `gh-pages` branch. Thus, any updates of your profile can be pushed on `http://<user.github_nickname>.github.io/profile/` through usual git commands:

```bash
git add .
git commit -m "make my profile prettier"
git push origin gh-pages
```
