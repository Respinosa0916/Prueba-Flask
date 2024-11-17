from app import crear_app
from config import config

configuracion=config['development']
app = crear_app(configuracion)


if __name__ == '__main__':
    # Ejecuta el servidor utilizando el manager
    app.run(host='127.0.0.1', port=5000)
