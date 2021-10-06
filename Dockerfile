# Definindo a imagem a ser utilizada no container
FROM node:alpine

# Definindo o diretorio onde sera copiado o codigo
WORKDIR /usr/src/app

# Fazendo uma copia do package.json para dentro do container
COPY package.json ./

# Com o package.json ja dentro do nosso container agora vamos
# rodar as instalações com o node
RUN npm install -g next
RUN npm install -y

# Agora com todos os pacotes já instalados vamos fazer uma copia
# das pastas para nosso workspace
COPY . .

# Vamos expor uma porta para acessar o container por fora
EXPOSE 3000

# E por fim vamos rodar o aplicativo
CMD ["npm", "run", "dev"]

# Porque usamos o CMD aqui em cima ao inves de um RUN como das
# outras vezes? A explicação é simples, o CMD sinaliza o ultimo
# comando que deve ser rodado pelo Docker, ou seja, se utilizassemos
# o RUN o docker nunca terminaria de Buildar o container