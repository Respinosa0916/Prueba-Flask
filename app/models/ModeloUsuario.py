from .entities.Usuario import Usuario
from .entities.TipoUsuario import TipoUsuario

from werkzeug.security import generate_password_hash


class ModeloUsuario:

    @classmethod
    def login(self, db, usuario):
        try:
            cursor = db.connection.cursor()
            sql = """SELECT id, usuario, password 
                    FROM usuario WHERE usuario = '{0}'""".format(
                usuario.usuario
            )
            cursor.execute(sql)
            data = cursor.fetchone()
            if data != None:
                coincide = Usuario.verificar_password(data[2], usuario.password)
                if coincide:
                    usuario_logeado = Usuario(data[0], data[1], None, None)
                    return usuario_logeado
                else:
                    return None
            else:
                return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def obtener_por_id(self, db, id):
        try:
            cursor = db.connection.cursor()
            sql = """SELECT USU.id, USU.usuario, TIP.id, TIP.nombre
                    FROM usuario USU JOIN tipousuario TIP ON USU.tipousuario_id = TIP.id 
                    WHERE USU.id = {0}""".format(
                id
            )
            cursor.execute(sql)
            data = cursor.fetchone()
            tipousuario = TipoUsuario(data[2], data[3])
            usuario_logeado = Usuario(data[0], data[1], None, tipousuario)
            return usuario_logeado
        except Exception as ex:
            raise Exception(ex)
        
    @classmethod
    def registrar(cls, db, usuario):
        try:
            cursor = db.connection.cursor()  # Crear cursor desde la conexión
            hashed_password = generate_password_hash(usuario.password, method='pbkdf2:sha256', salt_length=16)
            sql = """
                INSERT INTO usuario (usuario, password, tipousuario_id)
                VALUES (%s, %s, %s)
            """
            values = (usuario.usuario, hashed_password, usuario.tipousuario)
            
            cursor.execute(sql, values)  # Ejecutar la consulta
            db.connection.commit()  # Confirmar los cambios en la base de datos
            return True  # Retornar éxito si no ocurre ningún error
        except Exception as ex:
            db.connection.rollback()  # Revertir los cambios en caso de error
            raise Exception(f"Error al registrar el usuario: {ex}")  # Lanzar excepción con el error
