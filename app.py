from flask import Flask
from flask import jsonify
app = Flask(__name__)

@app.route('/')
def hello_geek():
    return '<h1>Hello from Flask & Docker</h2>'

@app.route('/health')
def health():
    """health route"""
    state = {"status": "UP"}
    return jsonify(state)

if __name__ == "__main__":
    app.run(debug=True)