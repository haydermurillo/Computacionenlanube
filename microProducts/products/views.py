from flask import Flask, render_template, jsonify
from products.controllers.product_controller import product_controller
from db.db import db
from flask_cors import CORS
import requests
import os
import time

app = Flask(__name__)
app.secret_key = 'secret123'
app.config.from_object('config.Config')
db.init_app(app)

# Registrando el blueprint del controlador de usuarios
app.register_blueprint(product_controller)
CORS(app, supports_credentials=True)

@app.route('/health')
def health():
    try:
        # Simple health check that doesn't require DB connection
        return jsonify(status="healthy", service="microProducts"), 200
    except Exception as e:
        return jsonify(status="unhealthy", reason=str(e)), 500

if __name__ == '__main__':
    with app.app_context():
        try:
            db.create_all()  # Ensure tables are created
        except Exception as e:
            print(f"Warning: Could not create tables: {e}")
    
    app.run(host='0.0.0.0', port=5003)
