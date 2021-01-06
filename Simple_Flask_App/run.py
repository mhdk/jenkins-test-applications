#
# Flask takes care of server side processing. The code receives
# requests and deal with them, including sending responses.
#
# We have our html templates stored in the "templates" folder,
# where flask will look for them.
#
# We also have a folder called "static", in which we store our
# CSS, JavaScript, images and other necessary files. Within this folder
# we also create a "css" folder to store our stylesheets.
#

# We need to import the app to run from our package.
# This will import from the __init__.py file within that package.
# So, the "app" variable has to exist within "__init__.py".
from flaskapp import app

if __name__ == "__main__":
    # Run the application. "debug=True" allows python errors
    # to appear on the web page.
    app.run(debug=True)