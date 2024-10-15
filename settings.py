from pydantic import PostgresDsn
from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    ACCESS_TOKEN_SECRET: str
    REFRESH_TOKEN_SECRET: str
    RESET_PASSWORD_SECRET: str

    SECRET_KEY: str  # Secret key for Its Dangerous

    MAIL_USERNAME: str
    MAIL_FROM: str
    MAIL_PASSWORD: str
    MAIL_PORT: int
    MAIL_SERVER: str
    MAIL_FROM_NAME: str

    REDIS_HOST: str
    REDIS_PORT: int

    AWS_ACCESS_KEY: str
    AWS_SECRET_KEY: str
    AWS_REGION: str
    BUCKET_NAME: str
    CLOUDFRONT_URL: str

    JWT_ALGORITHM: str

    GOOGLE_CLIENT_ID: str
    GOOGLE_CLIENT_SECRET: str
    GOOGLE_REDIRECT_URI: str

    POSTGRES_PASSWORD: str | None
    POSTGRES_HOST: str
    DATABASE_NAME: str
    POSTGRES_PORT: int
    POSTGRES_USER: str

    @property
    def POSTGRES_URL(self) -> PostgresDsn:
        return PostgresDsn.build(
            scheme="postgresql+asyncpg",
            username=self.POSTGRES_USER,
            password=(
                self.POSTGRES_PASSWORD if len(self.POSTGRES_PASSWORD) > 0 else None
            ),
            host=self.POSTGRES_HOST,
            path=self.DATABASE_NAME,
            port=self.POSTGRES_PORT,
        )
