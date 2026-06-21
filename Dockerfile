FROM node:20.10.0-alpine3.18

#cria automaticamente o diretório home do usuário
# O parâmetro -m cria automaticamente o diretório home
# Exemplo: /home/lucas
RUN useradd -m lucas

WORKDIR /app

# Copia os arquivos package.json e package-lock.json para o diretório de trabalho, garantindo que o usuário "lucas" seja o proprietário dos arquivos
COPY --chown=lucas:lucas /src/package*.json .

# Muda o usuário para "lucas" para as próximas instruções
USER lucas

RUN npm install

# Copia o restante dos arquivos do projeto para o diretório de trabalho, garantindo que o usuário "lucas" seja o proprietário dos arquivos
COPY --chown=lucas:lucas /src .

EXPOSE 8080 

CMD ["node", "server.js"]