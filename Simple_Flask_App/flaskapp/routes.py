# Import the necessary modules here.
# We can see that our decorators are created with "@app", so we
# need to import the "app" variable into our routes. We do this
# by importing from our package.
from flask import render_template
from flaskapp import app

# the default page ("localhost:5000/"). Viewing the HTML home file.
@app.route("/")
def home():
    return render_template("home.html")

# another route ("localhost:5000/about"). Viewing the HTML about file.
@app.route("/about")
def about():
    return render_template("about.html")