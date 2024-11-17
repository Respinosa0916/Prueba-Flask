class Config:
    SECRET_KEY = "oYjA3m8ujvlKOypy4TCPr9X16YRxW49i"


class DevelopmentConfig(Config):
    DEBUG = True
    MYSQL_HOST = "localhost"
    MYSQL_USER = "root"
    MYSQL_PASSWORD = ""
    MYSQL_DB = "tienda"


config = {"development": DevelopmentConfig, "default": DevelopmentConfig}
