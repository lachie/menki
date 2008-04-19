# Menki - A blogging base for the discerning developer

[http://menkiblog.com](http://menkiblog.com)

Inspired by its fashionable cousin [Enki](http://enkiblog.com), Menki is a base to build your own blog upon.

No configuring, funky template languages, needing to monkey patch your
additions with plugins or any of that non-sense. Simply branch, customise and
when Menki gets updated you can rebase your branch. Menki is lean and mean to
help make upgrades as painless as possible. Use of a decent SCM is highly
recommended.

What Menki's got:

* [Merb](http://merbivore.com)
* [Datamapper](http://datamapper.org/) for the model
* [OpenID](http://openid.net/) for the admin (multiple logins)
* [HAML](http://haml.hamptoncatlin.com/) for the pretty bits (HAML == less code == cleaner merging)
* ATOM
* /posts/post-title URLs
* Choice of post format: HAML, Markdown, Textile or straight HTML
* Basic admin live preview and draft auto-saving

What Menki features are planned to be added soon:

* μFormats
* Comments
* Sexytime Admin

What you won't find under Menki's skirt:

* A pre-baked stylesheet
* Pages - you can add easily add these yourself


## Get up and running

### Step 1: Grab Menki

    git clone git@github.com:toolmantim/menki.git
    cd menki
    mate config/database.yml
    rake dm:db:automigrate
    merb

### Step 2: Customise

* Edit config/menki.yml
* Edit the views adding your own stylesheets etc
* Hit http://127.0.0.1:4000/
* Add a post via http://127.0.0.1:4000/admin

### Step 3

* Profit


## Currently Powering

Nothing yet.


## Support

[http://groups.google.com/group/menki](http://groups.google.com/group/menki)


## Contributing

Bugfixes are always welcome, new features too if they're fitting with the
Menki vibe. The [mailing list](http://groups.google.com/group/menki) is the best place for discussions, a git repo
somewhere I can pull from is the best place for patches. [Github](http://github.com/toolmantim/menki/)'s fun because
we get to look at pretty pictures and things:
[http://github.com/toolmantim/menki/network](http://github.com/toolmantim/menki/network)


## Contributors

* [Tim Lucas](http://toolmantim.com)
* You?