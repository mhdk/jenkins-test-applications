# "render_template" looks for a template (HTML file) in the
# "templates" folder.
from flask import Flask

# creating instance of the Flask class and calling it "app".
app = Flask(__name__)

# We need to import our routes, however our routes are importing
# the app variable so we can't import them at the top of the file
# otherwise we will get into a circular import.
from flaskapp import routes