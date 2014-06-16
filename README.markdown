# J2B


## Inline media

Media can be embeded inline:

	<div class='media media-left'>
		<%= image_tag 'http://placehold.it/352x336' %>
		<p>Optional cutline dolor sit amet, consectetuer adipiscing elit.</p>
	</div>

	<div class='media media-right'>
		<%= image_tag 'http://placehold.it/352x336' %>
		<p>Optional cutline dolor sit amet, consectetuer adipiscing elit.</p>
	</div>

Left and right-aligned media files must be at least 352px wide.  TODO: retina.

## Development

In terminal, get to the proper directory.

Grab the latest code from GitHub:

    git pull origin master

Make sure your system files are up-to-date:

    bundle

Start the development server:

    bundle exec middleman server

Edit away. Everything that will typically need editing is in the `source` directory.

Preview the site at [http://localhost:4567/](http://localhost:4567/). Press `Ctrl + C` in the Terminal to stop the server.

Save your changes to your local Git repository:

    git add .
    git commit -m "Your message goes here"

Push your changes to the shared GitHub repository:

    git push origin master

Done.

## Show the world

If you haven't already, make sure you have the latest code:

    git pull origin master

Pre-process the stylesheets, compress the images, etc... and push it up to the server:

    bundle exec middleman deploy
