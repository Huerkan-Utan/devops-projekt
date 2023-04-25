from flask import Flask
import socket

app = Flask(__name__)

@app.route('/')
def hello_world():
    HN = socket.gethostname()
    return "ich bin {}\n".format(HN)

if __name__ == '__main__':
    app.run(port=5000)