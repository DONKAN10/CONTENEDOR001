FROM node:20-alpine

# Directorio de trabajo en el contenedor
WORKDIR /copiadoc

# Copiamos solo los archivos de dependencias para caching (desde la raíz del contexto de app1 o app2)
COPY package*.json ./

# Instalamos dependencias
RUN npm ci && npm cache clean --force

# Copiamos el resto del código (desde la raíz del contexto de app1 o app2)
COPY . .

# Expone los puertos (solo documentación)
EXPOSE 3000
EXPOSE 3001

# Comando de inicio
CMD ["node", "app.js","index.js"]