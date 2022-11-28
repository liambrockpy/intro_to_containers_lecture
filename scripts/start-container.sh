docker run -it \
    -p 3000:3000 \
    --name my-project \
    --mount type=bind,src="$(pwd)",dst=/code \
    -w /code \
    node:latest \
    bash -c "npm i && npm run dev"
