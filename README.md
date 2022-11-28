## Intro to Containers Lecture

### Study Notes

[Docker CLI Cheatsheet](https://github.com/getfutureproof/fp_guides_wiki/wiki/Docker-101-Cheatsheet)

## Demo Repo

- To run the demo repo code locally:

1. Fork and clone down the repo
2. `cd` into the folder
3. Install dependencies
   - `cd server`
   - `npm install`
4. Start your server
   - `npm run dev`

## To create the container and bind the project

- To bind the folder to a new container:

1. `cd` into the folder
2. Create these 2 files in a new folder `scripts/`...
   - `start-container.sh`:
     ```
     docker run -it \
     -p 3000:3000 \
     --name my-project \
     --mount type=bind,src="$(pwd)",dst=/code \
     -w /code \
     node:latest \
     bash -c "npm i && npm run dev"
     ```
   - `resume-container.sh`:
     ```
     docker start -i my-project
     ```
3. Add the following lines to the `"scripts"` object in your `package.json`:
   ```
   "scripts": {
       ...,
       "start-container": "bash scripts/start-container.sh",
       "dev-container": "bash scripts/resume-container.sh"
   },
   ```

#### To start the container install

1. Make sure you're in the root directory of the cloned folder
2. `npm run start-container`

#### To resume the container after exiting

1. Make sure you're in the root directory of the cloned folder
2. `npm run dev-container`
