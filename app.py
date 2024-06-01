from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route('/<name>')
def hello_name(name):
    now = datetime.now()
    current_time = now.strftime("%Y-%m-%d %H:%M:%S")
    return f"Hello world from Nick Reiter. Current date and time is: {current_time}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
