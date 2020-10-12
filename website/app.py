from flask import Flask

app = Flask(__name__)


@app.route("/")
def index() :
    return "<p>This is blank page</p"


if __name__ == "__main__" :
    app.run(port=8080)
