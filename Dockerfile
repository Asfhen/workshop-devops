# FROM: it's used to create the base of the image
# here for exemple we are using the node js image as a base.
# And is mandatory to have at least one in the file.
FROM node:alpine

# WORKDIR: it's used to define a directory inside the container
# where all the work is going to be done. Although is not a
# mandatory command inside the Dockerfile, it's usefull and
# a good practice that you can have in all of your Dockerfiles
WORKDIR /usr/src/app

# COPY: the copy command is used to copy files or directories
# to the container, it's alson not a mandatory command, but
# without it you would have an empty container, here it's
# being used to copy the dependencies of the file.
COPY package.json yarn.lock ./

# RUN: it's used to run terminal commands inside the container
# and is also not mandatory to have one. Here we have an
# explen of a bad practice since the idea is to keep the image
# as small as possible so we can reduce these commands with a
# single line like this: 
# RUN yarn \
#     && yarn add mongodb swr \
#     && yarn add @types/mongodb -D
RUN yarn
RUN yarn add mongodb swr
RUN yarn add @types/mongodb -D

# Now with all the packages installed we can copy our code
# to the container. This command will copy everything from
# the path were the Dockerfile is to inside the WORKDIR we
# previously defined.
COPY . .

# EXPOSE: the expose command defines a port to access the
# container, so here we defined that we want to access this
# container only on the port 3000, and without the expose we
# wouldn't be able to access anything from outside the container
EXPOSE 3000

# CMD: and as the last command we use the CMD to run the
# application.
CMD ["yarn", "dev"]

# We use the CMD here instead of the RUN command beacuse of the way
# both of these commands works, RUN will use your terminal to run
# something and it can be used multiple times, while the CMD
# will run a command inside the container, which means that in
# order to run something the container must be finished that is
# also why, when you use the CMD nothing will be done after it.