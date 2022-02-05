**Edit a file, create a new file, and clone from Bitbucket in under 2 minutes**

When you're done, you can delete the content in this README and update the file with details for others getting started with your repository.

*We recommend that you open this README in another tab as you perform the tasks below. You can [watch our video](https://youtu.be/0ocf7u76WSo) for a full demo of all the steps in this tutorial. Open the video in a new tab to avoid leaving Bitbucket.*

---

## Edit a file

You’ll start by editing this README file to learn how to edit a file in Bitbucket.

1. Click **Source** on the left side.
2. Click the README.md link from the list of files.
3. Click the **Edit** button.
4. Delete the following text: *Delete this line to make a change to the README from Bitbucket.*
5. After making your change, click **Commit** and then **Commit** again in the dialog. The commit page will open and you’ll see the change you just made.
6. Go back to the **Source** page.

---

## Create a file

Next, you’ll add a new file to this repository.

1. Click the **New file** button at the top of the **Source** page.
2. Give the file a filename of **contributors.txt**.
3. Enter your name in the empty file space.
4. Click **Commit** and then **Commit** again in the dialog.
5. Go back to the **Source** page.

Before you move on, go ahead and explore the repository. You've already seen the **Source** page, but check out the **Commits**, **Branches**, and **Settings** pages.

---

## Clone a repository

Use these steps to clone from SourceTree, our client for using the repository command-line free. Cloning allows you to work on your files locally. If you don't yet have SourceTree, [download and install first](https://www.sourcetreeapp.com/). If you prefer to clone from the command line, see [Clone a repository](https://confluence.atlassian.com/x/4whODQ).

1. You’ll see the clone button under the **Source** heading. Click that button.
2. Now click **Check out in SourceTree**. You may need to create a SourceTree account or log in.
3. When you see the **Clone New** dialog in SourceTree, update the destination path and name if you’d like to and then click **Clone**.
4. Open the directory you just created to see your repository’s files.

Now that you're more familiar with your Bitbucket repository, go ahead and add a new file locally. You can [push your change back to Bitbucket with SourceTree](https://confluence.atlassian.com/x/iqyBMg), or you can [add, commit,](https://confluence.atlassian.com/x/8QhODQ) and [push from the command line](https://confluence.atlassian.com/x/NQ0zDQ).

## Example of Data Loss Within Docker Container
To demonstrate the features of the write layer, let’s use a container from an Ubuntu base image. We will create a file in the Docker container, stop the container, and note the behavior of the container.

1. Start by creating an nginx container:
`docker run -d --name nginx-test  nginx`
 
2.	Open a terminal within the container: `docker exec -t nginx-test bash`
 
3.	Create a copy of nginx’s default.conf to a new config:

`cd /etc/nginx/conf.d
cp default.conf nginx-test.conf
`
 
4.	We won’t be modifying the contents of nginx-test.conf since it’s immaterial. Now we’ll stop the container. From the Docker host terminal, type: `docker stop nginx-test`
 
5.	Start the container again: `docker start nginx-test`
 
6.	Open a terminal within the container: `docker exec -it nginx-test bash`
 
7.	Now, see if the changes are still around:

`
cd /etc/nginx/conf.d
ls
default.conf  nginx-test.conf
`
 
8.	Since the container was only stopped, the data persists. Let’s stop, remove the container, and then bring up a new one and observe what happens.
`
docker stop nginx-test
docker rm nginx-test
`
 
9.	Start a new container: `docker run -d --name nginx-test  nginx`
 
10.	Now that a new container is up and running, let’s connect to the container’s terminal: `docker exec -it nginx-test bash`
 
11.	Examine contents of the conf.d directory of nginx:

`cd /etc/nginx/conf.d
ls
default.conf
`

## Docker Volumes
`docker volume create volume-test`
`docker run -it --name volume-test -v:volume-test:/data-volume`
`docker stop volume-test
docker rm volume-test`

