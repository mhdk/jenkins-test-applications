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


# "render_template" looks for a template (HTML file) in the
# "templates" folder.
from flask import Flask, render_template

# creating instance of the Flask class and calling it "app".
app = Flask(__name__)

# the default page ("localhost:5000/"). Viewing the HTML home file.
@app.route("/")
def home():
    return render_template("home.html")

# another route ("localhost:5000/about"). Viewing the HTML about file.
@app.route("/about")
def about():
    return render_template("about.html")
    
if __name__ == "__main__":
    # Run the application. "debug=True" allows python errors
    # to appear on the web page.
    app.run(debug=True)