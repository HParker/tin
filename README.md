cuba-app
========

Harmoni's template for Cuba applications.

Usage
-----

For information about usage, execute:

```
$ make
```

This will list the available tasks this project has.

Requirements
------------

- Ruby 2.0+
- Redis 2.8+

Installation
------------

Use git to clone the repository:

```
$ git clone git@github.com:harmoni/cuba-app.git <app_name>
```

Switch to the application folder:

```
$ cd <app_name>
```

Execute the following commands:

```
$ rm -rf .git
$ make install
```

Now test the application by running:

```
$ make server
```

Open <http://localhost:9393>. You will see Cuba's project homepage.

Examples
--------

- Reddit-like application: <https://github.com/harmoni/readit>
