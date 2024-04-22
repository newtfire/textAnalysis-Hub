# How to screen out and remove large or unwanted files from git history

## Quick links

* [Screening out big files: Preventive maintenance with .gitignore](#screening-out-big-files-preventive-maintenance)
* [Removing unwanted files after you committed / pushed them!](#removing-unwanted-files-after-you-committed--pushed-them)
     * [Scenario 1: Removing files that are already in the remote web repo](#scenario-1-removing-files-that-are-already-in-the-remote-web-repo)
     * [Scenario 2: You committed and tried to push a file above 100MB and now the repo is jammed up](#scenario-2-you-committed-and-tried-to-push-a-file-above-100mb-and-now-the-repo-is-jammed-up)
* [How to remove the large file from git's tracking memory](#how-to-remove-the-large-file-from-gits-tracking-memory)
 
  
### Screening out big files: Preventive maintenance
GitHub has a limit on the size of a single file that you may push to the cloud repo (and still use its free service). That limit is 100 MB. 
You can sign up (and pay money for) GitHub to provide a large file size service, but we don't recommend this. Usually it is best not to push gigantic files in the first place.

* If you are working with image / media files and just want to publish them on the web:
     * Transform the image to a standard format for web publishing (jpeg, png, gif). Reduce the image resolution so the image saves as something smaller than 100 MB. 
     * Post your video content on a YouTube channel, and embed the YouTube publication on your website.

* Save a .gitignore file in your repo that identifies a folder in your local computer to screen from git pushes.
    * What even is a .gitignore file, anyway? See <https://www.freecodecamp.org/news/gitignore-what-is-it-and-how-to-add-to-repo/>.
    * We've prepared [this .gitignore file](https://raw.githubusercontent.com/newtfire/textAnalysis-Hub/main/.gitignore) for work in the DIGIT 210 class and we'll periodically update it in this repo.
    * Our .gitignore is designed to screen out Windows, Mac, and Linux system files, and **Python's virtual environment files** across computer platforms.
       * **Even when these are not super-large files** you don't want to push them to a repo that you share on the web, because the files on your local computer are customized to your file system.
       * Others need run the code in their own customized environments. They won't be able to work with your customized environment files.
       * What you push to **shared repo space** should just be the code you've written. Never push "pre-fab" software/installation-generated files.
    * Periodically we may need to update this .gitignore and we'll let current students know we're doing that in our Slack and on Canvas.
    * **Customize and adapt the .gitignore file as needed** when you notice you want to screen something out of shared repo space that we haven't anticipated here! For example:
         * If you use a GitHub repo to share Unity or Unreal projects in a Game class, you should definitely add to your .gitignoore file folders to screen out for these environments.
             * Unity .gitignore: See <https://www.anchorpoint.app/blog/how-to-set-up-a-gitignore-file-for-unity> and <https://github.com/github/gitignore/blob/main/Unity.gitignore>
             * Unreal .gitignore: See <https://www.anchorpoint.app/blog/how-to-set-up-a-gitignore-file-for-unreal-engine>
    * Save the file with *exactly* that filename `.gitignore` at the root level of your local GitHub repo.

### Removing unwanted files after you committed / pushed them!

#### Scenario 1: Removing files that are already in the remote web repo
You already pushed unwanted files to your GitHub repo, **before** you set up the nice .gitignore file. So they're already in place on the web repo. 
Here is how to remove them:

* First, push your .gitignore to your repo. (Push an updated version that makes sure you're properly listing the folders and files you're trying to screen out.)
* Then, to **remove** the already-posted files/folders in your repo that the .gitignore ought to be screening out, enter this command at your repo: 

`git rm -r --cached .`

This command doesn't delete any of your local files, but it does remove them from git's tracking. 
It's crucial that you're navigated to the "root level" of your Github repo when you enter this command. 
The dot `.` at the end of the command means "here in this directory space." The `rm` means "remove", while the `-r` means "recursively" (looking down into all the directories below / inside this space. 
* To complete the removal, you need to **add, commit, and push** the change. 

#### Scenario 2: You committed and tried to push a file above 100MB and now the repo is jammed up

If you committed and tried to push a file that is over 100MB, you probably weren't aware it was that big. 
It might have happened because your .gitignore was not properly screening out a folder or that file. 
You probably tried deleting the file, but that won't work! Why not? 
* *Answer: Because git preserves the file in its tracking memory!*

What you need to do is: **remove the large file from git's tracking memory**. 
You also need to make sure it's screened out by your .gitignore file so it can't ever be included in commits and pushes in future. (See our advice on the .gitignore file in the previous section of this guide.)

#### How to remove the large file from git's tracking memory

We need to filter the memory of your git branch. This is literally revising git's history, and your git tracking will deliver you warning messages as you proceed, because changing git's history is a pretty serious thing.
It's literally *rewriting* the past! We have to do two things:

1. Remove the file from tracking memory and be able to work with your git repo again.
2. **Force push** the changed history up to the web repo.

1. **Remove a file or whole directory from the tracking memory**

Here is a **template** for the command that you will need to adapt. 
To adapt this, we need to know **the filepath from the root of your repo to the file you need to remove from memory**.
In my template, I've made up that path with the part reading: "PATH/TO/BIG/BAD/FILE". You need to change that part.
* You should keep the `/` pointing forward regardless of whether this is Windows or Mac.

**Removing a single file**

This template works "out of the box" for removing just the one file.
(The `\` allows you to enter multiple lines in your shell, while the `/` is for filepath separators.)

```
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch PATH/TO/BIG/BAD/FILE' \
  --prune-empty --tag-name-filter cat -- --all
```

**Removing an entire directory**

We need to add the `-r` flag to the `git rm` command so it can remove all the files inside a directory


```
git filter-branch --force --index-filter \
  'git rm -r --cached --ignore-unmatch PATH/TO/BIG/BAD/FILE' \
  --prune-empty --tag-name-filter cat -- --all
```


**EXAMPLE:** Let's look at an example where you want to remove an entire folder from the git tracking memory: 
Say your huge file is sitting here in your repo. 

```
My-GitHub-Repo/
   |
   myPythonFiles/
       |
       Lib/
        |
        spacy-Large-Language-Model-File
         (This single file is 500+ MB and definitely will choke GitHub) 
```

I've indicated folder names by putting the `/` filepath separator at the end of the name, so the `Lib` is designated as a folder with `/`: `Lib/`

**You already committed the huge file in the Lib folder**, so GitHub chokes up and won't complete the push or let you delete anything and add the deleted change. 
Here's how to adapt my template to screen out the entire Lib folder: Be sure you have the `-r` flag in place in `git rm -r`...:

```
git filter-branch --force --index-filter \
  'git rm -r --cached --ignore-unmatch myPythonFiles/Lib' \
  --prune-empty --tag-name-filter cat -- --all
```

Monitor your shell carefully after you enter this command. Git will warn you that you may be "mangling" the history of your repo (or something awful-sounding like that).
You'll just need to indicate to Git that yes, you're indeed purposefully revising the history of your repo, and it will complete your command. But you're not finished yet! 
We now need to **force push** the altered history up to your web repo! 

2. **Force push the changed history up to the web repo**

You won't be allowed to simply do a `git push` to send that changed history to your repo! Git will want to put the old history back, and it may even prompt you to pull in the original history from your web repo!
**Don't do it!** Instead you need to **force push** the history that you just altered. Here's how to do that:

```
git push origin --force --all
```

**Completion**: Check your web repo to be sure that the files you intended to remove are now actually removed from your repo. 
(If they are not, perhaps you did not enter the correct path in the previous step when you revised the repo history.)

That concludes our guide! We hope this is helpful and timely for you. 
 
### Credits

This guide is adapted from:

* <https://www.freecodecamp.org/news/gitignore-what-is-it-and-how-to-add-to-repo/>
* <https://www.deployhq.com/git/faqs/removing-large-files-from-git-history>

